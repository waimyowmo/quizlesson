import 'package:flutter/material.dart';
import 'qdata.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Quiz(),
      ),
    );
  }
}

Qdata qdata = new Qdata();

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> score = [];

  void mark(bool scortype) {
    if (qdata.answer(questionnum) == scortype) {
      score.add(
        Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      score.add(
        Icon(
          Icons.close,
          color: Colors.red,
        ),
      );
    }
    setState(
      () {
        qdata.next();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Text(
                  qdata.question(questionnum),
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: FlatButton(
                color: Colors.green,
                onPressed: () {
                  mark(true);
                },
                child: Text('မှန်'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  mark(false);
                },
                child: Text('မှား'),
              ),
            ),
          ),
          Row(
            children: score,
          )
        ],
      ),
    );
  }
}
