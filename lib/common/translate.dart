import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TranslateLocalizations {
  final String localName;

  TranslateLocalizations(this.localName);

   static const LocalizationsDelegate<TranslateLocalizations> delegate= _TranslateLocalizations();
  String get emptyList {
    if (localName == 'en') {
      return 'Aadd en expense';
    }
    if (localName == 'es') {
      return 'agrege';
    } else {
      return 'uknow Lang $localName';
    }
  }

  static of(BuildContext context) {}
}

class _TranslateLocalizations
    extends LocalizationsDelegate<TranslateLocalizations> {
      const _TranslateLocalizations();
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['es', 'en'].contains(locale.languageCode);
  }

  @override
  Future<TranslateLocalizations> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<TranslateLocalizations>(
        TranslateLocalizations(locale.languageCode));
  }

  @override
  bool shouldReload(
      covariant LocalizationsDelegate<TranslateLocalizations> old) {
    return false;
  }
}
