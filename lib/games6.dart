import 'dart:async';
import 'dart:math';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Games6 extends StatefulWidget
{
  @override
  State<Games6> createState() => _Games6State();
}

class _Games6State extends State<Games6> {

  List<Color> boxColors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
// List<Widget> boxes = [];
// List<Widget> images = [];
//
// @override
// void initState() {
//   super.initState();
//   for (int i = 0; i < 1; i++) {
//     boxes.add(buildBox(i));
//     images.add(buildImage(i));
//   }
// }
//
// Widget buildBox(int index) {
//   return Expanded(
//     child: DragTarget<int>(
//       builder: (BuildContext context, List<int?> candidateData, List<dynamic> rejectedData) {
//         return Container(
//           color: boxColors[index],
//           height: 80.0, // Decrease the height of the container
//           width: 80.0, // Decrease the width of the container
//           margin: EdgeInsets.all(5.0), // Add some margin between boxes
//         );
//       },
//       onAccept: (int? data) {
//         setState(() {
//           images[data!] = SizedBox(); // Hide the dragged image
//         });
//       },
//     ),
//   );
// }
//
// Widget buildImage(int index) {
//   List<String> imageAssets = [
//     'assets/English/Phonics/apple.jpg',
//      'assets/English/Phonics/apple.jpg',
//      'assets/English/Phonics/apple.jpg',
//      'assets/English/Phonics/apple.jpg',
//    ];
//
//   return Draggable<int>(
//     data: index,
//     child: Image.asset(
//       imageAssets[index],
//       width: 50.0, // Decrease the width of the image
//       height: 50.0, // Decrease the height of the image
//     ),
//     feedback: Image.asset(
//       imageAssets[index],
//       width: 50.0, // Decrease the width of the image
//       height: 50.0, // Decrease the height of the image
//     ),
//     childWhenDragging: SizedBox(), // Hide the image when dragging
//   );
// }
//
// @override
// Widget build(BuildContext context) {
//   return Column(
//     children: [
//       Row(
//         children: boxes,
//       ),
//       Row(
//         children: images,
//       ),
//     ],
//   );
// }
// }
List<String> allImages = ["apple.jpg", "jug.jpg", "tree.jpg", "lemon.jpg"];
Map<String, String?> imageBoxColorMap = {};
Random random = Random();

int score = 0;
int maxScore = 4; // Set the maximum possible score to 3 for all three images

// Define star icons
List<IconData> filledStars = [Icons.star];
List<IconData> unfilledStars = [Icons.star_border];

// Create a list of stars to display
List<IconData> starIcons = [];

void shuffleImagesAndColors() {
  allImages.shuffle(random);
  boxColors.shuffle(random);
}
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();

Map<Color, String> colorNames = {
  Colors.red: "Red",
  Colors.green: "Green",
  Colors.blue: "Blue",
  Colors.yellow: "Yellow",
};
  Timer? audioTimer;


Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      leading:  Positioned(top: 200,left: 20,child: ElevatedButton.icon(onPressed: (){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
      },
        icon: Icon(Icons.arrow_back,size:20.0,color: Colors.brown),
        label: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
        style:ElevatedButton.styleFrom(
            backgroundColor: Colors.white
        ),
      ),),

      title: Text(''),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Row(
            children: [
              for (var icon in starIcons)
                Icon(
                  icon,
                  color: Colors.orange,
                  size: 25,
                ),
              SizedBox(width: 4),
              Text(
                '$score / $maxScore',
                style: TextStyle(color: Colors.orange, fontSize: 25),
              ),
              IconButton(
                icon: Icon(Icons.refresh,color: Colors.black,size: 25,),
                onPressed: () {
                  setState(() {
                    // Reset the game by clearing imageBoxColorMap and reshuffling images and colors
                    imageBoxColorMap.clear();
                    score = 0;
                    starIcons = [];
                    shuffleImagesAndColors();
                  });
                },
              ),
            ],
          ),
        ),
      ],
    ),
    body: Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.only(top: 16.0), // Add padding at the top
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: allImages.length,
              itemBuilder: (context, index) {
                String image = allImages[index];
                if (!imageBoxColorMap.containsKey(image)) {
                  return Draggable<String>(
                    data: image,
                    child: Transform.scale(
                      scale: 0.7,
                      child: Image.asset('assets/English/Phonics/$image'),
                    ),
                    feedback: Transform.scale(
                      scale: 0.7,
                      child: Image.asset('assets/English/Phonics/$image'),
                    ),
                    childWhenDragging: Container(),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Remove space between containers
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            for (int i = 0; i < boxColors.length; i++)
              DragTarget<String>(
                onAccept: (data) {
                  setState(() {
                    imageBoxColorMap[data] = colorNames[boxColors[i]]!;
                  });

                  checkScore();
                },
                builder: (context, candidateData, rejectedData) {
                  return Container(
                    width: 200,
                    height: 150,
                    color: boxColors[i],
                  );
                },
              ),

          ],
        ),
      ],
    ),
  );
}void stopAudio() {
    try {
      assetsAudioPlayer.stop();
    } catch (e) {
      print("Error stopping audio: $e");
    }
  }
  void playAudio(String audioAssetPath) async {
    try {
      await assetsAudioPlayer.open(Audio(audioAssetPath));
      assetsAudioPlayer.play();
    } catch (e) {
      print("Error playing audio: $e");
    }
  }
  void checkScore() {
  int correctImages = 0;
  for (String image in allImages) {
    if (image.contains("apple") && imageBoxColorMap[image] == "Red") {

      playAudio('assets/English/Articles/clap.mp3');
      audioTimer = Timer(Duration(seconds: 2), () {
        stopAudio();
      });

      correctImages++;
    } else if (image.contains("jug") && imageBoxColorMap[image] == "Blue") {
      playAudio('assets/English/Articles/clap.mp3');
      audioTimer = Timer(Duration(seconds: 2), () {
        stopAudio();
      });
      correctImages++;
    } else if (image.contains("tree") && imageBoxColorMap[image] == "Green") {

      playAudio('assets/English/Articles/clap.mp3');
      audioTimer = Timer(Duration(seconds: 2), () {
        stopAudio();
      });
      correctImages++;
    } else if (image.contains("lemon") && imageBoxColorMap[image] == "Yellow") {

      playAudio('assets/English/Articles/clap.mp3');
      audioTimer = Timer(Duration(seconds: 2), () {
        stopAudio();
      });
      correctImages++;
    }
    // Add similar checks for other images and colors as needed.
  }
  setState(() {
    score = correctImages;
    // Update the star icons based on the score
    starIcons = List.generate(maxScore, (index) {
      return index < score ? filledStars[0] : unfilledStars[0];
    });
  });

  if (score == maxScore) {
    print('All four images are in their correct boxes! Score: $score');
    // You can perform any action here when all four images are in the correct boxes.
  }
}}