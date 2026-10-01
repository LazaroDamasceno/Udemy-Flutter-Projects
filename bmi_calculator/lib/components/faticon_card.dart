import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FaIconContent extends StatelessWidget {
  final FaIconData _icon;
  final String _label;

  const new({super.key, required this._icon, required this._label});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(_icon, size: 80.0, color: Colors.white),
        const SizedBox(height: 15.0),
        Text(
          _label,
          style: const TextStyle(fontSize: 18.0, color: Colors.white),
        ),
      ],
    );
  }
}
