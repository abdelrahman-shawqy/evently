import 'package:flutter/material.dart';

class HidenTextProvider extends ChangeNotifier{
  bool hide = true;
  changeHideText(){
    hide =!hide;
    notifyListeners();
  }

}