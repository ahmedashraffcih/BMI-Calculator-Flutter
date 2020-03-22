import 'package:bmi_calculator/Screens/Results_Page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/Reuseble_Card.dart';
import '../components/Icon_Content.dart';
import '../components/Bottom_Button.dart';
import 'package:bmi_calculator/Constants.dart';
import 'package:bmi_calculator/Screens/Results_Page.dart';
import '../components/Icon_Button.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;

//  Color male_card_color = inactive_Card_Color;
//  Color female_card_color = inactive_Card_Color;
//
//  //1 male - 2 female
//  void updateColor(Gender selectedgender)
//  {
//    if(selectedgender == Gender.male)
//      {
//        if(male_card_color == inactive_Card_Color)
//          {
//            male_card_color = activeCard;
//            female_card_color = inactive_Card_Color;
//          }
//        else
//          {
//            male_card_color = inactive_Card_Color;
//          }
//      }
//    else if (selectedgender == Gender.female)
//      {
//        if(female_card_color == inactive_Card_Color)
//        {
//          female_card_color = activeCard;
//          male_card_color = inactive_Card_Color;
//        }
//        else
//        {
//          female_card_color = inactive_Card_Color;
//        }
//      }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Gender
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCode(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? KactiveCard
                          : Kinactive_Card_Color,
                      cardchild: IconReuse(
                        icon: FontAwesomeIcons.mars,
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCode(
                      onpress: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                      },
                      colour: selectedGender == Gender.female
                          ? KactiveCard
                          : Kinactive_Card_Color,
                      cardchild: IconReuse(
                        icon: FontAwesomeIcons.venus,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //Height
            Expanded(
              child: ReuseableCode(
                colour: KactiveCard,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: KlabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: KmainTextStyle,
                        ),
                        Text(
                          'cm',
                          style: KlabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12.0),
                        overlayColor: Color(0x29eb1555),
                        thumbColor: Color(0xffeb1555),
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: Color(0xff8d8e89),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //Width and age
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReuseableCode(
                      colour: KactiveCard,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'WEIGHT',
                            style: KlabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: KmainTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(
                                    () {
                                      weight++;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(
                                    () {
                                      weight--;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReuseableCode(
                      colour: KactiveCard,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: KlabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: KmainTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(
                                    () {
                                      age++;
                                    },
                                  );
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(
                                    () {
                                      age--;
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //GO BOX
            BottomButton(
              Button_tittle: 'CALCULATE',
              ontap: () {
                Calculator calc = Calculator (height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmi_result: calc.CalculateBMI(),
                        result_Text: calc.getResult()
                    ),
                  ),
                );
              },
            )
          ],
        ));
  }
}


