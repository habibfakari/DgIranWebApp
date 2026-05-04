// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Digiran';

  @override
  String get noInternet => 'No internet connection';

  @override
  String get hello => 'Hello';

  @override
  String get nextLevelLogin => 'Next Step';

  @override
  String get receiveCodeRetry => 'Resend verification code';

  @override
  String get tryReceiveCodeRetry =>
      'Try again to receive the verification code';

  @override
  String get invalidNumber => 'Invalid number';

  @override
  String get requiredNumber => 'Please enter your number';

  @override
  String get mobileNumber => 'Mobile number';

  @override
  String get loginSignup => 'Login | Sign up';

  @override
  String get pleaseFillInputNumber => 'Please enter your mobile number';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get cancel => 'Cancel';

  @override
  String get ok => 'OK';

  @override
  String get enterVerificationCode => 'Enter the verification code';

  @override
  String enterOtp(Object mobile) {
    return 'Enter the 6-digit code sent to \"$mobile\".';
  }

  @override
  String get login => 'Login';
}
