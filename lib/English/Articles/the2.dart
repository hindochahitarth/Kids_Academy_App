import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Articles/ArticleAN.dart';
import 'package:finalprjct1/English/Articles/articlecategory.dart';
import 'package:finalprjct1/English/Articles/the1.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym2.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ArticleA2.dart';


class ArticleThe2 extends StatefulWidget{

  @override
  State <ArticleThe2> createState() => _ArticleThe2State();
}

class _ArticleThe2State extends State<ArticleThe2> {
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
              image: AssetImage('assets/English/Articles/The/images/king_1_11zon.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(top: 115,left: 385,
            child: Image(
              image: AssetImage('assets/English/Articles/The/images/sun_5_11zon.jpg'),
              height: 140,
              width: 150,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(top: 75,left: 600,
            child: Image(
              image: AssetImage('assets/English/Articles/The/images/sky_4_11zon.jpg'),
              height: 230,
              width: 200,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(child: Text('The',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 130,),

          Positioned(child: Text('king',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 185,),
          Positioned(child: Text('The',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 420,),

          Positioned(child: Text('sun',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 475,),

          Positioned(child: Text('The',style: TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 660,),

          Positioned(child: Text('sky',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold),),top: 320,left: 715,),

          Positioned(top: 325,left: 0,child: TextButton.icon(onPressed: (){
            // assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Articlethe1()));
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

