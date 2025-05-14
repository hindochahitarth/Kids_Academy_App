// import 'package:flutter/material.dart';
//
//
// class MatchingGame extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Matching Game',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MatchingGameScreen(),
//     );
//   }
// }
//
// class MatchingGameScreen extends StatefulWidget {
//   @override
//   _MatchingGameScreenState createState() => _MatchingGameScreenState();
// }
//
// class _MatchingGameScreenState extends State<MatchingGameScreen> {
//   List<Line> lines = [];
//   Offset? currentPoint;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Matching Game'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Stack(
//               children: <Widget>[
//                 // Image 1 (Apple)
//                 Positioned(
//                   left: 50,
//                   top: 50,
//                   child: GestureDetector(
//                     onPanUpdate: (details) {
//                       onImageTapped('Apple', details.localPosition);
//                     },
//                     child: Image.asset(
//                       'assets/English/Phonics/apple.jpg',
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ),
//                 // Image 2 (Letter 'A')
//                 Positioned(
//                   left: 200,
//                   top: 50,
//                   child: GestureDetector(
//                     onPanUpdate: (details) {
//                       onImageTapped('Letter A', details.localPosition);
//                     },
//                     child: Image.asset(
//                       'assets/English/Phonics/apple.jpg',
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                 ),
//                 // CustomPaint for drawing lines
//                 CustomPaint(
//                   size: Size(400, 200),
//                   painter: LinePainter(lines, currentPoint),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           setState(() {
//             lines.clear();
//           });
//         },
//         child: Icon(Icons.clear),
//       ),
//     );
//   }
//
//   void onImageTapped(String imageName, Offset position) {
//     setState(() {
//       if (currentPoint == null) {
//         currentPoint = position;
//       } else {
//         lines.add(Line(start: currentPoint!, end: position, imageName: imageName));
//         currentPoint = null;
//       }
//     });
//   }
// }
//
// class LinePainter extends CustomPainter {
//   final List<Line> lines;
//   final Offset? currentPoint;
//
//   LinePainter(this.lines, this.currentPoint);
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.red
//       ..strokeCap = StrokeCap.round
//       ..strokeWidth = 5.0;
//
//     for (final line in lines) {
//       canvas.drawLine(line.start, line.end, paint);
//     }
//
//     if (currentPoint != null) {
//       canvas.drawLine(currentPoint!, currentPoint!, paint);
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }
//
// class Line {
//   final Offset start;
//   final Offset end;
//   final String imageName;
//
//   Line({required this.start, required this.end, required this.imageName});
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyGame2 extends StatefulWidget {
  @override
  _MyGame2State createState() => _MyGame2State();
}

class _MyGame2State extends State<MyGame2> {
  List<String> labels = ['Ant', 'Apple'];
  List<Line> lines = [];
  String? connectionInfo; // Stores the connection information

  List<Offset> imagePositions = List.filled(2, Offset.zero); // List to store image positions

  Offset? startPoint;
  Offset? endPoint;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      // Get the positions of the images after the widgets are built
      for (int i = 0; i < labels.length; i++) {
        final key = GlobalKey();
        final RenderBox renderBox = key.currentContext!.findRenderObject() as RenderBox;
        imagePositions[i] = renderBox.localToGlobal(Offset.zero);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Matching Game'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            CustomPaint(
              size: Size(400.0, 100.0),
              painter: LinePainter(lines),
              child: GestureDetector(
                onPanStart: (details) {
                  setState(() {
                    startPoint = details.localPosition;
                    endPoint = details.localPosition;
                  });
                },
                onPanUpdate: (details) {
                  setState(() {
                    endPoint = details.localPosition;
                    lines.clear(); // Clear existing lines
                    lines.add(Line(startPoint!, endPoint!));
                  });
                },
                onPanEnd: (details) {
                  _checkForConnection();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    GestureDetector(
                      key: GlobalKey(),
                      onTap: () {
                        _handleTap('Ant');
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Ant'),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      key: GlobalKey(),
                      onTap: () {
                        _handleTap('Apple');
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        color: Colors.grey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Apple'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            if (connectionInfo != null)
              Text(
                'Connected: $connectionInfo',
                style: TextStyle(fontSize: 18),
              ),

          ],
        ),
      ),
    );
  }

  void _handleTap(String label) {
    // Handle the tap on an image.
    if (startPoint == null) {
      return;
    }

    if (startPoint != null) {
      endPoint = Offset(
        imagePositions[labels.indexOf(label)].dx + 50,
        imagePositions[labels.indexOf(label)].dy + 50,
      );
      lines.clear();
      lines.add(Line(startPoint!, endPoint!));
      _checkForConnection();
    }
  }

  void _checkForConnection() {
    if (startPoint == null || endPoint == null) {
      return;
    }

    List<String> connectedLabels = [];

    if (_isPointInsideImage(startPoint!, 'Ant') &&
        _isPointInsideImage(endPoint!, 'Ant')) {
      connectedLabels.add('Ant');
    }

    if (_isPointInsideImage(startPoint!, 'Apple') &&
        _isPointInsideImage(endPoint!, 'Apple')) {
      connectedLabels.add('Apple');
    }

    if (connectedLabels.length == 2) {
      setState(() {
        connectionInfo = '${connectedLabels[0]} - ${connectedLabels[1]}';
      });
    } else {
      setState(() {
        connectionInfo = null;
      });
    }
  }

  bool _isPointInsideImage(Offset point, String label) {
    double imageWidth = 100.0;
    double imageHeight = 100.0;

    double imageX = imagePositions[labels.indexOf(label)].dx;
    double imageY = imagePositions[labels.indexOf(label)].dy;

    if (point.dx >= imageX && point.dx <= imageX + imageWidth &&
        point.dy >= imageY && point.dy <= imageY + imageHeight) {
      return true;
    }

    return false;
  }
}

class Line {
  final Offset startPoint;
  final Offset endPoint;

  Line(this.startPoint, this.endPoint);
}

class LinePainter extends CustomPainter {
  final List<Line> lines;

  LinePainter(this.lines);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5;

    for (var line in lines) {
      canvas.drawLine(line.startPoint, line.endPoint, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
