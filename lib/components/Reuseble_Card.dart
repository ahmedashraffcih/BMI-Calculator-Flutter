import 'package:flutter/material.dart';

class ReuseableCode extends StatelessWidget {

  ReuseableCode({@required this.colour, this.cardchild,this.onpress});

  final Color colour;
  final Widget cardchild;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        child: cardchild,
        margin: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
