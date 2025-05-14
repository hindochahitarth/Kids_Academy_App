import 'package:finalprjct1/English/Alphabet/a.dart';
import 'package:finalprjct1/English/Phonics/A1.dart';
import 'package:finalprjct1/English/english.dart';
import 'package:finalprjct1/Maths/Opearators/op1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class AlphaCategory extends StatefulWidget{
  @override
  State<AlphaCategory> createState() => _AlphaCategoryState();
}

class _AlphaCategoryState extends State<AlphaCategory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/English/Alphabets/english.jpg',fit: BoxFit.cover,),
            Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>English()));
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
            ),),
            Positioned(
              top: 175,
              left: 325,width: 185,




              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Alphaa()));


                },

                child: Row(
                  children: [
                    Text('        ABC       ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
                    // SizedBox(
                    //   width: 0,
                    //   height: 10,
                    // ),
                    Icon( // <-- Icon
                      Icons.arrow_circle_right_outlined,
                      size: 35.0,


                      color: Colors.white,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent
                ),

              ),
            ),
            Positioned(
              top: 230,
              left: 325,width: 185,




              child: OutlinedButton(
                onPressed: () {
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>A1()));


                },

                child: Row(
                  children: [
                    Text('     Phonics    ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
                    // SizedBox(
                    //   width: 0,
                    //   height: 10,
                    // ),
                    Icon( // <-- Icon
                      Icons.arrow_circle_right_outlined,
                      size: 35.0,


                      color: Colors.white,
                    ),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent
                ),

              ),
            ),


          ],
        ),),
    );
  }
}