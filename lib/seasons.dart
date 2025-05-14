import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finalprjct1/generalawarness.dart';
import 'package:finalprjct1/springseason.dart';
import 'package:finalprjct1/summerseason.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class WinterSeason extends StatefulWidget{

	@override
	State<WinterSeason> createState() => _SeasonState();
}

class _SeasonState extends State<WinterSeason> {
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
			Audio('assets/winter.mp3'),
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
						),Positioned(top: 25,left: 20,child: ElevatedButton.icon(onPressed: (){
							Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GeneralAwar()));
						},
							icon: Icon(Icons.arrow_back,size:20.0,color: Colors.brown),
							label: Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.brown),),
							style:ElevatedButton.styleFrom(
									backgroundColor: Colors.grey
							),
						),),

						Positioned(top: 35,left: 190,
							child: Image(
									image: AssetImage('assets/General Awarness/Seasons/winter.jpg'),
									height: 290,
									width: 450,
									fit: BoxFit.fill,

							),
						),
						Positioned(child: ElevatedButton(onPressed: () {
							//playAudioFromUrl('assets/moo.mp3');
							playMusic();
						},
							child: Text('WINTER SEASON'),
							style: ElevatedButton.styleFrom(elevation: 20,
									shadowColor: Colors.brown,
									shape: StadiumBorder()),), width: 150, top: 330, left: 350,),

						Positioned(top: 335,left: 730,child: TextButton.icon(onPressed: (){
							Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SpringSeason()));
						},
							icon: Icon(Icons.arrow_right_alt,size:50.0,color: Colors.teal),
							label: Text('',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.teal),),
							style:TextButton.styleFrom(


							),
						),),

					],


			),
		);
	}}

