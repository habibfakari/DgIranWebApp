import 'dart:developer';
import 'dart:io';
import 'package:digiran/pages/login_page.dart';
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
import 'blocs/internet_bloc.dart';
import 'blocs/locale_bloc.dart';
import 'blocs/auth_bloc.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Conf.backColor,
    statusBarColor: Conf.backColor,
    /// ✅ آیکون‌های status bar روشن
    statusBarIconBrightness: Brightness.light,

/*    /// ✅ آیکون‌های navigation bar روشن
    systemNavigationBarIconBrightness: Brightness.light,

    /// iOS
    statusBarBrightness: Brightness.dark,*/
  ));

  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

final apiClient = ApiClient(EnvConfig.baseUrl);
final networkService = NetworkService(apiClient);
final authApi = AuthApi(networkService);

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => AppErrorCubit()),
        BlocProvider(create: (_) => InternetCubit()),
        BlocProvider(create: (_) => LocaleCubit()),
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => AuthCubit(
                  authApi,
                  context.read<AppErrorCubit>(), // ✅ الان اوکیه
                ),
              ),
            ],
            child: Sizer(
              builder: (context, orientation, deviceType) {
                return BlocBuilder<LocaleCubit, Locale>(
                  builder: (context, locale) {
                    // print("🔥 CURRENT LOCALE: $locale");
                    return BlocListener<AppErrorCubit, AppError?>(
                        listener: (context, message) {
                          if (message != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message.message),
                                backgroundColor: Colors.red,
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(16),
                              ),
                            );
            
                            // بعد از نمایش پاک شود
                            context.read<AppErrorCubit>().clear();
                          }
                        },
                        child:  Directionality(
                          textDirection: (locale.languageCode == 'fa' || locale.languageCode == 'ar')
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: GetMaterialApp(
                            debugShowCheckedModeBanner: false,
            
                            /// 🌍 زبان
                            locale: locale,
                            translations: null,
                            fallbackLocale: const Locale('fa'),
                            supportedLocales: const [
                              Locale('fa'),
                              Locale('en'),
                              Locale('ar'),
                              Locale('zh'),
                              Locale('ru'),
                              Locale('tr'),
                            ],
            
                            localizationsDelegates:  [
                              AppLocalizations.delegate, // ✅ مهم
                              GlobalMaterialLocalizations.delegate,
                              GlobalWidgetsLocalizations.delegate,
                              GlobalCupertinoLocalizations.delegate,
                            ],
            
                            title: 'Digiran',
            
                            theme: ThemeData(
                              fontFamily: 'iranYekan',
                              primaryColor: Conf.primaryColor,
                            ),

                            localeResolutionCallback: (locale, supportedLocales) {
                              return locale;
                            },
            
                            /// 🎯 مدیریت سراسری
                            builder: (context, child) {
                              Conf.calcWH(context);
                              return Stack(
                                children: [
                                  child ?? const SizedBox(),
            
                                  /// 🔴 اینترنت
                                  BlocBuilder<InternetCubit, InternetStatus>(
                                    builder: (context, status) {
                                      if (status == InternetStatus.connected) {
                                        return const SizedBox();
                                      }
            
                                      return Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                          color: Colors.red,
                                          padding: const EdgeInsets.all(8),
                                          child: SafeArea(
                                            child: Text(
                                              AppLocalizations.of(context)!.noInternet,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
            
                            home: const SplashPage(),
                          ),
                        )
                    );
                  },
                );
              },
            ),
          );
        }
      ),
    );
  }
}