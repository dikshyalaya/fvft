import 'package:flutter/material.dart';

class LanguageUtils {
  /// Language List File: Created for adding others languages in future
  static final List<Object>? _supportedLanguages = [
    {'locale': 'English', 'language_code': 'en', 'country_code': 'US'},

    /// [नेपाली]
    {'locale': 'नेपाली', 'language_code': 'ne', 'country_code': 'NP'},
  ];

  /// FUNC [_getSupportedLanguage] : Get list of all supported languages
  static List<Locale> getSupportedLanguage() {
    List<Locale> supportedLocales = _supportedLanguages!
        .map(
          (Object e) => Locale(
            (e as Map<String, String>)['language_code']!,
            (e)['country_code'],
          ),
        )
        .toList();
    return supportedLocales;
  }
}
