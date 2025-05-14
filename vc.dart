import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

class VolumeControl extends StatefulWidget {
  final AssetsAudioPlayer audioPlayer;

  const VolumeControl({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  _VolumeControlState createState() => _VolumeControlState();
}

class _VolumeControlState extends State<VolumeControl> {
  double volume = 0.5; // Initial volume value (between 0.0 and 1.0)

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 50,
      right: 20,
      child: FlutterSlider(
        values: [volume],
        max: 1.0,
        min: 0.0,
        onDragging: (handlerIndex, lowerValue, upperValue) {
          updateVolume(lowerValue);
        },
        tooltip: FlutterSliderTooltip(disabled: true),
        handler: FlutterSliderHandler(
          decoration: BoxDecoration(),
          child: Material(
            type: MaterialType.circle,
            color: Colors.blue,
            elevation: 3,
            child: Container(
              padding: EdgeInsets.all(5),
              child: Icon(
                Icons.volume_up,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
        trackBar: FlutterSliderTrackBar(
          activeTrackBarHeight: 3,
          activeTrackBar: BoxDecoration(color: Colors.blue),
        ),
      ),
    );
  }

  void updateVolume(double value) {
    setState(() {
      volume = value;
    });
    widget.audioPlayer.setVolume(volume); // Update the audio volume
  }
}
