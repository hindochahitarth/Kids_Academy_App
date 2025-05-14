import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../vococategory.dart';

class Vowels extends StatefulWidget
{
  @override
  State<Vowels> createState() => _VowelsState();
}

class _VowelsState extends State<Vowels> {

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false];

  List<String> audioFiles = [
  'assets/English/Alphabets/a.mp3',

  'assets/English/Alphabets/e.mp3',
  'assets/English/Alphabets/i.mp3',
  'assets/English/Alphabets/o.mp3',
  'assets/English/Alphabets/u.mp3',
];

  void _playAudio(int buttonIndex) {
    audioPlayer.open(Audio(audioFiles[buttonIndex]));
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,

          children: [
      Image(image: AssetImage('assets/General Awarness/Good Manners/ga.png'),fit: BoxFit.cover,),
    Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
    //assetsAudioPlayer.stop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VocoCategory()));
    },
    icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
    label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
    style:ElevatedButton.styleFrom(
    backgroundColor: Colors.black
    ),
    ),),

    Positioned(
    child: TextButton(onPressed: (){},
    child: Text('VOWELS',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: 4),),),
    top: 35,left: 330,),

    Positioned(
    child: TextButton(onPressed: (){

      audioPlayer.open(Audio(audioFiles[0]));
      audioPlayer.play();
    },
    child: Text('A',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
    top: 170,left: 225,),

    Positioned(
    child: TextButton(onPressed: (){
      audioPlayer.open(Audio(audioFiles[1]));
      audioPlayer.play();

    },
    child: Text('E',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.orangeAccent),),),
    top: 170,left: 305,),

    Positioned(
    child: TextButton(onPressed: (){
      audioPlayer.open(Audio(audioFiles[2]));
      audioPlayer.play();

    },
    child: Text('I',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.amber),),),
    top: 170,left: 385,),

    Positioned(
    child: TextButton(onPressed: (){
      audioPlayer.open(Audio(audioFiles[3]));
      audioPlayer.play();

    },
    child: Text('O',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.pink),),),
    top:170,left: 465,),
            Positioned(
              child: TextButton(onPressed: (){

                audioPlayer.open(Audio(audioFiles[4]));
                audioPlayer.play();

              },
                child: Text('U',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.green),),),
              top: 170,left: 545,),

          ],), );
  }
}