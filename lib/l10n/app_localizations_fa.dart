// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Persian (`fa`).
class AppLocalizationsFa extends AppLocalizations {
  AppLocalizationsFa([String locale = 'fa']) : super(locale);

  @override
  String get appTitle => 'دیجیران';

  @override
  String get noInternet => 'اینترنت شما قطع است';

  @override
  String get hello => 'سلام';

  @override
  String get nextLevelLogin => 'مرحله بعد';

  @override
  String get receiveCodeRetry => 'دریافت مجدد کد تایید';

  @override
  String get tryReceiveCodeRetry => 'برای دریافت کد تایید مجدد تلاش کنید';

  @override
  String get invalidNumber => 'شماره معتبر نیست';

  @override
  String get requiredNumber => 'شماره را وارد کنید';

  @override
  String get mobileNumber => 'شماره موبایل';

  @override
  String get loginSignup => 'ورود | ثبت نام';

  @override
  String get pleaseFillInputNumber => 'لطفا شماره موبایل خود را وارد کنید';

  @override
  String get selectLanguage => 'انتخاب زبان';

  @override
  String get cancel => 'انصراف';

  @override
  String get ok => 'تایید';

  @override
  String get enterVerificationCode => 'کد تایید را وارد کنید';

  @override
  String enterOtp(Object mobile) {
    return 'کد شش رقمی پیامک شده به \"$mobile\" را وارد کنید.';
  }

  @override
  String get login => 'ورود';

  @override
  String get exit => 'خروج';

  @override
  String get exitAppQuestion => 'آیا می‌خواهید از برنامه خارج شوید؟';

  @override
  String get yes => 'بله';

  @override
  String get no => 'خیر';
}
