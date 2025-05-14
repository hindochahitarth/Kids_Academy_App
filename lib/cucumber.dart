import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/capsicum.dart';
import 'package:finalprjct1/garlic.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/ginger.dart';
import 'package:finalprjct1/greenchilli.dart';
import 'package:finalprjct1/lemon.dart';
import 'package:finalprjct1/potato.dart';
import 'package:finalprjct1/redchilli.dart';
import 'package:finalprjct1/spinach.dart';
import 'package:finalprjct1/tomato.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'onion.dart';

class Cucumber extends StatefulWidget{

  @override
  State <Cucumber> createState() => _CucumberState();
}

class _CucumberState extends State<Cucumber> {
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
              image: AssetImage('assets/General Awarness/Vegetables/11zon_compressed/cucumber.jpg'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('CUCUMBER',style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            style: TextButton.styleFrom(elevation: 20,
                shadowColor: Colors.brown,
                backgroundColor: Colors.blue,
                shape: StadiumBorder()),), width: 150, top: 330, left: 350,),
        Positioned(top: 185,left: 770,child: TextButton.icon(onPressed: (){
              assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Spinach()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
    Positioned(top: 185,left: 15,child: TextButton.icon(onPressed: ()
    {
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Capsicum()));
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

