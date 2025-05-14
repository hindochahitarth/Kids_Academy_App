import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Alphabet/a.dart';
import 'package:finalprjct1/English/Phonics/A1.dart';
import 'package:finalprjct1/English/alphacategory.dart';
import 'package:finalprjct1/English/english.dart';
import 'package:finalprjct1/Maths/Opearators/op1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Consonants/consonants.dart';
import 'Vowel/vowels.dart';


class VocoCategory extends StatefulWidget{
  @override
  State<VocoCategory> createState() => _VocoCategoryState();
}

class _VocoCategoryState extends State<VocoCategory> {

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
            Image.asset('assets/English/Vowel&Consonants/vc.jpg',fit: BoxFit.cover),
            Positioned(top: 25,left: 20,child: ElevatedButton.icon(onPressed: (){

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>English()));
              assetsAudioPlayer.stop();
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
            ),),
            Positioned(
              top: 85,
              left: 325,width: 195,




              child: OutlinedButton(
                onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Vowels()));
                 assetsAudioPlayer.stop();

                },

                child: Row(
                  children: [
                    Text('VOWELS            ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
              top: 140,
              left: 325,width: 195,




              child: OutlinedButton(
                onPressed: () {
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Consonants()));
                 assetsAudioPlayer.stop();

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