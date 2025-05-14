import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finalprjct1/Maths/Numbers/one.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../maths.dart';



class Numbers extends StatefulWidget{

  @override
  State<Numbers> createState() => _NumbersState();
}

class _NumbersState extends State<Numbers> {
  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  List<bool> buttonVisibility=[false,false];
  List<String> audioFiles=[];
  int num=0;
  List<String> spells=['o-n-e','two'];
  List<String> chars=[''];


  @override
  void initState() {
    super.initState();
    //_showButtonsWithDelay();
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
    // }
    // void _playAudio(int buttonIndex) {
    // //   audioPlayer.open(Audio(audioFiles[buttonIndex]));
    // //   audioPlayer.play();
    // // }
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 25, left: 20, child: ElevatedButton.icon(onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Maths()));
            },
              icon: Icon(Icons.arrow_back, size: 20.0, color: Colors.brown),
              label: Text('Home', style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown),),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey
              ),
            ),),

            Positioned(
              top: 150,
              left: 380,
              child: AnimatedButton(

                onPressed: () {
                  audioPlayer.open(Audio(audioFiles[0]));
                  audioPlayer.play();
                },

                audioFile: '',
                isVisible: buttonVisibility[0],
                label: '0',

                // size: 100.0, // Set the desired size for Button 1
              ),
            ),
            Positioned(
              top: 280,
              left: 300,
              child: AnimatedButton(
                onPressed: () {
                  audioPlayer.open(Audio(audioFiles[1]));
                  audioPlayer.play();
                },

                audioFile: 'assets/Maths/Additon/plus.mp3',

                isVisible: buttonVisibility[1],
                label: 'Z',
                //size: 120.0, // Set the desired size for Button 2
              ),
            ),
            Positioned(
              top: 280,
              left: 360,
              child: AnimatedButton(
                onPressed: () {
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
              left: 420,
              child: AnimatedButton(
                onPressed: () {
                  audioPlayer.open(Audio(audioFiles[3]));
                  audioPlayer.play();
                },

                audioFile: 'assets/Maths/Numbers/hello.mp3',

                isVisible: buttonVisibility[3],
                label: 'R',
                //   size: 160.0, // Set the desired size for Button 4
              ),
            ),
            Positioned(
              top: 280,
              left: 480,
              child: AnimatedButton(
                onPressed: () {
                  audioPlayer.open(Audio(audioFiles[4]));
                  audioPlayer.play();
                },

                audioFile: 'assets/Maths/Numbers/hello.mp3',

                isVisible: buttonVisibility[4],
                label: 'O',
                //   size: 160.0, // Set the desired size for Button 4
              ),
            ),

            Positioned(
              top: 280,
              left: 600,
              child: AnimatedButton(
                onPressed: () {
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
                child: TextButton.icon(onPressed: () {
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => One()));
                  audioPlayer.stop();
                  audioPlayer.stop();
                  audioPlayer.stop();
                  audioPlayer.stop();
                  audioPlayer.stop();
                }, icon: Icon(Icons.arrow_forward), label: Text(''))
            ),

          ],

        ),
      );
    }
    }