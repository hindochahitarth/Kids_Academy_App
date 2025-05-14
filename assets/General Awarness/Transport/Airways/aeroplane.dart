import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:finalprjct1/Transportcategory.dart';
import 'package:finalprjct1/rickshaw.dart';
import 'package:finalprjct1/roadways.dart';
import 'package:finalprjct1/ship.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Aeroplane extends StatefulWidget {
  @override
  State<Aeroplane> createState() => _AeroplaneState();
}

class _AeroplaneState extends State<Aeroplane> {
  @override


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

      Audio('assets/General Awarness/Transport/Airways/aeroplane.mp3'),   autoStart: true,
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

          Image(image: AssetImage('assets/General Awarness/Colors/colorsbg.jpg'), fit: BoxFit.cover,
          ),Positioned(top: 5,left: 5,child: ElevatedButton.icon(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Transport()));
          },
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.brown),
            label: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.grey
            ),
          ),),

          Positioned(top: 35,left: 190,
            child: Image(
              image: AssetImage('assets/General Awarness/Transport/Airways/aeroplane.png'),
              height: 290,
              width: 450,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('AEROPLANE',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold,letterSpacing: 3,),),
            style: TextButton.styleFrom(elevation: 20,
                shadowColor: Colors.brown,
                backgroundColor: Colors.blue,
                shape: StadiumBorder()),), width: 150, top: 330, left: 350,),




        ],


      ),
    );
  }}



