import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit() : super(_defaultLocale) {
    _loadLocale();
  }

  static const _key = 'app_locale';

  /// ✅ پیش‌فرض
  static const Locale _defaultLocale = Locale('fa', 'IR');

  /// ✅ زبان‌های پشتیبانی‌شده
  static const supportedLocales = [
    Locale('fa', 'IR'),
    Locale('en', 'US'),
    Locale('ar', 'AE'),
    Locale('zh', 'CN'),
    Locale('ru', 'RU'),
    Locale('tr', 'TR'),
  ];

  /// ✅ تبدیل امن
  Locale _mapLocale(String code) {
    switch (code) {
      case 'fa':
        return const Locale('fa', 'IR');
      case 'ar':
        return const Locale('ar', 'AE');
      case 'zh':
        return const Locale('zh', 'CN');
      case 'ru':
        return const Locale('ru', 'RU');
      case 'tr':
        return const Locale('tr', 'TR');
      case 'en':
      default:
        return const Locale('en', 'US');
    }
  }

  /// ✅ لود از storage
  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final langCode = prefs.getString(_key);

    if (langCode == null) {
      emit(_defaultLocale);
      return;
    }

    emit(_mapLocale(langCode));
  }

  /// ✅ تغییر زبان
  Future<void> changeLocale(String langCode) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, langCode);

    emit(_mapLocale(langCode));
    Get.updateLocale(_mapLocale(langCode));
  }

}

// context.read<LocaleCubit>().changeLocale('fa');