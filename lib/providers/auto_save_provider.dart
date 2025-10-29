import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AutoSaveProvider extends ChangeNotifier {
  static const _saveDelay = Duration(seconds: 2);
  final SharedPreferences _prefs;
  Timer? _saveTimer;

  AutoSaveProvider(this._prefs);

  // Initialize the provider
  static Future<AutoSaveProvider> init() async {
    final prefs = await SharedPreferences.getInstance();
    return AutoSaveProvider(prefs);
  }

  // Save form data with debounce
  void saveFormData(String key, String value) {
    _saveTimer?.cancel();
    _saveTimer = Timer(_saveDelay, () {
      _prefs.setString(key, value);
      notifyListeners();
    });
  }

  // Get saved form data
  String? getFormData(String key) {
    return _prefs.getString(key);
  }

  // Clear saved form data
  Future<void> clearFormData(String key) async {
    await _prefs.remove(key);
    notifyListeners();
  }

  @override
  void dispose() {
    _saveTimer?.cancel();
    super.dispose();
  }
}
