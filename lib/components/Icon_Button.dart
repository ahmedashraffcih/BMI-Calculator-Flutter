import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onpressed});

  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onpressed,
      shape: CircleBorder(),
      elevation: 0.0,
      fillColor: Color(0xff4c4f5e),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}
