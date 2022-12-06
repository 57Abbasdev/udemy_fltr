import 'dart:math';
import 'package:flutter/material.dart';

class DiceRoll extends StatefulWidget {
  const DiceRoll({Key? key}) : super(key: key);

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int dice = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.red,
      

      home: Scaffold(
        appBar: AppBar(
          title: Text('Dice Roll'),
        ),
        backgroundColor: Colors.red,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    // random.nextInt(6) generate random between 0 & 5
                    // but we add 1 So, it will convert 1 & 6

                    dice = Random().nextInt(6) + 1;
                  });
                },
                child:
                    Image(image: AssetImage('assets/images/dice/dice$dice.png')),
              ),
              Image(
                  height: 100, image: AssetImage("assets/images/dice/dice1.png")),
            ],
          ),
        ),
      ),
    );
  }
}
