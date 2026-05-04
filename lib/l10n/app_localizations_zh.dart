// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'Digiran';

  @override
  String get noInternet => '无网络连接';

  @override
  String get hello => '你好';

  @override
  String get nextLevelLogin => '下一步';

  @override
  String get receiveCodeRetry => '重新发送验证码';

  @override
  String get tryReceiveCodeRetry => '请重试获取验证码';

  @override
  String get invalidNumber => '号码无效';

  @override
  String get requiredNumber => '请输入号码';

  @override
  String get mobileNumber => '手机号码';

  @override
  String get loginSignup => '登录 | 注册';

  @override
  String get pleaseFillInputNumber => '请输入您的手机号码';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get cancel => '取消';

  @override
  String get ok => '确认';

  @override
  String get enterVerificationCode => '请输入验证码';

  @override
  String enterOtp(Object mobile) {
    return '请输入发送到“$mobile”的6位验证码。';
  }

  @override
  String get login => '登录';
}
