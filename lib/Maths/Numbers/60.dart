import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Numbers/59.dart';
import '61.dart';
import 'package:flutter/material.dart';

import '../maths.dart';


class Si0 extends StatefulWidget {
  @override
  _Si0State createState() => _Si0State();
}

class _Si0State extends State<Si0> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false,false,false,false];
  List<String> audioFiles = [
    'assets/Maths/Numbers/60.mp3',
    'assets/English/Alphabets/s.mp3',

    'assets/English/Alphabets/i.mp3',
    'assets/English/Alphabets/x.mp3',

    'assets/English/Alphabets/t.mp3',
    'assets/English/Alphabets/y.mp3',
    'assets/Maths/Numbers/60.mp3',

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
              label: '60',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(
            top: 280,
            left: 190,
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
            left: 250,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[2]));
                audioPlayer.play();
              },
              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[2],
              label: 'I',
              //  size: 140.0, // Set the desired size for Button 3
            ),
          ),
          Positioned(
            top: 280,
            left: 310,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[3]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[3],
              label: 'X',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),

          Positioned(
            top: 280,
            left: 370,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[4]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[4],
              label: 'T',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 430,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[5]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[5],
              label: 'Y',
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Si1()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              },  icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
    label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              ),),

          Positioned(
              bottom: 20, // Adjust position as needed
              left: 20, // Adjust position as needed
              child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Fi9()));
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
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,color: Colors.deepOrangeAccent,letterSpacing: 2,)),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}