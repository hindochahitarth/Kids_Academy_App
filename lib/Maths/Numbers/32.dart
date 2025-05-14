import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Addition/additon2.dart';
import 'package:finalprjct1/Maths/Numbers/31.dart';
import 'package:finalprjct1/Maths/Numbers/33.dart';
import 'package:flutter/material.dart';

import '../maths.dart';

import '23.dart';

class Th2 extends StatefulWidget {
  @override
  _Th2State createState() => _Th2State();
}

class _Th2State extends State<Th2> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false,false,false, false, false, false,false,false];
  List<String> audioFiles = [
    'assets/Maths/Numbers/32.mp3',
    'assets/English/Alphabets/t.mp3',

    'assets/English/Alphabets/h.mp3',
    'assets/English/Alphabets/i.mp3',

    'assets/English/Alphabets/r.mp3',

    'assets/English/Alphabets/t.mp3',
    'assets/English/Alphabets/y.mp3',
    'assets/English/Alphabets/t.mp3',
    'assets/English/Alphabets/w.mp3',

    'assets/English/Alphabets/o.mp3',
    'assets/Maths/Numbers/32.mp3',

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
        children: <Widget>[
          Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Maths()));
          },

            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
             style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

          Positioned(
           top: 150,
            left: 380,
            child: AnimatedButton(

              onPressed:(){
                audioPlayer.open(Audio(audioFiles[0]));
                audioPlayer.play();
              },

              audioFile: '',
              isVisible: buttonVisibility[0],
              label: '32',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(
            top: 280,
            left: 200,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[1]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Additon/plus.mp3',

              isVisible: buttonVisibility[1],
              label: 'T',
              //size: 120.0, // Set the desired size for Button 2
            ),
          ),
          Positioned(
            top: 280,
            left: 260,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[2]));
                audioPlayer.play();
              },
              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[2],
              label: 'H',
              //  size: 140.0, // Set the desired size for Button 3
            ),
          ),
          Positioned(
            top: 280,
            left: 320,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[3]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[3],
              label: 'I',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),

          Positioned(
            top: 280,
            left: 380,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[4]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[4],
              label: 'R',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 440,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[5]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[5],
              label: 'T',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 500,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[6]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[6],
              label: 'Y',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 560,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[7]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[7],
              label: 'T',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 620,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[8]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[8],
              label: 'W',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 680,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[9]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[9],
              label: 'O',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),

          Positioned(
            top: 280,
            left: 500,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[0]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[0],
              label: '',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),

          Positioned(
              bottom: 20, // Adjust position as needed
              right: 20, // Adjust position as needed
              child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Th3()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              },  icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
    label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              ),),

          Positioned(
              bottom: 20, // Adjust position as needed
              left: 20, child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Th1()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              }, icon: Icon(Icons.arrow_back,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
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