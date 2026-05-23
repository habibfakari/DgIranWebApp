// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'ديجيران';

  @override
  String get noInternet => 'لا يوجد اتصال بالإنترنت';

  @override
  String get hello => 'مرحبا';

  @override
  String get nextLevelLogin => 'الخطوة التالية';

  @override
  String get receiveCodeRetry => 'إعادة إرسال رمز التحقق';

  @override
  String get tryReceiveCodeRetry => 'حاول مرة أخرى للحصول على رمز التحقق';

  @override
  String get invalidNumber => 'رقم غير صالح';

  @override
  String get requiredNumber => 'يرجى إدخال الرقم';

  @override
  String get mobileNumber => 'رقم الجوال';

  @override
  String get loginSignup => 'تسجيل الدخول | إنشاء حساب';

  @override
  String get pleaseFillInputNumber => 'يرجى إدخال رقم الجوال';

  @override
  String get selectLanguage => 'اختيار اللغة';

  @override
  String get cancel => 'إلغاء';

  @override
  String get ok => 'تأكيد';

  @override
  String get enterVerificationCode => 'أدخل رمز التحقق';

  @override
  String enterOtp(Object mobile) {
    return 'أدخل رمز التحقق المكون من 6 أرقام المرسل إلى \"$mobile\".';
  }

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get exit => 'خروج';

  @override
  String get exitAppQuestion => 'هل تريد الخروج من التطبيق؟';

  @override
  String get yes => 'نعم';

  @override
  String get no => 'لا';

  @override
  String get editMobileNumber => 'تعديل رقم الهاتف';

  @override
  String get unexpectedError => 'حدث خطأ غير متوقع';
}
