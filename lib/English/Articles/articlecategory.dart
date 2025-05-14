import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Alphabet/a.dart';
import 'package:finalprjct1/English/Articles/ArticleA.dart';
import 'package:finalprjct1/English/Articles/ArticleAN.dart';
import 'package:finalprjct1/English/Articles/article.dart';
import 'package:finalprjct1/English/Articles/the1.dart';
import 'package:finalprjct1/English/Phonics/A1.dart';
import 'package:finalprjct1/English/english.dart';
import 'package:finalprjct1/Maths/Opearators/op1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ArticleCategory extends StatefulWidget{
  @override
  State<ArticleCategory> createState() => _ArticleCategoryState();
}

class _ArticleCategoryState extends State<ArticleCategory> {

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;


  @override
  void initState() {
    super.initState();
    playMusic();
    print('called');
  }

  Future<void> playMusic() async {
    await assetsAudioPlayer.open(
      Audio('assets/English/bg.mp3'),
      //autoStart: true,
      showNotification: true,

    );
    setState(() {
      isPlaying = true;
    });
    void dispose() {
      assetsAudioPlayer.stop();
      super.dispose();
    }}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Stack(
          fit: StackFit.expand,
          children: [
            Image(image: AssetImage('assets/English/Articles/article.jpg'),fit: BoxFit.cover,),

            Positioned(top: 25,left: 20,child: ElevatedButton.icon(onPressed: (){

             assetsAudioPlayer.stop();   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>English()));
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
            ),),
            Positioned(
              top: 135,
              left: 355,width: 150,




              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Article1()));

                  assetsAudioPlayer.stop();

                },

                child: Row(
                  children: [
                    Text('A               ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
              top: 190,
              left: 355,width: 150,



              child: OutlinedButton(
                onPressed: () {

                 assetsAudioPlayer.stop();       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ArticleAn1()));


                },

                child: Row(
                  children: [
                    Text('AN            ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
              top: 245,
              left: 355,width: 150,




              child: OutlinedButton(
                onPressed: () {

                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Articlethe1()));


                },

                child: Row(
                  children: [
                    Text('THE          ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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