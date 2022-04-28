import 'package:flutter/material.dart';
import 'package:foot_wear_v6001/constants/localization/strings.dart';

import 'english_text.dart';
import 'french_text.dart';
class AppLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'fr'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => _load(locale);

  Future<Strings> _load(Locale locale) async {
    switch (locale.languageCode) {
      case 'en':
        return EnglishText();
      case 'fr':
        return FrenchText();
      default:
        return EnglishText();
    }
  }

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;
}
