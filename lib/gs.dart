import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Shapes/shape1.dart';
import 'package:finalprjct1/Maths/image.dart';
import 'package:finalprjct1/bluecolor.dart';
import 'package:finalprjct1/seasons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';


class Gs extends StatefulWidget{
  @override
  State<Gs> createState() => _GsState();
}

class _GsState extends State<Gs> {
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
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BlueColor()));


                },

                child: Row(
                  children: [
                    Container(child: Text('Colors   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
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
              left: 215,width: 169,




              child: OutlinedButton(
                onPressed: () {
                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WinterSeason()));


                },

                child: Row(
                  children: [
                    Container(child: Text('Season   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
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
            // ),Positioned(
            //   top: 255,
            //   left: 215,width: 169,
            //
            //
            //
            //
            //   child: OutlinedButton(
            //     onPressed: () {
            //       assetsAudioPlayer.stop();
            //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Circle()));
            //
            //
            //     },
            //
            //     child: Row(
            //       children: [
            //         Container(child: Text('Shapes   ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),width: 100), // <-- Text
            //         // SizedBox(
            //         //   width: 0,
            //         //   height: 10,
            //         // ),
            //         Icon( // <-- Icon
            //           Icons.arrow_circle_right_outlined,
            //           size: 35.0,
            //
            //
            //           color: Colors.white,
            //         ),
            //
            //       ],
            //     ),
            //     style: ElevatedButton.styleFrom(
            //         backgroundColor: Colors.indigoAccent
            //     ),
            //
            //   ),
            // ),


            ), ],),),);
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