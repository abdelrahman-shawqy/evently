import 'dart:async';

import 'package:evently/models/task_model.dart';
import 'package:flutter/foundation.dart';

import '../Firebase/fireBase_functions.dart';

class Providerhomechips extends ChangeNotifier {
  Providerhomechips({this.category});
  List<String>?category;
  int selectedIndex = 0;
   StreamSubscription? streamSubscription;

  changeSelectedIndex(int index) {
    selectedIndex = index;
    notifyListeners();
    getStreamTaskes();
  }
  @override
  dispose(){
    streamSubscription!.cancel();
    super.dispose();
  }
  getStreamTaskes() {
    if(streamSubscription!=null )streamSubscription!.cancel();
    streamSubscription = FirebaseFunctions.getStreamTasks(
      categorys: selectedIndex == 0 ? null : category![selectedIndex],
    ).listen((event) {
      tasks = event.docs.map((e) => e.data()).toList();
      notifyListeners();
    });
  }

  List<TaskModel> tasks = [];
  bool isLoading = false;
  String errorMassege = "";

  getTaskes() async {
    errorMassege = "";
    isLoading = true;
    try {
      // var list = await FirebaseFunctions.getTasks();
      // tasks=list.docs.map((e)=>e.data()).toList();
      isLoading = false;
      notifyListeners();
    } catch (e) {
      errorMassege = e.toString();
      print("erorr ${e.toString()}");
    }
    isLoading = false;
    notifyListeners();
  }
  bool isSelectedFavorite=true;
  changeFavoriteIcon(){
    isSelectedFavorite=!isSelectedFavorite;
    notifyListeners();
  }
}
