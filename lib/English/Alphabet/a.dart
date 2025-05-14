import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/alphacategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'b.dart';

class Alphaa extends StatefulWidget{
  @override
  State<Alphaa> createState() => _AlphaaState();
}

class _AlphaaState extends State<Alphaa> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false];
  List<String> audioFiles = [
    'assets/English/Alphabets/a.mp3',
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AlphaCategory()));
          },
            
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
             style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

          Positioned(
           top: 180,
            left: 400,width: 400,
            child: AnimatedButton(

              onPressed:(){
                audioPlayer.open(Audio(audioFiles[0]));
                audioPlayer.play();
              },

              audioFile: '',
              isVisible: buttonVisibility[0],
              label: 'A',

              // size: 100.0, // Set the desired size for Button 1
            ),
          ),
          Positioned(top: 185,left: 770,child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Alphab()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();
              }, icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
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
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 55,color: Colors.indigo,letterSpacing: 2,)),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}