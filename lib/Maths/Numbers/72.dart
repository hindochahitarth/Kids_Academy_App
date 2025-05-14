import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Numbers/71.dart';
import '73.dart';
import 'package:flutter/material.dart';

import '../maths.dart';


class Se2 extends StatefulWidget {
  @override
  _Se2State createState() => _Se2State();
}

class _Se2State extends State<Se2> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false,false,false, false, false, false, false, false, false];
  List<String> audioFiles = [
    'assets/Maths/Numbers/72.mp3',
    'assets/English/Alphabets/s.mp3',

    'assets/English/Alphabets/e.mp3',
    'assets/English/Alphabets/v.mp3',

    'assets/English/Alphabets/e.mp3',
    'assets/English/Alphabets/n.mp3',
    'assets/English/Alphabets/t.mp3',
    'assets/English/Alphabets/y.mp3',
    'assets/English/Alphabets/t.mp3',
    'assets/English/Alphabets/w.mp3',
    'assets/English/Alphabets/o.mp3',

    'assets/Maths/Numbers/72.mp3',

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
              label: '72',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(
            top: 280,
            left: 180,
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
            left: 240,
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
            left: 300,
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
            left: 360,
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
            left: 420,
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
            left: 480,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[6]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[6],
              label: 'T',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 550,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[7]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[7],
              label: 'Y',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ),
          Positioned(
            top: 280,
            left: 610,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[8]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[8],
              label: 'T',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ), Positioned(
            top: 280,
            left: 670,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[9]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[9],
              label: 'W',
              //   size: 160.0, // Set the desired size for Button 4
            ),
          ), Positioned(
            top: 280,
            left: 730,
            child: AnimatedButton(
              onPressed:(){
                audioPlayer.open(Audio(audioFiles[10]));
                audioPlayer.play();
              },

              audioFile: 'assets/Maths/Numbers/hello.mp3',

              isVisible: buttonVisibility[10],
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Se3()));
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
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Se1()));
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