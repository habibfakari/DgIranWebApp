import 'dart:io';

import 'package:digiran/pages/splash_screen.dart';
import 'package:digiran/utility/env.dart';
import 'package:digiran/utility/htify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'api/auth_api.dart';
import 'blocs/auth_bloc.dart';
import 'blocs/internet_bloc.dart';
import 'blocs/locale_bloc.dart';
import 'blocs/show_error_bloc.dart';
import 'config.dart';
import 'l10n/app_localizations.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

final apiClient = ApiClient(EnvConfig.baseUrl);
final networkService = NetworkService(apiClient);
final authApi = AuthApi(networkService);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// ✅ فقط حالت عمودی
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// ✅ استایل status/navigation bar
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Conf.backColor,
      systemNavigationBarColor: Conf.backColor,

      /// Android
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,

      /// iOS
      statusBarBrightness: Brightness.dark,
    ),
  );

  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  bool _isRtl(Locale locale) {
    return locale.languageCode == 'fa' ||
        locale.languageCode == 'ar';
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppErrorCubit()),
        BlocProvider(create: (_) => InternetCubit()),
        BlocProvider(create: (_) => LocaleCubit()),

        BlocProvider(
          create: (context) => AuthCubit(
            authApi,
            context.read<AppErrorCubit>(),
          ),
        ),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return BlocBuilder<LocaleCubit, Locale>(
            builder: (context, locale) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,

                title: 'Digiran',

                /// 🌍 زبان
                locale: locale,
                fallbackLocale: const Locale('fa'),

                supportedLocales: const [
                  Locale('fa'),
                  Locale('en'),
                  Locale('ar'),
                  Locale('zh'),
                  Locale('ru'),
                  Locale('tr'),
                ],

                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],

                localeResolutionCallback:
                    (deviceLocale, supportedLocales) {
                  if (deviceLocale == null) {
                    return const Locale('fa');
                  }

                  for (final locale in supportedLocales) {
                    if (locale.languageCode ==
                        deviceLocale.languageCode) {
                      return locale;
                    }
                  }

                  return const Locale('fa');
                },

                theme: ThemeData(
                  useMaterial3: true,
                  fontFamily: 'iranYekan',
                  primaryColor: Conf.primaryColor,
                ),

                builder: (context, child) {
                  Conf.calcWH(context);

                  return Directionality(
                    textDirection:
                    _isRtl(locale)
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: BlocListener<AppErrorCubit, AppError?>(
                      listener: (context, error) {
                        if (error == null) return;

                        String text = error.message;

                        switch (error.message) {
                          case 'unexpectedError':
                            text = AppLocalizations.of(context)!.unexpectedError;
                            break;
                        }
                        ScaffoldMessenger.of(context)
                          ..clearSnackBars()
                          ..showSnackBar(
                            SnackBar(
                              content: Text(text),
                              backgroundColor: Colors.red,
                              behavior:
                              SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                            ),
                          );

                        context
                            .read<AppErrorCubit>()
                            .clear();
                      },
                      child: Stack(
                        children: [
                          child ?? const SizedBox(),

                          /// 🌐 اینترنت
                          BlocBuilder<InternetCubit, InternetStatus>(
                            builder: (context, status) {
                              if (status ==
                                  InternetStatus.connected) {
                                return const SizedBox();
                              }

                              return Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Material(
                                  color: Colors.red,
                                  child: SafeArea(
                                    bottom: false,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(12),
                                      child: Text(
                                        AppLocalizations.of(context)!
                                            .noInternet,
                                        textAlign:
                                        TextAlign.center,
                                        style:
                                        const TextStyle(
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },

                home: const SplashPage(),
              );
            },
          );
        },
      ),
    );
  }
}