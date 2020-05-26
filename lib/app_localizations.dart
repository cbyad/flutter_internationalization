import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale) {
    Intl.defaultLocale = locale.languageCode;
  }

  static AppLocalizations of(BuildContext context) =>
      Localizations.of(context, AppLocalizations);

  /// String Value is used as Map Key of [_localizedValues] so must be unique
  static const HOMEPAGETITLE = "homePageTitle";
  static const BODYMSG = "bodyMsg";

  static Map<String, Map<String, String>> _localizedValues = {
    "fr": {
      HOMEPAGETITLE: "Internationalisation exemple",
      BODYMSG: "La vie est un mystère qu'il faut vivre, et non un problème à résoudre.",
    },
    "en": {
      HOMEPAGETITLE: "Internationalization sample",
      BODYMSG: "Life is a mystery to be lived, not a problem to be solved.",
    }
  };

  String localizedValues(String key) =>
      _localizedValues[locale.languageCode][key];
}

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["fr", "en"].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) =>
      SynchronousFuture<AppLocalizations>(AppLocalizations(locale));

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
