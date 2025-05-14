import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/apple.dart';
import 'package:finalprjct1/brush.dart';
import 'package:finalprjct1/cover.dart';
import 'package:finalprjct1/home.dart';
import 'package:finalprjct1/potato.dart';
import 'package:finalprjct1/seasons.dart';
import 'package:finalprjct1/vc.dart';
import 'package:finalprjct1/zebra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Transportcategory.dart';
import 'bluecolor.dart';

class GeneralAwar extends StatefulWidget{
  @override
  State<GeneralAwar> createState() => _GeneralAwarState();
}

class _GeneralAwarState extends State<GeneralAwar> {
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
      autoStart: true,
      showNotification: true,
      volume: 0.5,

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
        Image(image: AssetImage('assets/General Awarness/Good Manners/ga.png'),fit: BoxFit.cover,width:MediaQuery.of(context).size.width*0.5),
       // VolumeControl(audioPlayer: assetsAudioPlayer),
        Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
          assetsAudioPlayer.stop();
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
        },
          icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
          label: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          style:ElevatedButton.styleFrom(
            backgroundColor: Colors.black
          ),
        ),),

    Positioned(
    top: 115,
    left: 215,width: 169,




    child: OutlinedButton(
              onPressed: () {
                assetsAudioPlayer.stop();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Apple()));


              },

              child: Row(
                children: [
                  Container(child: Text('Fruits   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
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
          top: 165,
          left: 215,width: 169,




          child: OutlinedButton(
            onPressed: () {
              assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Potato()));


            },

            child: Row(
              children: [
                Container(child: Text('Vegetables',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
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
          top: 215,
          left: 215,width: 169,




          child: OutlinedButton(
            onPressed: () {
    assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Transport()));


            },

            child: Row(
              children: [
                Container(child: Text('Transport ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
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
          top: 115,
          left: 445,width: 169,




          child: OutlinedButton(

            onPressed: () {
    assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Zebra()));


            },

            child: Row(

              children: [

                Container(child: Text('Safety Rules',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 90), // <-- Text
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
          top: 165,
          left: 445,width: 169,




          child: OutlinedButton(
            onPressed: () {
    assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CoverMouth()));


            },

            child: Row(
              children: [
                Container(child: Text('Good Manners',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 90), // <-- Text
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
          top: 215,
          left: 445,width: 169,




          child: OutlinedButton(
            onPressed: () {
    assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Brush()));


            },

            child: Row(
              children: [
                Container(child: Text('Healthy Habbits',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 90), // <-- Text
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


      ],
        ),
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
    ),);
  }
}