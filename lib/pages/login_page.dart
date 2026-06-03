// import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:io';

import 'package:digiran/blocs/use_extention_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../blocRepositoryState/auth_state.dart';
import '../blocs/auth_bloc.dart';
import '../blocs/locale_bloc.dart';
import '../components/language_selector_button.dart';
import '../components/raised_button.dart';
import '../config.dart';
import '../l10n/app_localizations.dart';
import '../utility/ext.dart';
import '../utility/helpify.dart';
import 'home_page_webview.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool sendMobile = false;
  String mobile = '';
  PhoneNumber? phoneNumber;
  DateTime start = DateTime.now(), waite = DateTime.now();
  bool reached = true;
  String _code = '';
  String fcmToken = '';
  final _formKey = GlobalKey<FormBuilderState>();

  // AuthCubit get userBloc => context.read<AuthCubit>();

  String? initialValue;

  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }

    // We want to round up the remaining time to the nearest second
    d += Duration(microseconds: 999999);
    return "${f(d.inMinutes)}:${f(d.inSeconds % 60)}";
  }

  Widget timerPeriodic(DateTime time) {
    return TimerBuilder.periodic(
      Duration(seconds: 1),
      alignment: Duration.zero,
      builder: (context) {
        // This function will be called every second until the alert time
        var now = DateTime.now();
        var remaining = time.difference(now);
        return Text('ارسال مجدد کد در ${formatDuration(remaining)} دیگر').h4;
      },
    );
  }

  String? appSignature;
  Future<void> getSignCode() async {
    if (Platform.isAndroid) {
      // فقط برای اندروید
      try {
        appSignature = await SmsAutoFill().getAppSignature;
        print('App Signature (Android): $appSignature');
      } catch (e) {
        print('Error getting signature: $e');
      }
    } else if (Platform.isIOS) {
      // در iOS نیازی به signature نیست
      print('iOS: No app signature needed');
      appSignature = 'FA+9qCX9VSu'; // یا هر مقدار پیش‌فرض
    }
  }

  void listenOtp() async {
    await SmsAutoFill().listenForCode;
  }

  getToken() async {
    // FirebaseMessaging.instance.getToken().then((token) {
    //   fcmToken = token ?? '';
    // });
  }

  final FocusNode _phoneFocus = FocusNode();

  // در بالای فایل، بعد از importها
  String sanitizePhoneNumberForIran(String rawInput) {
    // جداول تبدیل اعداد فارسی و عربی به انگلیسی
    const persianNumbers = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
    const arabicNumbers = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];
    const englishNumbers = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

    String result = rawInput;

    // تبدیل هر رقم فارسی یا عربی به انگلیسی
    for (int i = 0; i < 10; i++) {
      result = result
          .replaceAll(persianNumbers[i], englishNumbers[i])
          .replaceAll(arabicNumbers[i], englishNumbers[i]);
    }

    // هیچ کاراکتر دیگری حذف نمی‌شود
    // + و - و فاصله و ... سر جای خودشان می‌مانند
    return result;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_phoneFocus);
    });
    start = DateTime.now();
    waite = DateTime.now();
    getToken();
    getSignCode();
    listenOtp();
    initialValue = '';
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (_) => WebAppPage()),
                  (route) => false,
            );
            return false;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: TimerBuilder.scheduled(
                [start, waite],
                builder: (context) {
                  var now = DateTime.now();
                  reached = now.compareTo(start) >= 0;
                  // if (reached == false) {
                  //   _timer = false;
                  // }
                  return FormBuilder(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: Container(
                                margin: Conf.xlEdge,
                                padding: Conf.xlEdge,
                                // decoration: Conf.boxDecoration(
                                //     color: Conf.lightColor,
                                //     brRadius: Conf.threeBorderRadius),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(builder: (_) => WebAppPage()),
                                              (route) => false,
                                        );
                                      },
                                      icon: Icon(FeatherIcons.arrowRight),
                                    ),
                                    Align(
                                      alignment: AlignmentGeometry.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(top: Conf.xlSize, bottom: Conf.xlSize),
                                        child: FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.asset('assets/img/logo.png', fit: BoxFit.cover, width: 20.w),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: Conf.xxlSize),
                                      child: Text(
                                        sendMobile ? AppLocalizations.of(context)!.enterVerificationCode : AppLocalizations.of(context)!.loginSignup,
                                      ).h3.fat,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: Conf.xlSize),
                                      child: Text(
                                        sendMobile && reached == false
                                            ? AppLocalizations.of(context)!.enterOtp(phoneNumber?.number ?? '')
                                            : sendMobile && reached == true
                                            ? ''
                                            : AppLocalizations.of(context)!.pleaseFillInputNumber,
                                      ).h4.darkGreyColor,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.only(top: Conf.xxlSize),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: [
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: !sendMobile
                                                    ? Column(
                                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                                        children: [
                                                          Padding(
                                                            padding: EdgeInsets.only(bottom: Conf.xlSize),
                                                            child: Text(
                                                              AppLocalizations.of(context)!.mobileNumber,
                                                            ).h4.bold,
                                                          ),
                                                          Directionality(
                                                            textDirection: TextDirection.ltr,
                                                            child: IntlPhoneField(
                                                              focusNode: _phoneFocus,
                                                              autofocus: true,
                                                              decoration: Conf.iDeco.copyWith(filled: true),
                                                              initialCountryCode: 'IR',
                                                              onChanged: (phone) {
                                                                // تمیز کردن شماره
                                                                String cleanNumber = sanitizePhoneNumberForIran(phone.completeNumber ?? phone.number ?? '');

                                                                // ساخت شیء PhoneNumber جدید
                                                                phoneNumber = PhoneNumber(
                                                                  countryCode: phone.countryCode ?? '98',
                                                                  countryISOCode: phone.countryISOCode ?? 'IR',
                                                                  number: sanitizePhoneNumberForIran(phone.number),
                                                                );
                                                              },
                                                              invalidNumberMessage: AppLocalizations.of(
                                                                context,
                                                              )!.invalidNumber,
                                                              validator: (phone) {
                                                                String cleanNumber = sanitizePhoneNumberForIran(phone!.completeNumber);

                                                                // ساخت شیء PhoneNumber جدید
                                                                phoneNumber = PhoneNumber(
                                                                  countryCode: phone.countryCode ?? '98',
                                                                  countryISOCode: phone.countryISOCode ?? 'IR',
                                                                  number: sanitizePhoneNumberForIran(phone.number),
                                                                );
                                                                if (phoneNumber == null || phoneNumber!.number.isEmpty) {
                                                                  return AppLocalizations.of(context)!.requiredNumber;
                                                                }
          
                                                                try {
                                                                  if (!phoneNumber!.isValidNumber()) {
                                                                    return AppLocalizations.of(context)!.invalidNumber;
                                                                  }
                                                                } catch (e) {
                                                                  return AppLocalizations.of(context)!.invalidNumber;
                                                                }
          
                                                                return null;
                                                              },
                                                              initialValue: phoneNumber?.completeNumber,
                                                              keyboardType: TextInputType.phone,
                                                            ),
                                                          ),
                                                          // FormBuilderTextField(
                                                          //   name: 'mobile',
                                                          //   key: Key(mobile),
                                                          //   maxLength: 11,
                                                          //   decoration: Conf.iDeco.copyWith(filled: true),
                                                          //   validator: FormBuilderValidators.compose([
                                                          //     FormBuilderValidators.required(errorText: 'required'),
                                                          //   ]),
                                                          //   initialValue: initialValue,
                                                          //   keyboardType: TextInputType.phone,
                                                          //   onChanged: (value) {},
                                                          // ),
                                                        ],
                                                      )
                                                    : reached == false
                                                    ? Column(
                                                        children: [
                                                          Directionality(
                                                            textDirection: TextDirection.ltr,
                                                            child: Container(
                                                              width: double.infinity,
                                                              margin: EdgeInsets.only(
                                                                bottom: Conf.xxlSize,
                                                                left: Conf.xxlSize ,
                                                                right: Conf.xxlSize ,
                                                              ),
                                                              child: PinFieldAutoFill(
                                                                cursor: Cursor(
                                                                  enabled: true,
                                                                  color: Conf.primaryColor,
                                                                  width: 1,
                                                                ),
                                                                enableInteractiveSelection: false,
                                                                decoration: BoxLooseDecoration(
                                                                  strokeColorBuilder: FixedColorBuilder(
                                                                    Conf.primaryColor,
                                                                  ),
                                                                  gapSpace: 10,
                                                                ),
                                                                // UnderlineDecoration(
                                                                // colorBuilder: FixedColorBuilder(Conf.primaryColor), textStyle: TextStyle(color: Conf.primaryColor,fontSize: 18),), //code submitted callback
                                                                onCodeChanged: (value) async{
                                                                  print('value ===> ${value}');
                                                                  // final storage = new FlutterSecureStorage();
                                                                  // int counter = await Conf.getCountLogin();
                                                                  _code = value!;
                                                                  if (value.length == 6) {
                                                                    FocusScope.of(context).requestFocus(FocusNode());
                                                                    final mobile = phoneNumber!.completeNumber.replaceFirst('+', '');
                                                                    await context.auth.loginVerify({
                                                                      "otp_code":_code,
                                                                      "phone_number": mobile
                                                                    });
                                                                    final prefs = await SharedPreferences.getInstance();
                                                                    final token = prefs.getString('token');
                                                                    final cookieManager = CookieManager.instance();
                                                                    final locale = context.read<LocaleCubit>().state;
          
          // TOKEN
                                                                    await cookieManager.setCookie(
                                                                      url: WebUri("https://digiran.io"),
                                                                      name: "token",
                                                                      value: token ?? '',
                                                                      domain: "digiran.io",
                                                                      path: "/",
                                                                      isSecure: true,
                                                                      isHttpOnly: false,
                                                                    );
          
          // LANGUAGE
                                                                    await cookieManager.setCookie(
                                                                      url: WebUri("https://digiran.io"),
                                                                      name: "lang",
                                                                      value: locale.languageCode,
                                                                      domain: "digiran.io",
                                                                      path: "/",
                                                                      isSecure: true,
                                                                      isHttpOnly: false,
                                                                    );
          
                                                                    Navigator.pop(context, true);
                                                                    // userBloc.loginStep2(context,code: _code,fcmToken: fcmToken,method: ()async{
                                                                    // if(Conf.isNew == true){
                                                                    //   Navify.pushReplacement(context, SignUpStepTwoPage());
                                                                    // }else{
                                                                    //   if(userBloc.state.userModel?.userType == 'marketer' ){
                                                                    //     Navify.pushReplacement(context, MasBottomNavigation());
                                                                    //   }
                                                                    //   if(userBloc.state.userModel?.userType == 'super_admin'){
                                                                    //     Navify.pushReplacement(context, MasBottomNavigationManager());
                                                                    //   }
                                                                    //   if(userBloc.state.userModel?.userType == 'city_admin'){
                                                                    //     Navify.pushReplacement(context, MasBottomNavigationSalesManager());
                                                                    //   }
                                                                    // }
                                                                    // },);
                                                                  }
                                                                },
                                                                currentCode: _code,
                                                                //code changed callback
                                                                codeLength: 6, //code length, default 6
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.symmetric(vertical: Conf.xlSize),
                                                            child: reached == true
                                                                ? Text(
                                                                    '00'
                                                                    ":"
                                                                    '00',
                                                                    style: TextStyle(fontSize: Conf.mdText - 4),
                                                                  )
                                                                : timerPeriodic(start),
                                                          ),
                                                        ],
                                                      )
                                                    : Center(
                                                        child: Column(
                                                          children: [
                                                            Text(AppLocalizations.of(context)!.tryReceiveCodeRetry),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(vertical: Conf.xlSize),
                                                              child: TextButton(
                                                                onPressed: () async{
                                                                  final mobile = phoneNumber!.completeNumber.replaceFirst('+', '');
          
                                                                  await context.auth.login({
                                                                    "phone_number": mobile,
                                                                    "app_signature": appSignature,
                                                                  });
                                                                  final state = context.read<AuthCubit>().state;
          
                                                                  if (state.error == null) {
                                                                    setState(() {
                                                                      _code = '';
                                                                      start = DateTime.now().add(const Duration(minutes: 3));
                                                                      sendMobile = true;
                                                                    });
                                                                  }
                                                                  // setState(() {
                                                                  //   _code = '';
                                                                  //   start = DateTime.now().add(Duration(minutes: 3));
                                                                  //   sendMobile = true;
                                                                    /*  userBloc.loginStep1(context,
                                                              // referralCode: referralCode,
                                                              method: (){
                                                                start = DateTime.now().add(Duration(minutes: 1));
                                                                sendMobile = true;
                                                              });*/
                                                                  // });
                                                                },
                                                                child: Text(
                                                                  AppLocalizations.of(context)!.receiveCodeRetry,
                                                                  style: TextStyle(decoration: TextDecoration.underline),
                                                                ).h4.bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: 11.h,
                          left: Conf.xxlSize,
                          right: Conf.xxlSize,
                          child: LanguageSelectorButton(),
                        ),
                        Positioned(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                          left: 0,
                          right: 0,
                          child: KeyboardVisibilityBuilder(
                            builder: (context, visible) {
                              return Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    margin: visible || sendMobile
                                        ? Conf.xxlEdge.copyWith(bottom: Conf.xlSize)
                                        : Conf.xxlEdge,
                                    child: MasRaisedButton(
                                      text: state.loading == true ? '' :!sendMobile ? AppLocalizations.of(context)!.nextLevelLogin: AppLocalizations.of(context)!.login,
                                      color: state.loading == true ? Conf.grayColor : Conf.primaryColor,
                                      onPressed: !sendMobile
                                          ? () async{
                                        FocusManager.instance.primaryFocus?.unfocus();

                                        if (phoneNumber == null || !phoneNumber!.isValidNumber()) {
                                          Helpify.warn(
                                            context,
                                            title: AppLocalizations.of(context)!.invalidNumber,
                                          );
                                          return;
                                        }

                                        final mobile = phoneNumber!.completeNumber.replaceFirst('+', '');
          
                                        await context.auth.login({
                                          "phone_number": mobile,
                                          "app_signature": appSignature,
                                        });
                                              final state = context.read<AuthCubit>().state;
          
                                              if (state.error == null) {
                                                setState(() {
                                                  start = DateTime.now().add(const Duration(minutes: 3));
                                                  sendMobile = true;
                                                });
                                              }
                                            }
                                          : () async{
                                              if (_code.length == 6) {
                                                FocusScope.of(context).requestFocus(FocusNode());
                                                final mobile = phoneNumber!.completeNumber.replaceFirst('+', '');
                                                await context.auth.loginVerify({
                                                  "otp_code":_code,
                                                  "phone_number": mobile
                                                });
                                                final prefs = await SharedPreferences.getInstance();
                                                final token = prefs.getString('token');
                                                final cookieManager = CookieManager.instance();
                                                final locale = context.read<LocaleCubit>().state;
          
          // TOKEN
                                                await cookieManager.setCookie(
                                                  url: WebUri("https://digiran.io"),
                                                  name: "token",
                                                  value: token ?? '',
                                                  domain: "digiran.io",
                                                  path: "/",
                                                  isSecure: true,
                                                  isHttpOnly: false,
                                                );
          
          // LANGUAGE
                                                await cookieManager.setCookie(
                                                  url: WebUri("https://digiran.io"),
                                                  name: "lang",
                                                  value: locale.languageCode,
                                                  domain: "digiran.io",
                                                  path: "/",
                                                  isSecure: true,
                                                  isHttpOnly: false,
                                                );
          
                                                Navigator.pop(context, true);
                                              } else {
                                                Helpify.warn(context, title: AppLocalizations.of(context)!.enterVerificationCode);
                                              }
                                            },
                                      child: state.loading == true ? Conf.loadingOnButtonWidget() : null,
                                    ),
                                  ),
                                  sendMobile == true && !visible
                                      ? Padding(
                                          padding: EdgeInsets.only(bottom: Conf.xxlSize),
                                          child: TextButton(
                                            onPressed: () {
                                              setState(() {
                                                sendMobile = false;
                                              });
                                            },
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Icon(FeatherIcons.edit, color: Conf.primaryColor),
                                                Padding(
                                                  padding: EdgeInsets.only(right: Conf.xlSize),
                                                  child: Text(AppLocalizations.of(context)!.editMobileNumber).pColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : Container(),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
