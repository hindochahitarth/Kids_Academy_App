import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Maths/Opearators/op1.dart';
import 'package:finalprjct1/Maths/Subtraction/sub1.dart';
import 'package:finalprjct1/Maths/maths.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home.dart';
import 'Addition/additon1.dart';

class MathsCategory extends StatefulWidget{
  @override
  State<MathsCategory> createState() => _MathsCategoryState();
}

class _MathsCategoryState extends State<MathsCategory> {

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
      Audio('assets/English/bg.mp3'),
      //autoStart: true,
      showNotification: true,

    );
    setState(() {
      isPlaying = true;
    });
    void dispose() {
      assetsAudioPlayer.stop();
      super.dispose();
    }}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: Stack( fit: StackFit.expand,

          children: [

            Image(image: AssetImage('assets/Maths/mathsc.jpg',),fit: BoxFit.fill,
            ),
            Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){

              assetsAudioPlayer.stop();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Maths()));
            },
              icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
              label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
              style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
              ),
            ),),

            Positioned(
              top: 135,
              left: 345,width: 175,




              child: OutlinedButton(
                onPressed: () {

                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Addition1()));


                },

                child: Row(
                  children: [
                    Text('Addition       ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
              top: 190,
              left: 345,width: 175,




              child: OutlinedButton(
                onPressed: () {

                  assetsAudioPlayer.stop();
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Sub1()));


                },

                child: Row(
                  children: [
                    Text('Subtraction ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
              top: 245,
              left: 345,width: 175,




              child: OutlinedButton(
                onPressed: () {

                  assetsAudioPlayer.stop();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Opt1()));


                },

                child: Row(
                  children: [
                    Text('Operators    ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
        ),//backgroundColor: Colors.orangeAccent),
      ),debugShowCheckedModeBanner: false,
    );

  }
}