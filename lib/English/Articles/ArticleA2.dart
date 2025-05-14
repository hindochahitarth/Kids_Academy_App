import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Articles/ArticleA.dart';
import 'package:finalprjct1/English/Articles/articlecategory.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym2.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Article2 extends StatefulWidget{

  @override
  State <Article2> createState() => _Article2State();
}

class _Article2State extends State<Article2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [

          Image(image: AssetImage('assets/General Awarness/Seasons/seasbg.jpg'), fit: BoxFit.cover,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
           //audioManager.stop();
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
              image: AssetImage('assets/English/Articles/A/bat.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(top: 115,left: 385,
            child: Image(
              image: AssetImage('assets/English/Articles/A/chair.jpg'),
              height: 140,
              width: 150,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(top: 75,left: 600,
            child: Image(
              image: AssetImage('assets/English/Articles/A/book.jpg'),
              height: 230,
              width: 200,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(child: Text('A',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 130,),

          Positioned(child: Text('bat',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 160,),
          Positioned(child: Text('A',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 420,),

          Positioned(child: Text('chair',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 450,),

          Positioned(child: Text('A',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 660,),

          Positioned(child: Text('book',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 690,),

          Positioned(top: 325,left: 0,child: TextButton.icon(onPressed: (){
            //audioManager.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Article1()));
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

