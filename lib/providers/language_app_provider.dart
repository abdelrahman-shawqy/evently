import 'package:flutter/material.dart';

class LanguageAppProvider extends ChangeNotifier{

  String languageApp = "en";

  void changeLanguage(String newL){
    if(languageApp==newL){
      return ;
    }
    languageApp =newL ;
    notifyListeners();

  }
}