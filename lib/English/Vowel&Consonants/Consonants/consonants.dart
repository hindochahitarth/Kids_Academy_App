import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../vococategory.dart';

class Consonants extends StatefulWidget
{
  @override
  State<Consonants> createState() => _ConsonantsState();
}

class _ConsonantsState extends State<Consonants> {

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false];
  List<String> audioFiles = [
    'assets/English/Alphabets/b.mp3',

    'assets/English/Alphabets/c.mp3',
    'assets/English/Alphabets/d.mp3',
    'assets/English/Alphabets/f.mp3',
    'assets/English/Alphabets/g.mp3',
    'assets/English/Alphabets/h.mp3',
    'assets/English/Alphabets/j.mp3',
    'assets/English/Alphabets/k.mp3',
    'assets/English/Alphabets/l.mp3',
    'assets/English/Alphabets/m.mp3',
    'assets/English/Alphabets/n.mp3',
    'assets/English/Alphabets/p.mp3',
    'assets/English/Alphabets/q.mp3',
    'assets/English/Alphabets/r.mp3',
    'assets/English/Alphabets/s.mp3',
    'assets/English/Alphabets/t.mp3',
    'assets/English/Alphabets/v.mp3',
    'assets/English/Alphabets/w.mp3',
    'assets/English/Alphabets/x.mp3',
    'assets/English/Alphabets/y.mp3',
    'assets/English/Alphabets/z.mp3',
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
              child: Text('CONSONANTS',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,color: Colors.black,letterSpacing: 3),),),
            top: 5,left: 275,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[0]));
              audioPlayer.play();

            },
              child: Text('B',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 145,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[1]));
              audioPlayer.play();

            },
              child: Text('C',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 225,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[2]));
              audioPlayer.play();

            },
              child: Text('D',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 305,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[3]));
              audioPlayer.play();

            },
              child: Text('F',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 385,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[4]));
              audioPlayer.play();

            },
              child: Text('G',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 465,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[5]));
              audioPlayer.play();

            },
              child: Text('H',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 545,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[6]));
              audioPlayer.play();

            },
              child: Text('J',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 65,left: 625,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[7]));
              audioPlayer.play();

            },
              child: Text('K',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 155,left: 185,),
          Positioned(
            child: TextButton(onPressed: (){ audioPlayer.open(Audio(audioFiles[8]));
            audioPlayer.play();


            },
              child: Text('L',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 155,left: 270,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[9]));
              audioPlayer.play();

            },
              child: Text('M',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 155,left: 345,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[10]));
              audioPlayer.play();

            },
              child: Text('N',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 155,left: 430,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[11]));
              audioPlayer.play();

            },
              child: Text('P',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 155,left: 510,),
          Positioned(
            child: TextButton(onPressed: (){

              audioPlayer.open(Audio(audioFiles[12]));
              audioPlayer.play();
            },
              child: Text('Q',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 155,left: 590,),

          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[13]));
              audioPlayer.play();

            },
              child: Text('R',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 145,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[14]));
              audioPlayer.play();

            },
              child: Text('S',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 225,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[15]));
              audioPlayer.play();

            },
              child: Text('T',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 305,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[16]));
              audioPlayer.play();

            },
              child: Text('V',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 385,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[17]));
              audioPlayer.play();

            },
              child: Text('W',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 465,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[18]));
              audioPlayer.play();

            },
              child: Text('X',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 545,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[19]));
              audioPlayer.play();

            },
              child: Text('Y',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 245,left: 625,),
          Positioned(
            child: TextButton(onPressed: (){
              audioPlayer.open(Audio(audioFiles[20]));
              audioPlayer.play();

            },
              child: Text('Z',style: TextStyle(fontSize: 55,fontWeight: FontWeight.bold,color: Colors.blue),),),
            top: 315,left: 390,),


        ],), );
  }
}