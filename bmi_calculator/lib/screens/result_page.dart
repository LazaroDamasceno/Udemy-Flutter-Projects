import 'package:bmi_calculator/components/card_container.dart';
import 'package:bmi_calculator/components/transfer_button.dart';
import 'package:flutter/material.dart';

import '../components/constants.dart';

class ResultPage extends StatelessWidget {
  final String _bmiText;
  final String _resultText;
  final String _interpretationText;

  const new({
    super.key,
    required this._bmiText,
    required this._resultText,
    required this._interpretationText
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'RESULT',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                  'Your Result',
                  style: kTitleTextStyle
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: CardContainer(
                currentColor: kActivateColor,
                card: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      _resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      _bmiText,
                      style: kBmiTextStyle,
                    ),
                    Text(
                      _interpretationText,
                      style: kBodyTextStyle,
                    ),
                  ],
                ),
            ),
          ),
          TransferButton(
              label: 'RE-CALCULATE BMI',
              onPressed: () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}