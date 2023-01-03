import 'package:flutter/material.dart';
import 'package:udemy_fltr/age_calculator/age_main.dart';
import 'package:udemy_fltr/by_angela/ball_ques.dart';
import 'package:udemy_fltr/by_angela/dice_rolling.dart';
import 'package:udemy_fltr/by_angela/mi_card.dart';
import 'package:udemy_fltr/by_angela/xylophone.dart';

import 'by_angela/quiz/quiz.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: Quiz(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
        children: [
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MiCard())),
            child: const Image(
                height: 100, image: AssetImage("assets/images/abbas.jpg")),
          ),
          Wrap(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AgeMain()));
                },
                child: const Text("Age Calculator"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const BallQ()));
                },
                child: const Text("Ball Q"),
              ),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DiceRoll()));
                  },
                  child: Text("Dice Roll")),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Xylophone()));
                  },
                  child: Text('Audio')),
              OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Quiz()));
                  },
                  child: Text('Quiz')),
            ],
          )
        ],
      ),
    );
  }
}
