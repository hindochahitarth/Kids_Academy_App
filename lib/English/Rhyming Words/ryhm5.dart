import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym1.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym2.dart';
import 'package:finalprjct1/English/Rhyming%20Words/rhym3.dart';
import 'package:finalprjct1/English/Rhyming%20Words/ryhm4.dart';
import 'package:finalprjct1/English/Rhyming%20Words/ryhm6.dart';

import '../english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Rhym5 extends StatefulWidget{

  @override
  State <Rhym5> createState() => _Rhym5State();
}

class _Rhym5State extends State<Rhym5> {
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
              image: AssetImage('assets/English/Rhyming word/11zon_resized/glad_10_11zon.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(top: 75,left: 460,
            child: Image(
              image: AssetImage('assets/English/Rhyming word/11zon_resized/sad_21_11zon.jpg'),
              height: 230,
              width: 300,
              fit: BoxFit.fill,

            ),
          ),

          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('GLAD',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            // style: TextButton.styleFrom(elevation: 20,
            //     shadowColor: Colors.brown,
            //     backgroundColor: Colors.blue,
            //shape: StadiumBorder()
          ), width: 150, top: 330, left: 135,),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('SAD',style: TextStyle(color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            //         style: TextButton.styleFrom(elevation: 20,
            //             shadowColor: Colors.brown,
            //             backgroundColor: Colors.blue,
            //           //  shape: StadiumBorder()
            // ),
          ), width: 150, top: 330, left: 535,),

          Positioned(top: 330,left: 770,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Rhym6()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.teal),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
          Positioned(top: 325,left: 0,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Rhym4()));
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

