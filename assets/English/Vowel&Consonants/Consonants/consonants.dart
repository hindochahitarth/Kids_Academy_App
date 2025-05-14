import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../vococategory.dart';

class Consonants extends StatefulWidget
{
  @override
  State<Consonants> createState() => _ConsonantsState();
}

class _ConsonantsState extends State<Consonants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,

          children: [
      Image(image: AssetImage('assets/General Awarness/Good Manners/ga.png'),fit: BoxFit.cover,),
    Positioned(top: 35,left: 35,child: ElevatedButton.icon(onPressed: (){
    //assetsAudioPlayer.stop();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>VocoCategory()));
    },
    icon: Icon(Icons.arrow_back,size:20.0,color: Colors.white),
    label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
    style:ElevatedButton.styleFrom(
    backgroundColor: Colors.black
    ),
    ),),

            Positioned(
                child: TextButton.icon(
                    onPressed: (){},
                    icon:Icon(Icons.arrow_back),
                    label: Text(''))),
            Positioned(
              child: TextButton(onPressed: (){},
                child: Text('C',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.blue),),),
              top: 5,left: 5,),

          ],), );
   }
}