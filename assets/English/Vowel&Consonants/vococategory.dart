import 'package:finalprjct1/English/Alphabet/a.dart';
import 'package:finalprjct1/English/Phonics/A1.dart';
import 'package:finalprjct1/English/alphacategory.dart';
import 'package:finalprjct1/Maths/Opearators/op1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Consonants/consonants.dart';


class VocoCategory extends StatefulWidget{
  @override
  State<VocoCategory> createState() => _VocoCategoryState();
}

class _VocoCategoryState extends State<VocoCategory> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Stack(
          children: [
            Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AlphaCategory()));
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.brown),
              label: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey
              ),
            ),),
            Center(
              child: Container(
                width: 350, // Adjust the size as needed
                height: 200, // Adjust the size as needed
                color: Colors.yellow, // You can set your desired color here
              ),
            ),
            Positioned(
              top: 115,
              left: 325,width: 195,




              child: OutlinedButton(
                onPressed: () {
                 // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Alphaa()));


                },

                child: Row(
                  children: [
                    Text('VOWELS  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
              top: 170,
              left: 305,width: 235,




              child: OutlinedButton(
                onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Consonants()));


                },

                child: Row(
                  children: [
                    Text('CONSONANTS ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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