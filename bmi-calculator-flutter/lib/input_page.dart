import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'arguments/ScreenArguments.dart';
import 'components/BotomButton.dart';
import 'components/CardComponent.dart';
import 'components/IconContent.dart';
import 'components/RoundedButtonCustomComponent.dart';
import 'constants/Constants.dart';
import 'screen2/Calculation.dart';

var selectedGender;

enum Gender { Male, Female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = passingColorValue;
  Color femaleCardColor = passingColorValue;
  int height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Male;
                    });
                  },
                  color: selectedGender == Gender.Male
                      ? pressedColorValue
                      : passingColorValue,
                  cardChild: GenderIcons(
                    fontawesomeIcon: Icon(
                      FontAwesomeIcons.mars,
                      size: 110.0,
                    ),
                    gender: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.Female;
                    });
                  },
                  color: selectedGender == Gender.Female
                      ? pressedColorValue
                      : passingColorValue,
                  cardChild: GenderIcons(
                    fontawesomeIcon: Icon(
                      FontAwesomeIcons.venus,
                      size: 110.0,
                    ),
                    gender: 'FEMALE',
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReuseableCard(
              color: passingColorValue,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: KtextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: KsliderFont,
                      ),
                      Text(
                        'cm',
                        style: KtextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    // Inherits the default theme that we have
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        overlayColor: Color(0x29EB1555),
                        inactiveTrackColor: Color(0xFF8D8E98),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                        thumbColor: Color(0xFFEB1555)),

                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReuseableCard(
                  color: passingColorValue,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: KtextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: KsliderFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReuseableCard(
                  color: passingColorValue,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'AGE',
                        style: KtextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: KsliderFont,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
          BotomButton(
            calculateString: 'CALCULATE BMI',
            tapFunction: () {
              Calculation calculation =
                  Calculation(height: height, weight: weight);

              Navigator.pushNamed(
                context,
                '/result',
                arguments: ScreenArguments(
                    bmiResult: calculation.calculateBMI(),
                    Prediction: calculation.Prediction(),
                    Suggestion: calculation.Suggestion()),
              );
            },
          ),
        ],
      ),
    );
  }
}
