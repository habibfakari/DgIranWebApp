import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/locale_bloc.dart';
import '../config.dart';
import '../l10n/app_localizations.dart';

class LanguageItem {
  final String title;
  final String code;

  LanguageItem(this.title, this.code);
}

final List<LanguageItem> languages = [
  LanguageItem('فارسی', 'fa'),
  LanguageItem('English', 'en'),
  LanguageItem('العربية', 'ar'),
  LanguageItem('中文', 'zh'),
  LanguageItem('Русский', 'ru'),
  LanguageItem('Türkçe', 'tr'),
];

class LanguageSelectorButton extends StatelessWidget {
  const LanguageSelectorButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus(); // 🔥 قوی‌تر

        _openBottomSheet(context);
      },
      child:  Text(AppLocalizations.of(context)!.selectLanguage,),
    );
  }

  void _openBottomSheet(BuildContext context) {
    final currentLocale = context.read<LocaleCubit>().state;

    String selectedCode = currentLocale.languageCode;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// عنوان
                   Text(
                     AppLocalizations.of(context)!.selectLanguage,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 16),

                  /// لیست زبان‌ها
                  ...languages.map((lang) {
                    return RadioListTile<String>(
                      title: Text(lang.title),
                      value: lang.code,
                      groupValue: selectedCode,
                      onChanged: (value) {
                        setState(() {
                          selectedCode = value!;
                        });
                      },
                    );
                  }),

                  const SizedBox(height: 16),

                  /// دکمه‌ها
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        /// انصراف
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child:  Text(AppLocalizations.of(context)!.cancel),
                          ),
                        ),

                        const SizedBox(width: 10),

                        /// تایید
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              context
                                  .read<LocaleCubit>()
                                  .changeLocale(selectedCode);

                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(backgroundColor: Conf.primaryColor),
                            child:  Text(AppLocalizations.of(context)!.ok,style: TextStyle(color: Conf.lightColor),),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        );
      },
    );
  }
}