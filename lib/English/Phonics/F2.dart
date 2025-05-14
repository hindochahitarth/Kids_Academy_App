import 'package:assets_audio_player/assets_audio_player.dart';

import '../alphacategory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'E1.dart';
import 'F1.dart';
import 'F3.dart';
import 'G1.dart';




class F2 extends StatefulWidget{

  @override
  State<F2> createState() => _F2State();
}

class _F2State extends State<F2> {
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

      Audio('assets/English/Phonics/ffox.mp3'),    autoStart: true,
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
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>AlphaCategory()));
          },
            
            icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
            
            style:ElevatedButton.styleFrom(
                backgroundColor: Colors.black)),),

          Positioned(
           top: 35,left: 330,
            child: Image(
              image: AssetImage('assets/English/Phonics/fox.png'),
              height: 290,
              width: 350,
              fit: BoxFit.fill,

            ),
          ),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('F',style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            // style: TextButton.styleFrom(elevation: 20,
            //     shadowColor: Colors.brown,
            //     backgroundColor: Colors.blue,
            //     shape: StadiumBorder()),
    ), width: 200, top: 80, left: 80,),

          Positioned(top: 180,left: 740,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>F3()));
          },
            icon: Icon(Icons.arrow_circle_right_outlined,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
          Positioned(top: 180,left: 30,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>F1()));
          },
            icon: Icon(Icons.arrow_circle_left_outlined,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),


          Positioned(top: 345,left: 770,child: TextButton.icon(onPressed: (){
            assetsAudioPlayer.stop();
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>G1()));
          },
            icon: Icon(Icons.arrow_forward,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
           Positioned(top: 345,left: 15,child: TextButton.icon(onPressed: (){
                assetsAudioPlayer.stop();
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>E1()));
          },
            icon: Icon(Icons.arrow_back,size:50.0,color: Colors.blue),
            label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            style:TextButton.styleFrom(


            ),
          ),),
          Positioned(child: TextButton(onPressed: () {
            //playAudioFromUrl('assets/moo.mp3');
            playMusic();
          },
            child: Text('F for Fox',style: TextStyle(color: Colors.blue,fontSize: 40,fontWeight: FontWeight.bold,letterSpacing: 2,),),
            // style: TextButton.styleFrom(elevation: 20,
            //     shadowColor: Colors.brown,
            //     backgroundColor: Colors.blue,
            //     shape: StadiumBorder()),
          ),  top: 310, left: 440,),



        ],


      ),
    );
  }}

