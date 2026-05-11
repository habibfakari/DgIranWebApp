// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Digiran';

  @override
  String get noInternet => 'Нет подключения к интернету';

  @override
  String get hello => 'Здравствуйте';

  @override
  String get nextLevelLogin => 'Следующий шаг';

  @override
  String get receiveCodeRetry => 'Повторно отправить код';

  @override
  String get tryReceiveCodeRetry => 'Попробуйте снова получить код';

  @override
  String get invalidNumber => 'Неверный номер';

  @override
  String get requiredNumber => 'Введите номер';

  @override
  String get mobileNumber => 'Номер телефона';

  @override
  String get loginSignup => 'Вход | Регистрация';

  @override
  String get pleaseFillInputNumber => 'Пожалуйста, введите номер телефона';

  @override
  String get selectLanguage => 'Выбор языка';

  @override
  String get cancel => 'Отмена';

  @override
  String get ok => 'ОК';

  @override
  String get enterVerificationCode => 'Введите код подтверждения';

  @override
  String enterOtp(Object mobile) {
    return 'Введите 6-значный код, отправленный на \"$mobile\".';
  }

  @override
  String get login => 'Войти';

  @override
  String get exit => 'Выход';

  @override
  String get exitAppQuestion => 'Вы хотите выйти из приложения?';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';
}
