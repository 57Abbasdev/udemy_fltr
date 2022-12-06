import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class MiCard extends StatelessWidget {
  const MiCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.teal,
        child: Stack(
          children: [
            Lottie.network(

                "https://assets8.lottiefiles.com/packages/lf20_qsepfuxs.json"),
            Lottie.network(
                "https://assets7.lottiefiles.com/packages/lf20_2K9FkW0YWD.json"),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  foregroundImage: AssetImage("assets/images/abbas.jpg"),
                  radius: 110,
                ),
                AnimatedTextKit(
                  isRepeatingAnimation: true,
                  repeatForever: true,
                  animatedTexts: [
                    TypewriterAnimatedText("ABBAS BHATTI",
                        textStyle: GoogleFonts.rubikMicrobe(
                            fontSize: 38,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                        speed: const Duration(milliseconds: 200),
                        textAlign: TextAlign.center),
                  ],
                ),
                SizedBox(height: 30,),
                AnimatedTextKit(
                  repeatForever: true,
                  animatedTexts: [
                    FadeAnimatedText(
                      "FLUTTER",
                      textStyle: TextStyle(
                          wordSpacing: 2, fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: 150,
                  height: 1.7,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: ()=> call(),
                      child: Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              size: 32,
                              Icons.call,
                              color: Colors.teal,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "+92 304 4482107",
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    )),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: () => email(),
                      child: Container(
                        height: 60,
                        color: Colors.white,
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 30,
                            ),
                            Icon(
                              size: 32,
                              Icons.mail,
                              color: Colors.teal,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "abbasrehmat570@gmail.com",
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10,),


          ],
        ),
      )),
    );
  }

  call()  {
    const number = '+923044482107';
    launch('tel://$number');
  }

  email()  {
    var sub = "Ignore",
        body =
            'Sometimes don\'t noticing is an activity to control your mind and behavior';
    var mails = 'mailto:Abbasrehmat570@gmail.com?subject=$sub&body=$body%20';
    Uri mail =
        Uri.parse('mailto:Abbasrehmat570@gmail.com?subject=$sub&body=$body%20');
    //canLaunchUrl(mail);
    //launchUrl(mail);
    launch(mails);
  }
}
