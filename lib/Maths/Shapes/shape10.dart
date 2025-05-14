import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finalprjct1/Maths/Shapes/cylinder.dart';
import 'package:finalprjct1/Maths/Shapes/shape1.dart';
import 'package:finalprjct1/Maths/Shapes/shape3.dart';
import 'package:finalprjct1/Maths/Shapes/shape4.dart';
import 'package:finalprjct1/Maths/Shapes/shape5.dart';
import 'package:finalprjct1/Maths/Shapes/shape6.dart';
import 'package:finalprjct1/Maths/Shapes/shape7.dart';
import 'package:finalprjct1/Maths/Shapes/shape8.dart';
import 'package:finalprjct1/Maths/Shapes/shape9.dart';
import 'package:finalprjct1/Maths/maths.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/watermelon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Cube extends StatefulWidget{

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> {
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
      Audio('assets/Maths/Shapes/cube.mp3'),
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Maths()));
          },
            
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

          Positioned(
           top: 35,left: 185,
            child: InkWell(
              onTap: (){
                playMusic();
              },
              child: Image(
                image: AssetImage('assets/Maths/Shapes/cube.jpg'),
                height: 350,
                width: 480,
                fit: BoxFit.fill,

              ),
            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('CUBE',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold,letterSpacing: 3,),),
            style: TextButton.styleFrom(elevation: 20,
                shadowColor: Colors.brown,
                backgroundColor: Colors.blue,
                shape: StadiumBorder()),), width: 190, top: 330, left: 325,),

          Positioned(top: 185,left: 770,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Cylinder()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
           Positioned(top: 185,left: 15,child: TextButton.icon(onPressed: (){
                assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Heart()));
          },
            icon: Icon(Icons.arrow_back,size:50.0,color: Colors.blue,),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            style:TextButton.styleFrom(


            ),
          ),),



        ],


      ),
    );
  }}

