import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'Transportcategory.dart';

class Aeroplane extends StatefulWidget {
  @override
  State<Aeroplane> createState() => _AeroplaneState();
}

class _AeroplaneState extends State<Aeroplane> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;

  // Firebase Storage reference
  final Reference storageReference =
  FirebaseStorage.instance.ref().child('apple.png');

  // Image URL from Firebase Storage
  String imageUrl = '';

  @override
  void initState() {
    super.initState();
    playMusic();}

  Future<void> playMusic() async {
    await assetsAudioPlayer.open(
      Audio('assets/General Awarness/Transport/Airways/aeroplane.mp3'),
      autoStart: true,
      showNotification: true,
    );
    setState(() {
      isPlaying = true;
    });
  }

  @override
  void dispose() {
    assetsAudioPlayer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Your existing UI components here
          Positioned(
            top: 5,
            left: 5,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Transport()),
                );
              },
              icon: Icon(Icons.arrow_back, size: 20.0, color: Colors.white),
              label: Text(
                '',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            ),
          ),
          Positioned(
            top: 35,
            left: 190,
            child: imageUrl.isNotEmpty
                ? Image.network(
              imageUrl,
              height: 290,
              width: 450,
              fit: BoxFit.fill,
            )
                : CircularProgressIndicator(),
          ),
          Positioned(
            child: TextButton(
              onPressed: () {
                playMusic();
              },
              child: Text(
                'AEROPLANE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3,
                ),
              ),
              style: TextButton.styleFrom(
                elevation: 20,
                shadowColor: Colors.brown,
                backgroundColor: Colors.blue,
                shape: StadiumBorder(),
              ),
            ),
            width: 150,
            top: 330,
            left: 350,
          ),
        ],
      ),
    );
  }
}
