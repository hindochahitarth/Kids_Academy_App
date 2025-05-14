import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Addition/additon2.dart';
import 'package:finalprjct1/Maths/Numbers/6.dart';
import 'package:flutter/material.dart';

import '../maths.dart';

import '8.dart';

class Seven extends StatefulWidget {
  @override
  _SevenState createState() => _SevenState();
}

class _SevenState extends State<Seven> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false,false, false,false];
  List<String> audioFiles = [
    'assets/Maths/Numbers/7.mp3',
    'assets/English/Alphabets/s.mp3',

    'assets/English/Alphabets/e.mp3',
    'assets/English/Alphabets/v.mp3',
    'assets/English/Alphabets/e.mp3',
    'assets/English/Alphabets/n.mp3',
    'assets/Maths/Numbers/7.mp3',

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
              label: '7',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(
            top: 280,
            left: 290,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[1]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Additon/plus.mp3',

              isVisible: buttonVisibility[1],
              label: 'S',
              //size: 120.0, // Set the desired size for Button 2
            ),
          ),
          Positioned(
            top: 280,
            left: 350,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[2]));
                audioPlayer.play();
              },
              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[2],
              label: 'E',
              //  size: 140.0, // Set the desired size for Button 3
            ),
          ),
          Positioned(
            top: 280,
            left: 410,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[3]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[3],
              label: 'V',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),

          Positioned(
            top: 280,
            left: 470,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[4]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[4],
              label: 'E',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 530,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[5]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[5],
              label: 'N',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 590,
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Eight()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              },  icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
    label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              ),),
          Positioned(
              bottom: 20, // Adjust position as needed
              left: 20,  child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Six()));
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