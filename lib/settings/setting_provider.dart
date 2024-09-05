import 'package:flutter/material.dart';
import 'package:news_app_route/settings/setting_repo.dart';


class SettingProvider with ChangeNotifier {
  String _language = 'en';
  String get language => _language;

  SettingProvider() {
    loadPreferences();
  }

  Future<void> loadPreferences() async {
    _language = await SettingPref.loadLanguage();
    notifyListeners();
  }

  Future<void> _savePreferences() async {
    await SettingPref.saveLanguage(_language);
  }


  void changeLanguage(String lang) {
    if (_language != lang) {
      _language = lang;
      _savePreferences();
      notifyListeners();
    }
  }
}
