import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';

class RoundedIconCard extends StatefulWidget {
  final int _initialValue;
  final String _label;
  final String _specifier;

  const RoundedIconCard({
    super.key,
    required this._initialValue,
    required this._label,
    required this._specifier,
  });

  @override
  State<RoundedIconCard> createState() => _RoundedIconCardState();
}

class _RoundedIconCardState extends State<RoundedIconCard> {
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
      crossAxisAlignment: CrossAxisAlignment.center, 
      children: [
        Text(
          widget._label,
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        const SizedBox(height: 10.0), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(_numericValue.toString(), style: kNumberTextStyle),
            const SizedBox(width: 10.0),
            Text(widget._specifier, style: kLabelTextStyle),
          ],
        ),
        const SizedBox(height: 15.0), 
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.filled(
              onPressed: () {
                setState(() {
                  if (_numericValue > 0) {
                    _numericValue++;
                  }
                });
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF4C4F5E),
                foregroundColor: Colors.white,
                minimumSize: const Size(56.0, 56.0),
                fixedSize: const Size(56.0, 56.0),
                shape: const CircleBorder(),
              ),
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 15.0),    
            IconButton.filled(
              onPressed: () {
                setState(() {
                  if (_numericValue > 0) {
                    _numericValue--; 
                  }
                });
              },
              style: IconButton.styleFrom(
                backgroundColor: const Color(0xFF4C4F5E),
                foregroundColor: Colors.white,
                minimumSize: const Size(56.0, 56.0),
                fixedSize: const Size(56.0, 56.0),
                shape: const CircleBorder(),
              ),
              icon: const Icon(Icons.remove),
            )
          ],
        ),
      ],
    );
  }
}
