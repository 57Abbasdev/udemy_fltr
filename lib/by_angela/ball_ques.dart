import 'package:flutter/material.dart';

class BallQ extends StatefulWidget {
  const BallQ({Key? key}) : super(key: key);

  @override
  State<BallQ> createState() => _BallQState();
}

class _BallQState extends State<BallQ> {
  var ball = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            ball++;
            if(ball>5){
              ball=1;
            }
          });

        },
        child: Image(image: AssetImage("assets/images/ball/ball$ball.png")));
  }
}
