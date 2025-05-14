import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class SettingsPage extends StatefulWidget {
  final AssetsAudioPlayer audioPlayer;

  SettingsPage({required this.audioPlayer});

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double volume = 50.0; // Initial volume value (range: 1 to 100)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Background Music Volume: ${(volume).toInt()}%'), // Display volume as a percentage
            Slider(
              value: volume,
              min: 1.0,
              max: 100.0,
              divisions: 99, // 100 steps from 1 to 100
              onChanged: (newValue) {
                setState(() {
                  volume = newValue;
                });

                // Set the volume of the audio player (convert to a range between 0.01 and 1.0)
                widget.audioPlayer.setVolume(volume / 100);
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Toggle play/pause of the audio
                widget.audioPlayer.playOrPause();
              },
              child: Text('Play/Pause Music'),
            ),
          ],
        ),
      ),
    );
  }
}
