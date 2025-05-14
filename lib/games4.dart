import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Games4 extends StatefulWidget{
  @override
  State<Games4> createState() => _Games4State();
}

class _Games4State extends State<Games4> {

  Map<String, String> imageToBox = {}; // To store which image goes into which box.

  void onImageDrag(String imagePath, String color) {
    setState(() {
      imageToBox[imagePath] = color;
    });
    print('$imagePath goes into $color');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Matching Game'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                _buildBoxWidget('Redd'),
                _buildBoxWidget('Green'),
                _buildBoxWidget('Blue'),
                _buildBoxWidget('Yellow'),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                _buildImageWidget('assets/English/Phonics/apple.jpg', 'Redd'),
                _buildImageWidget('assets/English/Phonics/apple.jpg', 'Green'),
                _buildImageWidget('image3.png', 'Blue'),
                _buildImageWidget('image4.png', 'Yellow'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxWidget(String color) {
    return Expanded(
      child: DragTarget<String>(
        builder: (BuildContext context, List<String?> candidateData, List<dynamic> rejectedData) {
          return Container(
            color: getColor(color),
            child: Center(
              child: Text(
                color,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          );
        },
        onWillAccept: (data) {
          // Check if the box accepts the dragged image.
          return data == color;
        },
        onAccept: (data) {
          // Called when an image is successfully dropped into the box.
          onImageDrag(data!, color);
        },
      ),
    );
  }

  Color getColor(String color) {
    switch (color) {
      case 'Redd':
        return Colors.red;
      case 'Green':
        return Colors.green;
      case 'Blue':
        return Colors.blue;
      case 'Yellow':
        return Colors.yellow;
      default:
        return Colors.white;
    }
  }

  Widget _buildImageWidget(String imagePath, String color) {
    return Visibility(
      visible: !imageToBox.containsKey(imagePath),
      child: Stack(
        children: [
          // This is the color box
          Positioned.fill(
            child: DragTarget<String>(
              builder: (BuildContext context, List<String?> candidateData, List<dynamic> rejectedData) {
                return Container(
                  color: getColor(color),
                );
              },
              onWillAccept: (data) {
                return data == color;
              },
              onAccept: (data) {
                onImageDrag(data!, color);
              },
            ),
          ),
          // This is the draggable image
          Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: Draggable<String>(
              data: color,
              child: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              feedback: Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              childWhenDragging: Container(
                width: 80,
                height: 80,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
