import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode themeMode =ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.dark;

  changeTheme(bool isDark){
    themeMode=isDark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
}