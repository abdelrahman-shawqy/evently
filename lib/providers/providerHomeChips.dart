import 'package:flutter/foundation.dart';

class Providerhomechips extends ChangeNotifier{
  int selectedIndex=0;

  changeSelectedIndex(int index){
    selectedIndex=index;
    notifyListeners();
  }
}