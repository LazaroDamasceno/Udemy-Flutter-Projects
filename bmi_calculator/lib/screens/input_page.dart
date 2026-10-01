import 'package:bmi_calculator/components/calculator_brain.dart';
import 'package:bmi_calculator/components/constants.dart';
import 'package:bmi_calculator/components/enums.dart';
import 'package:bmi_calculator/components/faticon_card.dart';
import 'package:bmi_calculator/components/increase_decrease_card.dart';
import 'package:bmi_calculator/components/transfer_button.dart';
import 'package:bmi_calculator/components/slider_content.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/card_container.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color _currentMaleColor = kInactivateColor;
  Color _currentFemaleColor = kInactivateColor;

  void onColorChange(Gender gender) {
    setState(() {
      if (gender.name == 'male') {
        _currentMaleColor = kActivateColor;
        _currentFemaleColor = kInactivateColor;
      }
      if (gender.name == 'female') {
        _currentFemaleColor = kActivateColor;
        _currentMaleColor = kInactivateColor;
      }
    });
  }

  final int _weight = 60;
  final int _age = 18;
  final int _height = 180;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView( 
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: CardContainer(
                    currentColor: _currentMaleColor,
                    card: FaIconContent(
                      icon: FontAwesomeIcons.mars,
                      label: Gender.male.name,
                    ),
                    callBack: () {
                      onColorChange(Gender.male);
                    },
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    currentColor: _currentFemaleColor,
                    card: FaIconContent(
                      icon: FontAwesomeIcons.venus,
                      label: Gender.female.name,
                    ),
                    callBack: () {
                      onColorChange(Gender.female);
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CardContainer(
                    currentColor: kInactivateColor,
                    card: SliderContent(
                      initialValue: _height,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CardContainer(
                    currentColor: kInactivateColor,
                    card: RoundedIconCard(
                      initialValue: _weight,
                      label: 'WEIGHT',
                      specifier: 'kg',
                    ),
                  ),
                ),
                Expanded(
                  child: CardContainer(
                    currentColor: kInactivateColor,
                    card: RoundedIconCard(
                      initialValue: _age,
                      label: 'AGE',
                      specifier: 'year(s)',
                    ),
                  ),
                ),
              ],
            ),
            TransferButton(
              label: 'RESULT',
              onPressed: () {
                CalculatorBrain calc = CalculatorBrain(
                    height: _height,
                    weight: _weight
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                    ResultPage(
                        bmiText: calc.calculateBMI(),
                        resultText: calc.getResult(),
                        interpretationText: calc.getInterpretation()
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
