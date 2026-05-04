// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'Digiran';

  @override
  String get noInternet => 'İnternet bağlantısı yok';

  @override
  String get hello => 'Merhaba';

  @override
  String get nextLevelLogin => 'Sonraki Adım';

  @override
  String get receiveCodeRetry => 'Doğrulama kodunu yeniden gönder';

  @override
  String get tryReceiveCodeRetry =>
      'Doğrulama kodunu almak için tekrar deneyin';

  @override
  String get invalidNumber => 'Geçersiz numara';

  @override
  String get requiredNumber => 'Lütfen numarayı girin';

  @override
  String get mobileNumber => 'Telefon numarası';

  @override
  String get loginSignup => 'Giriş | Kayıt ol';

  @override
  String get pleaseFillInputNumber => 'Lütfen telefon numaranızı girin';

  @override
  String get selectLanguage => 'Dil seçimi';

  @override
  String get cancel => 'İptal';

  @override
  String get ok => 'Tamam';

  @override
  String get enterVerificationCode => 'Doğrulama kodunu girin';

  @override
  String enterOtp(Object mobile) {
    return '\"$mobile\" numarasına gönderilen 6 haneli kodu girin.';
  }

  @override
  String get login => 'Giriş';
}
