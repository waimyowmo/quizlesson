import 'package:flutter/material.dart';
import 'qdata.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

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

  void next() {
    if (questionnum < (qdata.qlen() - 1)) {
      questionnum++;
    } else {
      questionnum = 0;
      score.clear();
      Alert(context: context, title: "Good Job!", desc: "Complete All Answer")
          .show();
    }
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
                  bool myans = qdata.answer(questionnum);
                  setState(() {
                    if (myans == true) {
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
                    next();
                  });
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
                  bool myans = qdata.answer(questionnum);
                  setState(() {
                    if (myans == false) {
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
                    next();
                  });
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

//   @override
//   Widget build(BuildContext context) {
//
