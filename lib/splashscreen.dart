import 'dart:async';

import 'package:finalprjct1/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Splash extends StatefulWidget{
  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    Timer(Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));

    });
     super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Container(
         width: 900,
         height: 900,
         decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/ka2.png',),fit: BoxFit.cover),),

       ),
    );

    }
}