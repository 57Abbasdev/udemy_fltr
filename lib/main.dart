import 'package:flutter/material.dart';
import 'package:udemy_fltr/age_calculator/age_main.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.amber,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
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
          const Image(height: 100,
              image: AssetImage("assets/images/oktem.jpg")),
          Image.asset("assets/images/oktem.jpg"),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AgeMain()));
                },
                child: Text("Age Calculator"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AgeMain()));
                },
                child: Text(""),
              ),
            ],
          )
        ],
      ),
    );
  }
}
