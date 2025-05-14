import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Games5 extends StatefulWidget{
  @override
  State<Games5> createState() => _Games5State();
}

class _Games5State extends State<Games5> { bool isImageDropped = false; // Track if the image has been dropped into a container

@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            RowOfColorBoxes(),
            RowOfDraggableImages(),
          ],
        ),
      ),
    ),
  );
}
}

class RowOfColorBoxes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
          color: Colors.red,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 4,
        ),
        Container(
          color: Colors.green,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 4,
        ),
        Container(
          color: Colors.blue,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 4,
        ),
        Container(
          color: Colors.yellow,
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width / 4,
        ),
      ],
    );
  }
}

class RowOfDraggableImages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        DraggableImage('assets/English/Phonics/apple.jpg'),
        DraggableImage('assets/English/Phonics/bat.jpg'),
        DraggableImage('assets/English/Phonics/ant.jpg'),
        DraggableImage('assets/English/Phonics/chair.jpg'),
      ],
    );
  }
}

class DraggableImage extends StatefulWidget {
  final String imagePath;

  DraggableImage(this.imagePath);

  @override
  _DraggableImageState createState() => _DraggableImageState();
}

class _DraggableImageState extends State<DraggableImage> {
  bool isDropped = false; // Track if the image has been dropped into a container

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: widget.imagePath,
      child: isDropped
          ? Container() // Hide the image if it's dropped
          : Image.asset(
        widget.imagePath,
        height: 100,
        width: 100,
      ),
      feedback: Image.asset(
        widget.imagePath,
        height: 100,
        width: 100,
      ),
      childWhenDragging: Container(
        height: 100,
        width: 100,
      ),
      onDragCompleted: () {
        // When the drag operation is completed, set isDropped to true
        setState(() {
          isDropped = true;
        });
      },
    );
  }
}