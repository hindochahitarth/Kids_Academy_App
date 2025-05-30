import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/brinjal.dart';
import 'package:finalprjct1/broccoli.dart';
import 'package:finalprjct1/cauliflower.dart';
import 'package:finalprjct1/coriander.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/ladyfinger.dart';
import 'package:finalprjct1/peas.dart';
import 'package:finalprjct1/redchilli.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'help.dart';
//import 'onion.dart';

class CoverMouth extends StatefulWidget{

  @override
  State <CoverMouth> createState() => _CoverMouthState();
}

class _CoverMouthState extends State<CoverMouth> {
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
      Audio('assets/General Awarness/Good Manners/cover.mp3'),
      autoStart: true,
      showNotification: true,

    );
    setState(() {
      isPlaying = true;
    });
    void dispose() {
      assetsAudioPlayer.stop();
      super.dispose();
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [

          Image(image: AssetImage('assets/General Awarness/Seasons/seasbg.jpg'), fit: BoxFit.cover,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GeneralAwar()));
          },
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.brown),
            label: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.grey
            ),
          ),),

          Positioned(top: 35,left: 190,
            child: Image(
              image: AssetImage('assets/General Awarness/Good Manners/cover.jpg'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('COVER YOUR MOUTH WHILE SNEEZING/COUGHING',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),),
            ), width: 400, top: 330, left: 220,),
          Positioned(top: 335,left: 730,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Help()));
          },
            icon: Icon(Icons.arrow_right_alt,size:50.0,color: Colors.teal),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),



        ],


      ),
    );
  }}

