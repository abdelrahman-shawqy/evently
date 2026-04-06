import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier{
  int selectedIndex=0;
  changeIndex(int currentIndex){
    selectedIndex=currentIndex;
    notifyListeners();
  }


}