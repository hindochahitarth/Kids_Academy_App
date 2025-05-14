import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/action.dart';
import 'package:finalprjct1/footpath.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/zebra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Green extends StatefulWidget{

  @override
  State <Green> createState() => _GreenState();
}

class _GreenState extends State<Green> {
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

      Audio('assets/General Awarness/Safety Rules/green.mp3'),  autoStart: true,
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
              image: AssetImage('assets/General Awarness/Safety Rules/green.jpg'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('DO NOT GO WHEN SIGNAL IS RED,ONLY GO WHEN SIGNAL IS GREEN'
                '',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),),
          ), width: 600, top: 330, left: 115,),
        Positioned(top: 185,left: 770,child: TextButton.icon(onPressed: (){
              assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Footpath()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),

          Positioned(top: 185,left: 15,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Zebra()));
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




