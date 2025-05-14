import 'package:assets_audio_player/assets_audio_player.dart';import '../mathscategory.dart';

import 'package:finalprjct1/Maths/Subtraction/sub2.dart';
import 'package:flutter/material.dart';

import '../mathscategory.dart';

class Sub1 extends StatefulWidget {
  @override
  _Sub1State createState() => _Sub1State();
}

class _Sub1State extends State<Sub1> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false, false];
  List<String> audioFiles = [
    'assets/Maths/Subtraction/1.mp3',
    'assets/Maths/Subtraction/minus.mp3',
    'assets/Maths/Subtraction/zero.mp3',
    'assets/Maths/Subtraction/equal.mp3',
    'assets/Maths/Subtraction/1.mp3',
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(image: AssetImage('assets/Maths/mathsadd.png'), fit: BoxFit.fill,),
        Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MathsCategory()));
          },
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black
            ),
          ),),
          Positioned(
             top: 180,
            left: 310,
           child: AnimatedButton(

              onPressed:(){
                audioPlayer.open(Audio(audioFiles[0]));
                audioPlayer.play();
              },

              audioFile: '',
              isVisible: buttonVisibility[0],
              label: '1',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(
           top: 180,
            left: 370,
             child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[1]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Subtraction/plus.mp3',

              isVisible: buttonVisibility[1],
              label: '-',
              //size: 120.0, // Set the desired size for Button 2
            ),
          ),
          Positioned(
            top: 180,
            left: 430,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[2]));
                audioPlayer.play();
              },
              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[2],
              label: '0',
              //  size: 140.0, // Set the desired size for Button 3
            ),
          ),
          Positioned(
            top: 180,
            left: 490,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[3]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[3],
              label: '=',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 180,
            left: 550,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[4]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[4],
              label: '1',
              //size: 180.0, // Set the desired size for Button 5
            ),
          ),
          Positioned(top: 345,left: 770,    child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sub2()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              }, icon: Icon(Icons.arrow_forward,size:50.0,color:Colors.blue), label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),


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
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.deepOrangeAccent,letterSpacing: 2,)),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}