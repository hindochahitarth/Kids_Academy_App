import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Opearators/op1.dart';
import 'package:finalprjct1/Maths/Opearators/op2.dart';
import 'package:finalprjct1/Maths/Opearators/op4.dart';
import 'package:finalprjct1/Maths/Opearators/op5.dart';
import 'package:finalprjct1/Maths/Opearators/op6.dart';
import 'package:finalprjct1/Maths/Opearators/opt8.dart';
import 'package:finalprjct1/Maths/Subtraction/sub7.dart';import '../mathscategory.dart';

import 'package:flutter/material.dart';

class Opt7 extends StatefulWidget {
  @override
  _Opt7State createState() => _Opt7State();
}

class _Opt7State extends State<Opt7> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false];
  List<String> audioFiles = [

    'assets/Maths/Operators/less.mp3',
    'assets/Maths/Operators/7.mp3',
    'assets/Maths/Operators/lessthan.mp3',
    'assets/Maths/Operators/8.mp3',
    //   'assets/Maths/Operators/equal.mp3',
    //   'assets/Maths/Operators/4.mp3',
  ];
  @override
  void initState() {
    super.initState();
    _showButtonsWithDelay();
  }

  Future<void> _showButtonsWithDelay() async {
    for (int i = 0; i < buttonVisibility.length; i++) {
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        buttonVisibility[i] = true;
      });
      audioPlayer.open(Audio(audioFiles[i]));
      audioPlayer.play();
    }
  }
  void _playAudio(int buttonIndex) {
    audioPlayer.open(Audio(audioFiles[buttonIndex]));
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
          fit: StackFit.expand,

        children: <Widget>[


          Image(image: AssetImage('assets/Maths/mathsbg.png'), fit: BoxFit.fill,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MathsCategory()));
          },
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
            style:ElevatedButton.styleFrom(
         backgroundColor:Colors.black
            ),
          ),),

          Positioned(
            top: 120,
            left: 370,
            child: AnimatedButton(

              onPressed:(){
                audioPlayer.open(Audio(audioFiles[0]));
                audioPlayer.play();
              },

              audioFile: '',
              isVisible: buttonVisibility[0],
              label: '<',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(
            top: 200,
            left: 320,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[1]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Additon/plus.mp3',

              isVisible: buttonVisibility[1],
              label: '7',
              //size: 120.0, // Set the desired size for Button 2
            ),
          ),
          Positioned(
            top: 200,
            left: 370,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[2]));
                audioPlayer.play();
              },
              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[2],
              label: '<',
              //  size: 140.0, // Set the desired size for Button 3
            ),
          ),
          Positioned(
            top: 200,
            left: 420,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[3]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[3],
              label: '8',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(top: 185,left: 770, // Adjust position as needed
              child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Opt8()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              }, icon: Icon(Icons.arrow_forward,size:50.0,color:Colors.blue), label: Text(''))
          ),

   Positioned(top: 185,left: 15,       child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Opt6()));
                audioPlayer.stop();
              }, icon: Icon(Icons.arrow_back,size:50.0,color:Colors.blue), label: Text(''))
          ),


        ],

      ),
    );
  }
}
class AnimatedButton extends StatelessWidget {
  final bool isVisible;
  final String label;
  final String audioFile;
  final VoidCallback onPressed;

  AnimatedButton({
    required this.isVisible,
    required this.label,
    required this.audioFile,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Row(
        children: [
          Positioned(
            top: 200,
            child: TextButton(
              onPressed: onPressed,
              style: TextButton.styleFrom(),
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 47,color: Colors.blue,letterSpacing: 2,)),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}