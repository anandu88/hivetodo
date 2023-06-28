
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../database/database.dart';
import '../widgets/todotile.dart';





class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Tododatabase db=Tododatabase();
  final TextEditingController tittlecontroller=TextEditingController();
  
   final _mybox=Hive.box('mybox');



   @override
  void initState() {
    //if this is the first time open the app
    if(_mybox.get("TODOLIST") == null){
      db.createintialdata();
    }else{
      db.loaddata();
    }
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
  
    return Scaffold( 
      appBar: AppBar(
        title: const Text("TO DO",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
        elevation: 0,
      ),
      body: ListView.builder(itemCount: db.todolist.length,
      padding: const EdgeInsets.all(10),
      shrinkWrap:true ,
      physics:const BouncingScrollPhysics(),
      
      
      
      itemBuilder: (context, index) {
        return  Todotile(taskcompleted: db.todolist[index][1],
       
         taskname: db.todolist[index][0],
          onChanged:(value) => checkboxchanged(value,index),
           deletefunction: ( context  ) { 
            deletetask(index);
            },);
      },),
      floatingActionButton: FloatingActionButton(onPressed: (){
        createnewtask();

       
      },
      child:const Icon(Icons.edit),),
    );
  }
  
 void  checkboxchanged(bool?value,int index) {
  setState(() {
    db.todolist[index][1]=!db.todolist[index][1];
  });
  db.updatedata();
 }
  void saveNewTask() {
    setState(() {
      db.todolist.add([tittlecontroller.text, false]);
      tittlecontroller.clear();
    });
    Navigator.of(context).pop();
    db.updatedata();
  }
 
  void createnewtask() {
    showDialog(context: context, builder: (context) {
      return AlertDialog(content: Container(
        height: 200,
        color: Colors.yellow,
        child: Column(
          children: [
           Expanded(
             child: TextField(controller: tittlecontroller,
                decoration: const InputDecoration(hintText: "add a new task",
                  border: OutlineInputBorder()
                ),
              ),
           ),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                   db. todolist.add([tittlecontroller.text,false]);
                    tittlecontroller.clear();
                  });
                  Navigator.of(context).pop();
                }, child:const Text("save")),
                const SizedBox(width: 20,),
                ElevatedButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child:const Text("cancel"))
              ],
            )

          ],
        ),
      ),


      );
    },);
    db.updatedata();
  }
  
  void deletetask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updatedata();
  }
 
  
}