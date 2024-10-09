

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
class Havidate extends StatefulWidget{
  @override
  State <Havidate> createState()=> _HavidateState();

}
class _HavidateState extends State<Havidate>{
  late Box box;
  String? username;
  @override
  void initState(){
    super.initState();
    box=Hive.box("MyBox");
  }
  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Hive Example"),),
      body: Column(
      
        children: [
          ElevatedButton(onPressed: (){
            setState(() {
              box.put('username', 'remya');
            });
          }, child: Text("Store Data")),
          SizedBox(height: 20),
           ElevatedButton(onPressed: (){
            setState(() {
              username=box.get('username');
            });
           }, child: Text("Retrive Data")),
           SizedBox(height: 15),
           Text(username!=null?"Stroed username:$username":"no username stored"),
        ],
      ),
    );
  }
}