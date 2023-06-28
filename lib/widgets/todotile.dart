import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


// ignore: must_be_immutable
class Todotile extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
   Function(bool?)? onChanged;
   void Function(BuildContext)?deletefunction;
   Todotile ({super.key, required this.taskname,
    required this.taskcompleted,required this.onChanged,
    required this.deletefunction});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Slidable(endActionPane: ActionPane(motion: const StretchMotion(),
       children: [
        SlidableAction(onPressed:deletefunction,
        borderRadius: BorderRadius.circular(12),
        icon: Icons.delete,backgroundColor: Colors.red.shade300,),
       ],),
        child: Container(decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12)
        ),padding:const EdgeInsets.all(25),
        child: Row(
          children: [
            Checkbox(value: taskcompleted, onChanged: onChanged,
            activeColor: Colors.black),
            Text(taskname)
          ],
        ),
          
        ),
      ),
    );
  }
}