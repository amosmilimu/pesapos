import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeProvider() {
    _themeMode = ThemeMode.system;
    _loadThemeMode();
  }

  ThemeMode get themeMode => _themeMode!;

  void _loadThemeMode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    _themeMode = (preferences.getString('themeMode') ?? 'system') == 'light'
        ? ThemeMode.light
        : ThemeMode.dark;
    notifyListeners();
  }

  void toggleTheme() async {
    if (_themeMode == ThemeMode.dark) {
      _themeMode = ThemeMode.light;
    } else {
      _themeMode = ThemeMode.dark;
    }
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('themeMode', _themeMode == ThemeMode.light ? 'light' : 'dark');
    notifyListeners();
  }
}