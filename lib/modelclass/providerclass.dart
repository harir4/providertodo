import 'package:flutter/material.dart';
import 'package:providertodo/modelclass/class.dart';

class Provider_class extends ChangeNotifier {
  List<Datas> todo = [];
  List get todoItem => todo;
  void addTask(String task) {
    todo.add(Datas(Text: task, checkitem: false));
    notifyListeners();
  }
  void toggleTask(Datas datas){

    final taskIndex=todo.indexOf(datas);
    todo[taskIndex].togglecomplete();
    notifyListeners();
  }
  void delete(Datas datas){
    todo.remove(datas);
    notifyListeners();
  }
}
