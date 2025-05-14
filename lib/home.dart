import 'dart:async';

import 'package:finalprjct1/games3.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/Maths/maths.dart';
import 'package:finalprjct1/gs.dart';
import 'package:finalprjct1/newpage.dart';
import 'package:finalprjct1/vc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'English/english.dart';
import 'package:wakelock/wakelock.dart';
import 'anim.dart';
import 'games.dart';
import 'games2.dart';
import 'games4.dart';
import 'games5.dart';
import 'games6.dart';
import 'games7.dart';
class ScreenLockObserver extends WidgetsBindingObserver {
  final AssetsAudioPlayer _audioPlayer = AssetsAudioPlayer();

  @override
  void didChangeMetrics() {
    // Get the current screen brightness
    // When the screen is locked, the brightness will change.
    final brightness = WidgetsBinding.instance!.window.platformBrightness;

    if (brightness == Brightness.dark) {
      // Screen is locked, pause audio playback
      // Add your code here to pause the music/audio playback
    } else {
      // Screen is unlocked, resume audio playback
      // Add your code here to resume the music/audio playback
    }
  }
}


class Home extends StatefulWidget
{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScreenLockObserver _screenLockObserver = ScreenLockObserver();

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;

  bool isScreenLocked = false;

  @override
  void initStat() {
    super.initState();
    WidgetsBinding.instance!.addObserver(_screenLockObserver);

    // Initialize your audio player and add audio assets to it.
    _initializeAudioPlayer();
   playMusic();
    print('called');
    Wakelock.enable();

  }
  void _initializeAudioPlayer() async {
    // Add your audio assets to the player. Replace 'your_audio_asset.mp3' with the actual asset path.
    await _screenLockObserver._audioPlayer.open(
      Audio("assets/your_audio_asset.mp3"),
      autoStart: false,
      loopMode: LoopMode.none,
    );
  }
  Future<void> playMusic() async {
    await assetsAudioPlayer.open(
      Audio('assets/General Awarness/Good Manners/ga.mp3'),
      autoStart: true,
      showNotification: true,

    );
    setState(() {
      isPlaying = true;
    });
    void dispose() {
      WidgetsBinding.instance!.removeObserver(_screenLockObserver);
      assetsAudioPlayer.stop();
      super.dispose();

    }
  }
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Determine the button width based on screen width
    double buttonWidth = screenWidth > 600 ? 250 : 200;
    print(buttonWidth);
    print(screenWidth);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            // Your background image or widget
            Image(
              image: AssetImage('assets/General Awarness/Good Manners/ga1.png'),
              fit: BoxFit.fill,
            ),

            // Button 1 (General Awareness)
            Positioned(
              top: 120,
              left: 180,
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GeneralAwar()));
                },
                child: Text(
                  'General Awareness',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  primary: Colors.white,
                  elevation: 10,
                ),
              ),
            ),

            // Button 2 (English)
            Positioned(
              top: 190,
              left: 180,
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => English()));
                },
                child: Text(
                  'English',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  primary: Colors.white,
                  elevation: 10,
                ),
              ),
            ),

            // Button 3 (Maths)
            Positioned(
              top: 120,
              left: 460,
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Maths()));
                },
                child: Text(
                  'Maths',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  primary: Colors.white,
                  elevation: 10,
                ),
              ),
            ),

            // Button 4 (Game 1)
            Positioned(
              top: 190,
              left: 460,
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Games7()));
                },
                child: Text(
                  'Game 1',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 1),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  primary: Colors.white,
                  elevation: 10,
                ),
              ),
            ),

            // Button 5 (Game 2)
            Positioned(
              top: 270,
              left: 320,
              width: buttonWidth,
              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Games6()));
                },
                child: Text(
                  'Game 2',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  primary: Colors.white,
                  elevation: 10,
                ),
              ),
            ),

            // Your other buttons or widgets can be added in a similar manner

            // Buttons for navigation and settings
            Positioned(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black, size: 40),
                label: Text('', style: TextStyle(fontSize: 50, color: Colors.black)),
              ),
              top: 10,
              left: 5,
            ),
            Positioned(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.home, color: Colors.black, size: 40),
                label: Text(''),
              ),
              top: 5,
              left: 550,
            ),
            Positioned(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.search, color: Colors.black, size: 40),
                label: Text(''),
              ),
              top: 5,
              left: 620,
            ),
            Positioned(
              child: TextButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(audioPlayer: assetsAudioPlayer)));
                },
                icon: Icon(Icons.settings, color: Colors.black, size: 40),
                label: Text(''),
              ),
              top: 5,
              left: 690,
            ),
            Positioned(
              child: TextButton.icon(
                onPressed: () {},
                icon: Icon(Icons.help, color: Colors.black, size: 40),
                label: Text(''),
              ),
              top: 5,
              left: 760,
            ),
          ],
        ),
        backgroundColor: Colors.grey,
      ),
    );
  }
}