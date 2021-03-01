import 'package:flutter/material.dart';
import 'package:quizstime/buttom.dart';
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
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff1F1D28),
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

  void mark(bool scoretype) {
    bool myans = qdata.answer(questionnum);
    setState(() {
      if (myans == scoretype) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    qdata.question(questionnum),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Buttom(
                mycolor: Colors.green,
                mytext: Text('မှန်'),
                marks: () {
                  mark(true);
                },
              ),
            ),
          ),
          Expanded(
            child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Buttom(
                  mycolor: Color(0xffCF4834),
                  mytext: Text('မှား'),
                  marks: () {
                    mark(false);
                  },
                )),
          ),
          Row(
            children: score,
          )
        ],
      ),
    );
  }
}
