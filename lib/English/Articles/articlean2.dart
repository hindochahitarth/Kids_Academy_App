import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Articles/ArticleAN.dart';
import 'package:finalprjct1/English/Articles/articlecategory.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym2.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ArticleA2.dart';


class ArticleAn2 extends StatefulWidget{

  @override
  State <ArticleAn2> createState() => _ArticleAn2State();
}

class _ArticleAn2State extends State<ArticleAn2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [

          Image(image: AssetImage('assets/General Awarness/Seasons/seasbg.jpg'), fit: BoxFit.cover,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ArticleCategory()));
          },
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),

          ),),

          Positioned(top: 75,left: 60,
            child: Image(
              image: AssetImage('assets/English/Articles/An/11zon_resized/umbrella_6_11zon.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(top: 115,left: 385,
            child: Image(
              image: AssetImage('assets/English/Articles/An/11zon_resized/eyes_3_11zon.jpg'),
              height: 140,
              width: 150,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(top: 75,left: 600,
            child: Image(
              image: AssetImage('assets/English/Articles/An/11zon_resized/elephant_2_11zon.jpg'),
              height: 230,
              width: 200,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(child: Text('An',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 130,),

          Positioned(child: Text('umbrella',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 175,),
          Positioned(child: Text('An',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 420,),

          Positioned(child: Text('eyes',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 465,),

          Positioned(child: Text('An',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 660,),

          Positioned(child: Text('elephant',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 705,),

          Positioned(top: 325,left: 0,child: TextButton.icon(onPressed: (){
            //audioManager.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ArticleAn1()));
          },
            icon: Icon(Icons.arrow_back,size:60.0,color: Colors.teal),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),



        ],


      ),
    );
  }}

