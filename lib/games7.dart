

import 'dart:async';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'games72.dart';
import 'home.dart';

class Games7 extends StatefulWidget {
  get semanticLabel => null;

  @override
  _Games7State createState() => _Games7State();
}

class _Games7State extends State<Games7> {

  List<String> leftSemanticLabels = ['apple', 'mango','s1'];
List<String> rightSemanticLabels = ['apple1', 'mango2','s2'];
AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

List<Offset> leftImagePositions = [
  Offset(300, 50),
  Offset(300, 170),

  Offset(300, 290),

];

List<Offset> rightImagePositions = [
  Offset(550, 50),
  Offset(550, 170),

  Offset(550, 290),
// Adjust vertical position for spacing
];

void shuffleImagesAndColors() {
 leftSemanticLabels.shuffle();
 rightSemanticLabels.shuffle();
}

@override
void initState() {
  super.initState();
  shuffleImagesAndColors();
}



List<Line> lines = [];
Offset? start;
Offset? end;

int starValue = 0; // Initialize star value
int totalScore = 3; // Total possible matches


Timer? audioTimer;

Map<String, String> connectedImages = {};
Set<String> lockedImages = Set();

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          end = details.localPosition;
        });
      },
      onPanStart: (details) {
        setState(() {
          start = details.localPosition;
        });
      },
      onPanEnd: (details) {
        setState(() {
          if (start != null && end != null) {
            final String? startLabel = getLabelForPoint(start!);
            final String? endLabel = getLabelForPoint(end!);

            if (startLabel != null &&
                endLabel != null &&
                startLabel != endLabel &&
                !lockedImages.contains(startLabel) &&
                !lockedImages.contains(endLabel)) {
              lines.add(Line(start!, end!));
              connectedImages[startLabel] = endLabel;
              connectedImages[endLabel] = startLabel;
              lockedImages.add(startLabel);
              lockedImages.add(endLabel);

              // Check if it's a correct match (e.g., 'apple' to 'apple1')
              if (checkMatch(startLabel, endLabel)) {
                starValue++; // Increase star value
              }
            }

            start = null;
            end = null;
          }
        });
      },
      child: CustomPaint(
        painter: LinePainter(
          leftImagePositions + rightImagePositions,
          lines,
          leftSemanticLabels.length,
        ),
        child: Stack(
          children: [
            for (int i = 0; i < leftSemanticLabels.length; i++)
              Positioned(
                left: leftImagePositions[i].dx - 50,
                top: leftImagePositions[i].dy - 50,
                child: Image.asset(
                  'assets/English/Phonics/${leftSemanticLabels[i]}.jpg',
                  width: 140,
                  height: 100,
                  semanticLabel: leftSemanticLabels[i],
                ),
              ),
            for (int i = 0; i < rightSemanticLabels.length; i++)
              Positioned(
                left: rightImagePositions[i].dx - 50,
                top: rightImagePositions[i].dy - 50,
                child: Image.asset(
                  'assets/English/Phonics/${rightSemanticLabels[i]}.jpg',
                  width: 140,
                  height: 100,
                  semanticLabel: rightSemanticLabels[i],
                ),
              ),
            Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
            ),),
            Positioned(top:200,right: 10,child: TextButton.icon(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Games72()));
            },
              icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.teal),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              style:TextButton.styleFrom(


              ),
            ),),
            Positioned(
              top: 5,
              right: 30,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    lines.clear();
                    lockedImages.clear();
                    connectedImages.clear();
                    starValue = 0;
                    shuffleImagesAndColors();
                  });
                },
                child: Icon(
                  Icons.refresh,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),


          ],
        ),
      ),
    ),

  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
  bottomNavigationBar: Container(
  padding: EdgeInsets.all(10),
  child: Row(
  children: [
  for (int i = 0; i < starValue; i++)
  Icon(
  Icons.star,
  color: Colors.amber,
    size: 50,
  ),
  for (int i = starValue; i < totalScore; i++)
  Icon(
  Icons.star_border,
  color: Colors.amber,
    size: 50,
  ),



  ],
  ),),

  );
}
bool checkMatch(String label1, String label2) {
  if ((label1 == 'apple' && label2 == 'apple1') ||
      (label1 == 'mango' && label2 == 'mango2') ||
      (label1 == 's1' && label2 == 's2')) {

    playAudio('assets/English/Articles/clap.mp3');
    audioTimer = Timer(Duration(seconds: 2), () {
      stopAudio();
    });
    return true;

  }
  playAudio('assets/English/Articles/wrong.mp3');
  return false;
}
void stopAudio() {
  try {
    assetsAudioPlayer.stop();
  } catch (e) {
    print("Error stopping audio: $e");
  }
}


// ...

@override
void dispose() {
  // Cancel the audio timer and stop audio when the widget is disposed
  audioTimer?.cancel();
  stopAudio();
  super.dispose();
}

String? getLabelForPoint(Offset point) {
  for (int i = 0; i < leftImagePositions.length + rightImagePositions.length; i++) {
    if (_isPointInImageBounds(point, i)) {
      if (i < leftImagePositions.length) {
        return leftSemanticLabels[i];
      } else {
        return rightSemanticLabels[i - leftImagePositions.length];
      }
    }
  }
  return null;
}

bool _isPointInImageBounds(Offset point, int imageIndex) {
  double imageWidth = 100; // Adjust as needed.
  double imageHeight = 100; // Adjust as needed.

  List<Offset> positions = leftImagePositions + rightImagePositions;

  if (imageIndex >= 0 && imageIndex < positions.length) {
    Offset imagePosition = positions[imageIndex];
    double left = imagePosition.dx - (imageWidth / 2);
    double top = imagePosition.dy - (imageHeight / 2);
    double right = left + imageWidth;
    double bottom = top + imageHeight;

    return point.dx >= left && point.dx <= right && point.dy >= top && point.dy <= bottom;
  }

  return false;
}
void playAudio(String audioAssetPath) async {
  try {
    await assetsAudioPlayer.open(Audio(audioAssetPath));
    assetsAudioPlayer.play();
  } catch (e) {
    print("Error playing audio: $e");
  }
}
void printConnections() {
  print('Connected Images:');
  connectedImages.forEach((image1, image2) {
    print('$image1 is connected to $image2');
  });
}
}

class LinePainter extends CustomPainter {
  final List<Offset> imagePositions;
  final List<Line> lines;
  final int leftImageCount;

  LinePainter(this.imagePositions, this.lines, this.leftImageCount);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (int i = 0; i < lines.length; i++) {
      final Line line = lines[i];
      final Offset startPosition = line.start;
      final Offset endPosition = line.end;

      if (i < leftImageCount) {
        canvas.drawLine(startPosition, endPosition, paint);
      } else {
        final Offset startPosition = imagePositions[i - leftImageCount];
        final Offset endPosition = imagePositions[i - leftImageCount];
        canvas.drawLine(startPosition, endPosition, paint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class Line {
  final Offset start;
  final Offset end;

  Line(this.start, this.end);
}
