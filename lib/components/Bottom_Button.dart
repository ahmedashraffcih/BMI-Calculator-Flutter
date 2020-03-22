import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.ontap, @required this.Button_tittle});

  final Function ontap;
  final String Button_tittle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
            child: Text(
              Button_tittle,
              style: KlargeButtonTextStyle,
            )),
        color: KBottomContainer_C,
        margin: EdgeInsets.only(top: 10.0),
        //padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: KBottomContainer_h,
      ),
    );
  }
}