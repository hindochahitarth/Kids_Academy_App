import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Animbutton extends StatefulWidget{
  @override
  State<Animbutton> createState() => _AnimbuttonState();
}

class _AnimbuttonState extends State<Animbutton> {
  final audioPlayer = AssetsAudioPlayer.newPlayer();
  List<String> audioAssets = [
    'assets/Maths/Numbers/1(o).mp3',
    'assets/Maths/Numbers/1(o).mp3',
    ];
  List<String> imageAssets = [
    'assets/Maths/Numbers/2.jpg',
    'assets/Maths/Numbers/1.jpg',
   ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
   // _showImagesSequentially();
    _playAudiosAndShowImages();
  }
  Future<void> _playAudiosAndShowImages() async {
    for (var i = 0; i < imageAssets.length; i++) {
      await Future.delayed(Duration(seconds: 2), () async {
        await audioPlayer.open(
          Audio(audioAssets[i]),
          autoStart: true,
        );

        setState(() {
          currentIndex = i;
        });
      });

      await Future.delayed(Duration(seconds: 3));
    }

    print('All audios played.');
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio and Image Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i <= currentIndex; i++)
              Column(
                children: [
                  Image.asset(
                    imageAssets[i],
                    width: 150,
                    height: 150,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}