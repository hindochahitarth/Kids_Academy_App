import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Articles/articlecategory.dart';
import 'package:finalprjct1/English/english.dart';
import 'package:finalprjct1/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Article extends StatefulWidget{

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [
          Positioned(child: Text('ARTICLES',style: TextStyle(fontSize: 50,color: Colors.orange,fontWeight: FontWeight.bold,letterSpacing: 3,),),top: 50,left: 290),

          Positioned(child: TextButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
          }, icon: Icon(Icons.arrow_back,color: Colors.white,), label:Text('HOME',style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.black),),top: 5,left: 10,),

          Positioned(child: TextButton.icon(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>English()));
          }, icon: Icon(Icons.arrow_back,color: Colors.white,), label:Text('ENGLISH',style: TextStyle(color: Colors.white),),style: TextButton.styleFrom(shape: StadiumBorder(),backgroundColor: Colors.black),),top: 5,left: 100,),
         // Positioned(child: Icon(Icons.arrow_forward,color: Colors.white,size: 30,),top: 153,left: 190,),
          Positioned(child: Text('A',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),top:150,left: 200 ,),

          Positioned(child: Text(',',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),top:150,left: 225 ,),

          Positioned(child: Text('An',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),top:150,left: 235 ,),

          Positioned(child: Text(', and ',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),top:150,left: 275 ,),

          Positioned(child: Text('The',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blue),),top:150,left: 352 ,),

          Positioned(child: Text('are called articles.',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),top:150,left: 415 ,),


          Positioned(top: 185,left: 760,child: TextButton.icon(onPressed: (){
            //audioManager.stop();

            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ArticleCategory()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),


        ],


      ),
    );
  }}

