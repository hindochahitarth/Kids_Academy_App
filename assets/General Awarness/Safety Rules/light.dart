import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/exercise.dart';
import 'package:finalprjct1/garbage.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/hydrated.dart';
import 'package:finalprjct1/permission.dart';
import 'package:finalprjct1/wash.dart';
import 'package:finalprjct1/work.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'help.dart';

class Light extends StatefulWidget{

  @override
  State <Light> createState() => _LightState();
}

class _LightState extends State<Light> {
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

      Audio('assets/General Awarness/Healthy Habits/light.mp3'), autoStart: true,
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
              image: AssetImage('assets/General Awarness/Healthy Habits/light.png'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('TURN OFF LIGHT,FAN AND TV WHEN NOT IN USE'
                '',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),),
          ), width: 600, top: 330, left: 115,),
          Positioned(top: 335,left: 730,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Dustbin()));
          },
            icon: Icon(Icons.arrow_right_alt,size:50.0,color: Colors.teal),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
          Positioned(top: 335,left: 30,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Exercise()));
          },
            icon: Icon(Icons.arrow_left,size:50.0,color: Colors.teal),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),



        ],


      ),
    );
  }}

