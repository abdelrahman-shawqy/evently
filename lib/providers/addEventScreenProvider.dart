import 'package:flutter/material.dart';

class AddEventScreenProvider extends ChangeNotifier{

  int selectedIndex=0;


  changeSelectedIndex(int currentIndex){
    selectedIndex=currentIndex;
    notifyListeners();
  }


}