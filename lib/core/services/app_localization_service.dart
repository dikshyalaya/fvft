import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Service [AppLocalizations] : Custom Language Service for Localizing
class AppLocalizations {
  final Locale? locale;

  static const LocalizationsDelegate<AppLocalizations>? delegate =
      _AppLocalizationDelegate();

  Map<String, dynamic>? _localizedStrings;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// FUNC [load] : Load the language files from json
  Future load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale!.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value));
  }

  /// FUNC [translate] : Translate the texts into language specific
  dynamic translate(String key) {
    return _localizedStrings![key];
  }
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'ne'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations appLocalizations = AppLocalizations(locale);
    await appLocalizations.load();
    return appLocalizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
