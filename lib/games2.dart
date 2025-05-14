

  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';

import 'home.dart';

  class MyGame extends StatefulWidget {
  get semanticLabel => null;

  @override
  _MyGameState createState() => _MyGameState();
  }

  class _MyGameState extends State<MyGame> {   List<String> semanticLabels = ['apple', 'ant', 'cat', 'chair'];
  List<Offset> imagePositions = [
    Offset(0, 0),
    Offset(120, 0),
    Offset(0, 120),
    Offset(120, 120),
  ];
  List<Line> lines = [];
  Offset? start;
  Offset? end;

  // Store connected images
  Map<String, String> connectedImages = {};

  // Map semantic labels to their positions
  Map<String, Offset> semanticLabelPositions = {
    'ant': Offset(120, 0),
    'cat': Offset(0, 0),
    'apple': Offset(0, 120),
    'chair': Offset(120, 120),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connect Images with Line'),
      ),
      body: Center(
        child: GestureDetector(
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
          onPanEnd: (_) {
            setState(() {
              if (start != null && end != null) {
                final nearestStartPosition = _findNearestImagePosition(start!);
                final nearestEndPosition = _findNearestImagePosition(end!);

                if (nearestStartPosition != null && nearestEndPosition != null) {
                  final startLabel = semanticLabels.firstWhere(
                        (label) =>
                    semanticLabelPositions[label] == nearestStartPosition,
                    orElse: () => '',
                  );
                  final endLabel = semanticLabels.firstWhere(
                        (label) =>
                    semanticLabelPositions[label] == nearestEndPosition,
                    orElse: () => '',
                  );

                  if (startLabel.isNotEmpty && endLabel.isNotEmpty) {
                    lines.add(Line(start!, end!, nearestStartPosition, nearestEndPosition));

                    // Store the connection between semantic labels
                    connectedImages[startLabel] = endLabel;
                    connectedImages[endLabel] = startLabel; // Reverse connection

                    // Call the check function to display connected images
                    check(startLabel, endLabel);
                  }
                }
              }

              start = null;
              end = null;
            });
          },
          child: CustomPaint(
            painter: LinePainter(imagePositions, lines),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < 2; i++)
                          Image.asset(
                            'assets/English/Phonics/${semanticLabels[i]}.jpg',
                            width: 100,
                            height: 100,
                            semanticLabel: semanticLabels[i],
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 2; i < 4; i++)
                          Image.asset(
                            'assets/English/Phonics/${semanticLabels[i]}.jpg',
                            width: 100,
                            height: 100,
                            semanticLabel: semanticLabels[i],
                          ),
                      ],
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Call the show function to display connected images
                    show();
                  },
                  child: Text('Show Connections'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  bool areImagesConnectedAndMatch(String image1Label, String image2Label) {
    if (connectedImages.containsKey(image1Label) && connectedImages.containsKey(image2Label)) {
      final connectedLabel1 = connectedImages[image1Label];
      final connectedLabel2 = connectedImages[image2Label];
      return connectedLabel1 == image2Label && connectedLabel2 == image1Label;
    }
    return false;
  }


  // Helper function to find the nearest image position to a given point
  Offset? _findNearestImagePosition(Offset point) {
    double minDistance = double.infinity;
    Offset? nearestPosition;

    semanticLabelPositions.forEach((label, position) {
      final distance = (point - position).distance;
      if (distance < minDistance) {
        minDistance = distance;
        nearestPosition = position;
      }
    });

    return nearestPosition;
  }

  void check(String image1Label, String image2Label) {
    if (areImagesConnectedAndMatch(image1Label, image2Label)) {
      print('$image1Label is connected to and matches $image2Label');
    } else {
      print('$image1Label is connected to $image2Label, but they do not match.');
    }
  }

  void show() {
    connectedImages.forEach((startLabel, endLabel) {
      if (startLabel == endLabel) {
        print('$startLabel is connected to and matches $endLabel');
      }
    });
  }
  }

  class LinePainter extends CustomPainter {
    final List<Offset> imagePositions;
    final List<Line> lines;

    LinePainter(this.imagePositions, this.lines);

    @override
    void paint(Canvas canvas, Size size) {
      final Paint paint = Paint()
        ..color = Colors.blue
        ..strokeCap = StrokeCap.round
        ..strokeWidth = 5.0;

      for (final line in lines) {
        canvas.drawLine(line.startPosition, line.endPosition, paint);
      }
    }

    @override
    bool shouldRepaint(CustomPainter oldDelegate) {
      return true;
    }
  }

  class Line {
    final Offset startPosition;
    final Offset endPosition;
    final Offset startImagePosition;
    final Offset endImagePosition;

    Line(this.startPosition, this.endPosition, this.startImagePosition, this.endImagePosition);
  }