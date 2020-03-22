import 'package:bmi_calculator/components/Reuseble_Card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/components/Bottom_Button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.bmi_result,@required this.result_Text});
  final String bmi_result;
  final String result_Text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'Your Result',
                  style: KtitleTextStyle,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCode(
              colour: KactiveCard,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    result_Text,
                    style: KResultTextStyle,
                  ),
                  Text(
                    bmi_result,
                    style: KBMITextStyle,
                  ),
                  Text(
                    'Your BMI Result is Quite low!',
                    style: KbodyTextStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
            Button_tittle: 'RE-CALCULATE',
            ontap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
