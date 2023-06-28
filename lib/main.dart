import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:hivetodo/pages/homepage.dart';



void main()async{
  await Hive.initFlutter();
  
  await Hive.openBox("mybox");
  runApp(const Myapp());
 
}
class Myapp extends StatelessWidget {
  const Myapp ({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Homepage(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.amber.shade50
        
      ),
    );
  }
}