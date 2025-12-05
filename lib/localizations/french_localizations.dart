import 'package:flutter/material.dart';

class FrenchMaterialLocalizations extends DefaultMaterialLocalizations {
  const FrenchMaterialLocalizations();

  String get datePickerHelpText => 'SÉLECTIONNER LA DATE';
  String get datePickerHeadlineText => 'SÉLECTIONNÉ';
  String get datePickerInputHelpText => 'JJ/MM/AAAA';
  String get dateRangePickerHelpText => 'SÉLECTIONNER LA PLAGE DE DATES';
  String get cancelButtonLabel => 'ANNULER';
  String get okButtonLabel => 'OK';
  String get todayLabel => 'AUJOURD\'HUI';
}

class FrenchWidgetsLocalizations extends DefaultWidgetsLocalizations {
  const FrenchWidgetsLocalizations();
}

class FrenchLocalizationsDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FrenchLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => locale.languageCode == 'fr';

  @override
  Future<MaterialLocalizations> load(Locale locale) async {
    return const FrenchMaterialLocalizations();
  }

  @override
  bool shouldReload(FrenchLocalizationsDelegate old) => false;
}
