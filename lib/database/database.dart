import 'package:hive/hive.dart';

class Tododatabase{
  
  List todolist=[];
  final _mybox=Hive.box('mybox');

//intaial
  void createintialdata(){
    todolist=[["create your daily tasks",false],
    ["do exersise",false]];

  }
  //load data from database
  void loaddata(){
    todolist=_mybox.get("TODOLIST");

  }
  //updata database
  void updatedata(){
    _mybox.put("TODOLIST", todolist);

  }
}