import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finalprjct1/bluecolor.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/purplecolor.dart';
import 'package:finalprjct1/redcolor.dart';
import 'package:finalprjct1/whitecolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'graycolor.dart';
import 'greencolor.dart';
import 'home.dart';
import 'orangecolor.dart';

class BrownColor extends StatefulWidget{

  @override
  State<BrownColor> createState() => _SeasonState();
}

class _SeasonState extends State<BrownColor> {
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
      Audio('assets/winter.mp3'),
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

          Image(image: AssetImage('assets/General Awarness/Colors/colorsbg.jpg'), fit: BoxFit.cover,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GeneralAwar()));
          },

            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

          Positioned(top: 35,left: 190,
            child: Image(
              image: AssetImage('assets/General Awarness/Colors/brown.jpg'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('BROWN',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 3,),),
            style: TextButton.styleFrom(elevation: 20,
                shadowColor: Colors.brown,
                backgroundColor: Colors.blue,
                shape: StadiumBorder()),), width: 150, top: 330, left: 350,),

          Positioned(top: 185,left: 770,child: TextButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WhiteColor()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
           Positioned(top: 185,left: 15,child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GrayColor()));
          },
            icon: Icon(Icons.arrow_back,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),


        ],


      ),
    );
  }}

