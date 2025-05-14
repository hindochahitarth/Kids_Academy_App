import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Addition/addition3.dart';
import 'package:finalprjct1/Maths/Addition/addition4.dart';
import 'package:finalprjct1/Maths/Addition/addition5.dart';
import 'package:finalprjct1/Maths/Addition/addition6.dart';
import 'package:finalprjct1/Maths/Addition/addition8.dart';
import 'package:finalprjct1/Maths/Addition/additon1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../mathscategory.dart';

class Addition7 extends StatefulWidget{
  @override
  State<Addition7> createState() => _Addition7State();
}

class _Addition7State extends State<Addition7> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<bool> buttonVisibility = [false, false, false, false, false];
  List<String> audioFiles = [
    'assets/Maths/Additon/4.mp3',
    'assets/Maths/Additon/plus.mp3',
    'assets/Maths/Additon/4.mp3',
    'assets/Maths/Additon/equal.mp3',
    'assets/Maths/Additon/8.mp3',
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
          Image(image: AssetImage('assets/Maths/mathsadd.png'), fit: BoxFit.fill,),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MathsCategory()));
          },
             icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
             style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

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
              label: '4',

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

              audioFile: 'assets/Maths/Additon/plus.mp3',

              isVisible: buttonVisibility[1],
              label: '+',
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
              audioFile: '',

              isVisible: buttonVisibility[2],
              label: '4',
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

              audioFile: '',

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
              label: '8',
              //size: 180.0, // Set the desired size for Button 5
            ),
          ),
          Positioned(top: 335,left: 750, // Adjust position as needed
              child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Addition8()));
                audioPlayer.stop();
                audioPlayer.stop();
                audioPlayer.stop();audioPlayer.stop();audioPlayer.stop();}, icon: Icon(Icons.arrow_forward,size:50.0,color:Colors.blue), label: Text(''))
          ),

   Positioned(top: 335,left: 15,   // Adjust position as needed
              child: TextButton.icon(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Addition6()));
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
              child: Text(label,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 45,color: Colors.yellowAccent,letterSpacing: 2,)),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}