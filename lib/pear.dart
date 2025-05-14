import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finalprjct1/apple.dart';
import 'package:finalprjct1/banana.dart';
import 'package:finalprjct1/dragon.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/kiwi.dart';
import 'package:finalprjct1/mango.dart';
import 'package:finalprjct1/orangefruit.dart';
import 'package:finalprjct1/pineapple.dart';
import 'package:finalprjct1/pinkcolor.dart';
import 'package:finalprjct1/purplecolor.dart';
import 'package:finalprjct1/sapota.dart';
import 'package:finalprjct1/strawbeery.dart';
import 'package:finalprjct1/sweetlime.dart';
import 'package:finalprjct1/watermelon.dart';
import 'package:finalprjct1/yellowcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'grapes.dart';



class Pear extends StatefulWidget{

  @override
  State <Pear> createState() => _PearState();
}

class _PearState extends State<Pear> {
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

      Audio('assets/General Awarness/Fruits/pear.mp3'), autoStart: true,
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
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GeneralAwar()));
          },
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black
            ),
          ),),

          Positioned(top: 35,left: 190,
            child: Image(
               image: AssetImage('assets/General Awarness/Fruits/pear.png'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('PEAR',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            style: TextButton.styleFrom(elevation: 20,
                shadowColor: Colors.brown,
                backgroundColor: Colors.blue,
                shape: StadiumBorder()),), width: 150, top: 330, left: 350,),

        Positioned(top: 185,left: 770,child: TextButton.icon(onPressed: (){
              assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Orange()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
         Positioned(top: 185,left: 15,child: TextButton.icon(onPressed: (){
             assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sapota()));
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

