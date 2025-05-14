import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym1.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym2.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym3.dart';
import 'package:finalprjct1/English/Rhyming%20Words/ryhm4.dart';
import 'package:finalprjct1/English/Rhyming%20Words/ryhm5.dart';
import 'package:finalprjct1/English/Rhyming%20Words/ryhm6.dart';
import 'package:finalprjct1/English/Rhyming%20Words/ryhm7.dart';
import 'package:finalprjct1/English/english.dart';

import '../english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Rhym9 extends StatefulWidget{

  @override
  State <Rhym9> createState() => _Rhym9State();
}

class _Rhym9State extends State<Rhym9> {
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
      Audio('assets/English/Rhyming word/'),
      autoStart: true,
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
    return Scaffold(
      body:
      Stack(
        fit: StackFit.expand,
        children: [

          Image(image: AssetImage('assets/General Awarness/Seasons/seasbg.jpg'), fit: BoxFit.cover,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>English()));
          },
            
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

          Positioned(top: 75,left: 60,
            child: Image(
              image: AssetImage('assets/English/Rhyming word/11zon_resized/boat_1_11zon.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(top: 75,left: 460,
            child: Image(
              image: AssetImage('assets/English/Rhyming word/11zon_resized/goat_12_11zon.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('BOAT',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            // style: TextButton.styleFrom(elevation: 20,
            //     shadowColor: Colors.brown,
            //     backgroundColor: Colors.blue,
            //shape: StadiumBorder()
          ), width: 150, top: 330, left: 135,),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('GOAT',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            //         style: TextButton.styleFrom(elevation: 20,
            //             shadowColor: Colors.brown,
            //             backgroundColor: Colors.blue,
            //           //  shape: StadiumBorder()
            // ),
          ), width: 150, top: 330, left: 535,),

          Positioned(top: 325,left: 0,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Rhym7()));
          },
            icon: Icon(Icons.arrow_back,size:60.0,color: Colors.teal),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),



        ],


      ),
    );
  }}

