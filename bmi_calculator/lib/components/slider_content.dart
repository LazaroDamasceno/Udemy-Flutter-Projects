import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';

class SliderContent extends StatefulWidget {
final int _initialValue;

  const SliderContent({
    super.key, 
    required this._initialValue
  });

  @override
  State<SliderContent> createState() => _SliderContentState();
}

class _SliderContentState extends State<SliderContent> {
  
  late int _numericValue;

  @override
  void initState() {
    super.initState();
    _numericValue = widget._initialValue; 
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'HEIGHT',
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(height: 15.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  _numericValue.toString(),
                  style: kNumberTextStyle,
                ),
                const SizedBox(width: 10.0),
                Text(
                  'cm',
                  style: kLabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: const Color(0XFF8D8E98),
                activeTrackColor: Colors.white,
                thumbColor: const Color(0xFFEB1555),
                overlayColor: const Color(0x29EB1555),
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
              ),
              child: Slider(
                value: _numericValue.toDouble(),
                min: kMinHeight,
                max: kMaxHeight,
                onChanged: (double newHeight) {
                  setState(() {
                    _numericValue = newHeight.round();
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
