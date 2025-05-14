import 'package:finalprjct1/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Games3 extends StatefulWidget
{
  @override
  State<Games3> createState() => _Games3State();
}

class _Games3State extends State<Games3> {List<Color> boxColors = [Colors.red, Colors.blue, Colors.green, Colors.yellow];
List<Widget> draggedImages = [];

@override
Widget build(BuildContext context) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: boxColors
            .map((color) => DragTarget<Color>(
          builder: (context, List<Color?> acceptedColors, rejectedData) {
            return Container(
              width: 50,
              height: 100,
              color: acceptedColors.isEmpty ? color : Colors.transparent,
            );
          },
          onWillAccept: (data) {
            return true;
          },
          onAccept: (data) {
            setState(() {
              boxColors.remove(data!);
            });
          },
        ))
            .toList(),
      ),
      SizedBox(height: 20),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Draggable<Color>(
            data: Colors.red,
            child: Image.asset('assets/English/Phonics/apple.jpg', width: 50, height: 50),
            feedback: Image.asset('assets/red.png', width: 50, height: 50),
            childWhenDragging: Container(), // This hides the image when dragging.
          ),
          Draggable<Color>(
            data: Colors.blue,
            child: Image.asset('assets/blue.png', width: 50, height: 50),
            feedback: Image.asset('assets/blue.png', width: 50, height: 50),
            childWhenDragging: Container(),
          ),
          Draggable<Color>(
            data: Colors.green,
            child: Image.asset('assets/green.png', width: 50, height: 50),
            feedback: Image.asset('assets/green.png', width: 50, height: 50),
            childWhenDragging: Container(),
          ),
          Draggable<Color>(
            data: Colors.yellow,
            child: Image.asset('assets/yellow.png', width: 50, height: 50),
            feedback: Image.asset('assets/yellow.png', width: 50, height: 50),
            childWhenDragging: Container(),
          ),
        ],
      ),
    ],
  );
}
}


//   List<String> allImages = ["apple.jpg", "jug.jpg", "tree.jpg", "orange.png"];List<String> droppedImages = [];
//   Map<String, String?> imageBoxColorMap = {};
//
//   Map<Color, String> colorNames = {
//     Colors.red: "Red",
//     Colors.green: "Green",
//     Colors.blue: "Blue",
//     Colors.orange: "Orange",
//   };
//   int currentPosition = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     List<Color> boxColors = colorNames.keys.toList();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Draggable Images'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: GridView.builder(
//               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 4,
//               ),
//               itemCount: allImages.length,
//               itemBuilder: (context, index) {
//                 String image = allImages[index];
//                 if (!droppedImages.contains(image)) {
//                   return Draggable<String>(
//                     data: image,
//                     child: Transform.scale(
//                       scale: 0.7, // Adjust image size as needed
//                       child: Image.asset('assets/English/Phonics/$image'),
//                     ),
//                     feedback: Transform.scale(
//                       scale: 0.7, // Adjust image size as needed
//                       child: Image.asset('assets/English/Phonics/$image'),
//                     ),
//                     childWhenDragging: Container(),
//                   );
//                 } else {
//                   return Container(); // Don't display dropped images
//                 }
//               },
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               for (int i = 0; i < boxColors.length; i++)
//                 DragTarget<String>(
//                   onAccept: (data) {
//                     setState(() {
//                       imageBoxColorMap[data] = colorNames[boxColors[i]]!;
//                       droppedImages.add(data); // Add the dropped image to the list
//                     });
//                   },
//                   builder: (context, candidateData, rejectedData) {
//                     return Container(
//                       width: 100,
//                       height: 100,
//                       color: boxColors[i],
//                       // child: Center(
//                       //   child: Text(
//                       //     imageBoxColorMap[droppedImages[i]] ?? "Drop Here",
//                       //     style: TextStyle(
//                       //       color: Colors.white,
//                       //     ),
//                       //   ),
//                       // ),
//                     );
//                   },
//                 ),
//             ],
//           ),
//           SizedBox(height: 20),
//          // TextButton(
//          //   onPressed: (){
//          //
//          //     imageBoxColorMap.forEach((image,colorName) {
//          //
//          //     });
//          //   },
//          //   child: Text(''),
//          // ),
//          //
//           // ElevatedButton(
//           //   onPressed: () {
//           //     imageBoxColorMap.forEach((image, colorName) {
//           //       if (colorName != null) {
//           //         print('Image "$image" is in a $colorName colored box');
//           //       } else {
//           //         print('Image "$image" is not in any box');
//           //       }
//           //     });
//           //   },
//           //   child: Text('Check Image-Box Associations'),
//           // ),
//           //SizedBox(height: 20),
//           // Positioned(
//           //   bottom: 20.0, // Adjust the position as needed
//           //   left: 50.0, // Adjust the position as needed
//           //   child: IconButton(
//           //     icon: Icon(
//           //       currentPosition == 0 ? Icons.forward : Icons.check,
//           //       size: 40.0, // Adjust the size as needed
//           //     ),
//           //     onPressed: () {
//           //       _showNextGameDialog(context);
//           //     },   ),
//           // ),
//           Positioned(top: 25,left: 20,child: ElevatedButton.icon(onPressed: (){
//             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
//           },
//             icon: Icon(Icons.arrow_back,size:20.0,color: Colors.brown),
//             label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
//             style:ElevatedButton.styleFrom(
//               //  backgroundColor: Colors.grey
//             ),
//           ),),
//
//         ],
//       ),
//     );
//   }
// }
// void _showNextGameDialog(BuildContext context) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text("Go to Next Game?"),
//         content: Text("Are you sure you want to go to the next game?"),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text("No"),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//               // Navigate to a different page (replace `YourNextPage` with the actual page)
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                 builder: (context) => YourNextPage(),
//               ));
//             },
//             child: Text("Yes"),
//           ),
//         ],
//       );
//     },
//   );
// }
//
//
// class YourNextPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Next Page'),
//       ),
//       body: Center(
//         child: Text('This is the next page.'),
//       ),
//     );
//   }
// }
