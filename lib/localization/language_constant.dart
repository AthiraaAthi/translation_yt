import 'package:auto_translate_checking/localization/demo_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LAGUAGE_CODE = 'languageCode';

///languages code

const String ENGLISH = 'en';

const String FARSI = 'fa';

const String ARABIC = 'ar';

const String HINDI = 'hi';

/// To store and save the selected language according to the language code

Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  await _prefs.setString(LAGUAGE_CODE, languageCode);

  return _locale(languageCode);
}

Future<Locale> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();

  String languageCode = _prefs.getString(LAGUAGE_CODE) ?? "en";

  return _locale(languageCode);
}

// switch statements

Locale _locale(String languageCode) {
  switch (languageCode) {
    case ENGLISH:
      return Locale(ENGLISH, 'US');

    case ARABIC:
      return Locale(ARABIC, "SA");

    case HINDI:
      return Locale(HINDI, "IN");

    default:
      return Locale(ENGLISH, 'US');
  }
}

String? getTranslated(BuildContext context, String key) {
  return DemoLocalization.of(context)?.translate(key);
}
