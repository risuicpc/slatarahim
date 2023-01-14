import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const String siltigna = 'ስልጥኛ';
const String amharic = 'አመርኛ';
const String english = 'English';
const String sl = 'sl';
const String am = 'am';
const String en = 'en';

class Language {
  final int id;
  final String name;
  final String code;

  Language(this.id, this.name, this.code);

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Language &&
            other.name == name &&
            other.code == code);
  }

  static List<Language> languageList() {
    return <Language>[
      Language(1, siltigna, sl),
      Language(2, amharic, am),
      Language(3, english, en),
    ];
  }
}

Locale locale(String? languageCode) {
  switch (languageCode) {
    case sl:
      return const Locale(sl, '');
    case am:
      return const Locale(am, '');
    case en:
      return const Locale(en, '');
    default:
      return const Locale(am, '');
  }
}

Language language(String? languageCode) {
  switch (languageCode) {
    case sl:
      return Language(1, siltigna, sl);
    case am:
      return Language(2, amharic, am);
    case en:
      return Language(3, english, en);
    default:
      return Language(2, amharic, am);
  }
}

AppLocalizations trans(BuildContext context) {
  return AppLocalizations.of(context)!;
}
