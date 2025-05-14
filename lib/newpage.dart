import 'package:finalprjct1/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newpage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('new page'),),
    body: ElevatedButton(onPressed: (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    },child: Text('back'),),
  );
  }

}