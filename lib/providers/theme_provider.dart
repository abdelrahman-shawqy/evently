import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode themeMode =ThemeMode.light;
  bool get isDarkMode => themeMode == ThemeMode.light;

  changeTheme(bool isDark){
    themeMode=isDark?ThemeMode.dark:ThemeMode.light;
    notifyListeners();
  }
  changeThemeHome(ThemeMode mode){

    themeMode = mode ;
    notifyListeners();
  }
}