import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/action.dart';
import 'package:finalprjct1/chocolate.dart';
import 'package:finalprjct1/footpath.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/green.dart';
import 'package:finalprjct1/parent.dart';
import 'package:finalprjct1/zebra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Personal extends StatefulWidget{

  @override
  State <Personal> createState() => _PersonalState();
}

class _PersonalState extends State<Personal> {
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

      Audio('assets/General Awarness/Safety Rules/personal.mp3'),    autoStart: true,
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
              image: AssetImage('assets/General Awarness/Safety Rules/personal.jpg'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('DO NOT SHARE PERSONAL INFORMATION WITH STRANGERS'
                '',style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold,letterSpacing: 1),),
          ), width: 600, top: 330, left: 115,),

          Positioned(top: 335,left: 30,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Chocolate()));
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




