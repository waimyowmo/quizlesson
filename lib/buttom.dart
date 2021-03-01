import 'package:flutter/material.dart';

class Buttom extends StatelessWidget {
  final Color mycolor;
  final Text mytext;
  final Function marks;
  Buttom({this.mycolor, this.mytext, this.marks});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: mycolor,
      onPressed: marks,
      child: mytext,
    );
  }
}
