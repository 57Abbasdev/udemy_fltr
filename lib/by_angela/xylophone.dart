import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class Xylophone extends StatelessWidget {
  Xylophone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.red)),
            onPressed: () {
              playAudio(1);
            },
            child: Text(""),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.redAccent)),
            onPressed: () {
              playAudio(2);
            },
            child: Text(""),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.teal)),
            onPressed: () {
              playAudio(3);
            },
            child: Text(""),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.grey)),
            onPressed: () {
              playAudio(4);
            },
            child: Text(""),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.green)),
            onPressed: () {
              playAudio(5);
            },
            child: Text(""),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.amber)),
            onPressed: () {
              playAudio(6);
            },
            child: Text(""),
          ),
          TextButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.amberAccent)),
            onPressed: () {
              playAudio(7);
            },
            child: Text(""),
          ),


        ],
      ),
    );
  }

  playAudio(int n) {
    print('pressed$n');
    final player = AudioPlayer();
    var audio = "music/sound/assets_note$n.wav";
    player.play(AssetSource(audio), volume: 80);
  }
}
