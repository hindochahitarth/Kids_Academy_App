import 'package:assets_audio_player/assets_audio_player.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();

  factory AudioManager() {
    return _instance;
  }

  AudioManager._internal();

  final AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();

  void initialize() {
    audioPlayer.open(
      Audio("assets/General Awarness/Good Manners/ga.mp3"),
      autoStart: false,
      showNotification: true,
    );
  }

  void playMusic(String audioPath) {
    audioPlayer.open(
      Audio(audioPath),
      autoStart: true,
      showNotification: true,
    );
  }

  void pauseMusic() {
    audioPlayer.pause();
  }

  void resumeMusic() {
    audioPlayer.play();
  }

  void stopMusic() {
    audioPlayer.stop();
  }

  void setVolume(double volume) {
    audioPlayer.setVolume(volume);
  }
}
