import 'package:bmi_calculator/components/CardComponent.dart';
import 'package:flutter/material.dart';

import '../arguments/ScreenArguments.dart';
import '../components/BotomButton.dart';
import '../constants/Constants.dart';

class Result_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: KNextPageTitleFont,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReuseableCard(
              color: passingColorValue,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    args.Prediction.toUpperCase(),
                    style: KWaitPrediction,
                  ),
                  Text(
                    args.bmiResult,
                    style: KActualBMI,
                  ),
                  Text(
                    args.Suggestion,
                    textAlign: TextAlign.center,
                    style: KSuggestion,
                  ),
                ],
              ),
            ),
          ),
          BotomButton(
              calculateString: 'Re-CALCULATE BMI',
              tapFunction: () {
                Navigator.pushNamed(context, '/inputpage');
              }),
        ],
      ),
    );
  }
}
