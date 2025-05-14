import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/aeroplane.dart';
//import 'package:finalprjct1/road/roadways.dart';
import 'package:finalprjct1/roadways.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'boat.dart';
import 'home.dart';

class Transport extends StatefulWidget{
  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> {

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

        body: Stack(
          fit: StackFit.expand,

          children: [
            Image(image: AssetImage('assets/General Awarness/Transport/transport.jpg'),fit: BoxFit.fill,),

            Positioned(top: 25,left: 20,child: ElevatedButton.icon(onPressed: (){

              assetsAudioPlayer.stop();
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home()));
    },
    icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
    label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
    style:ElevatedButton.styleFrom(
    backgroundColor: Colors.black
    ),
    ),),
    Positioned(
    top: 115,
    left: 345,width: 161,




    child: OutlinedButton(
    onPressed: () {
      assetsAudioPlayer.stop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>RoadWays()));


    },

    child: Row(
    children: [
    Text('Roadways  ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
    top: 170,
    left: 345,width: 161,




    child: OutlinedButton(
    onPressed: () {

      assetsAudioPlayer.stop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Boat()));


    },

    child: Row(
    children: [
    Text('Waterways ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
    top: 225,
    left: 345,width: 161,




    child: OutlinedButton(
    onPressed: () {

      assetsAudioPlayer.stop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Aeroplane()));


    },

    child: Row(
    children: [
    Text('Airways      ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),), // <-- Text
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
    ),),
    );
    }
}