import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:udemy_fltr/by_angela/quiz/quizbrain.dart';

QuizBrain quizBrain = QuizBrain();

class Quiz extends StatelessWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeeper = [];
  int rightAns=0 , wrongAns=0;

  checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getAnswer();

    setState(() {
      if (userAnswer == correctAnswer) {
        rightAns ++;
        scoreKeeper.add(const Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        wrongAns++;
        scoreKeeper.add(const Icon(
          Icons.close,
          color: Colors.red,
        ));
      }


      if (quizBrain.isFinished() == true) {
        //show an alert using rFlutter_alert at the end,

        Alert(
          content: Column(
            children: [
              Text('Result'),
              Card(

                  child: Row(
                    children: [

                      SizedBox(height: 5,),
                      Text('$rightAns/'),
                      Text('${rightAns+wrongAns}'),
                    ],
                  )),
            ],
          ),
          context: context,
          title: 'Finished!',
          //desc: 'You\'ve reached the end of the quiz.',
        ).show();
        quizBrain.reset();

        // empty out the scoreKeeper.
        scoreKeeper = [];
        rightAns=0;
        wrongAns=0;
      } else {
        quizBrain.nextQuestion();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              textColor: Colors.white,
              color: Colors.green,
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () => checkAnswer(true),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              color: Colors.red,
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () => checkAnswer(false),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
