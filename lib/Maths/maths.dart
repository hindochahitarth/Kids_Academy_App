import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Numbers/2.dart';
import 'package:finalprjct1/Maths/Numbers/one.dart';
import 'package:finalprjct1/Maths/Shapes/shape1.dart';
import 'package:finalprjct1/Maths/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'Numbers/numbers.dart';
import 'mathscategory.dart';


class Maths extends StatefulWidget{
  @override
  State<Maths> createState() => _MathsState();
}

class _MathsState extends State<Maths> {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPlaying = false;


  @override
  void initState() {
    super.initState();
    playMusic();
    print('called');
  }

  Future<void> playMusic() async {
    await assetsAudioPlayer.open(
      Audio('assets/General Awarness/Good Manners/child.mp3'),
      //autoStart: true,
      showNotification: true,

    );
    setState(() {
      isPlaying = true;
    });
    void dispose() {
      assetsAudioPlayer.stop();
      super.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: Stack(
          fit: StackFit.expand,

          children: [
            Image(image: AssetImage('assets/General Awarness/Good Manners/ga.png'),fit: BoxFit.cover,),
            Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
              assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
            ),),

            Positioned(
              top: 115,
              left: 345,width: 169,




              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>One()));


                },

                child: Row(
                  children: [
                    Container(child: Text('Numbers   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,letterSpacing: 1),),width: 100), // <-- Text
                    // SizedBox(
                    //   width: 0,
                    //   height: 10,
                    // ),
                    Icon( // <-- Icon
                      Icons.arrow_circle_right_outlined,
                      size: 35.0,


                      color: Colors.white,
                    ),

          ],
        ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent
                ),
      ),



    ),
            Positioned(
              top: 185,
              left: 345,width: 169,




              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MathsCategory()));


                },

                child: Row(
                  children: [
                    Container(child: Text('Addition/Subtraction   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
                    // SizedBox(
                    //   width: 0,
                    //   height: 10,
                    // ),
                    Icon( // <-- Icon
                      Icons.arrow_circle_right_outlined,
                      size: 35.0,


                      color: Colors.white,
                    ),

                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent
                ),

              ),
            ),Positioned(
              top: 255,
              left: 345,width: 169,




              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Circle()));


                },

                child: Row(
                  children: [
                    Container(child: Text('Shapes   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white,letterSpacing: 1),),width: 100), // <-- Text
                    // SizedBox(
                    //   width: 0,
                    //   height: 10,
                    // ),
                    Icon( // <-- Icon
                      Icons.arrow_circle_right_outlined,
                      size: 35.0,


                      color: Colors.white,
                    ),

                  ],
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent
                ),

              ),
            ),


          ],),),);
    //      child:OutlinedButton(onPressed: (){
    //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GeneralAwar()));
    //
    //       },
    //
    //         child: Padding(
    //
    //         padding: const EdgeInsets.all(5.0),
    //         child: Text('Seasons ',style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold,inherit: true),),
    //
    //       ),
    //
    //         style: OutlinedButton.styleFrom(
    //             backgroundColor: Colors.brown,
    //             primary: Colors.tealAccent,
    //             elevation: 30,
    //
    //             // side: BorderSide(
    //             //     color: Colors.tealAccent,
    //             //     width: 4
    //             // )
    //
    //         ),
    //
    //
    //
    //
    //
    //
    //
    //
    //       ),
    //
    //     ),
    //     // Button on the left
    //   ],),),
    //),);
  }
}