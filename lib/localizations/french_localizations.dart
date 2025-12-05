// lib/localizations/french_localizations.dart
import 'package:flutter/material.dart';

class FrenchMaterialLocalizations extends DefaultMaterialLocalizations {
  const FrenchMaterialLocalizations();

  @override
  String get datePickerHelpText => 'SÉLECTIONNER LA DATE';
  
  @override
  String get datePickerHeadlineText => 'SÉLECTIONNÉ';
  
  @override
  String get datePickerInputHelpText => 'JJ/MM/AAAA';
  
  @override
  String get dateRangePickerHelpText => 'SÉLECTIONNER LA PLAGE DE DATES';
  
  @override
  String get cancelButtonLabel => 'ANNULER';
  
  @override
  String get okButtonLabel => 'OK';
  
  @override
  String get todayLabel => 'AUJOURD\'HUI';
}

class FrenchWidgetsLocalizations extends DefaultWidgetsLocalizations {
  const FrenchWidgetsLocalizations();
}

class FrenchLocalizationsDelegate extends LocalizationsDelegate<MaterialLocalizations> {
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