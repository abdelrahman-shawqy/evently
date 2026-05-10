import 'package:flutter/material.dart';

import '../Firebase/fireBase_functions.dart';
import '../models/task_model.dart';

class AddEventScreenProvider extends ChangeNotifier{

  int selectedIndex=0;

  DateTime date =DateTime.now();
  DateTime time =DateTime.now();

  changeDate(DateTime d){
    date=d;
    notifyListeners();
  }
  changeTime(DateTime t){
    time=t;
    notifyListeners();
  }


  changeSelectedIndex(int currentIndex){
    selectedIndex=currentIndex;
    notifyListeners();
  }

  addEvent(TaskModel taskModel)async{
    await FirebaseFunctions.creatTaskes(taskModel);
    notifyListeners();

  }
}