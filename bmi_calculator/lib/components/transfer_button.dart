import 'package:flutter/material.dart';

import 'constants.dart';

class TransferButton extends StatelessWidget {
  final String _label;
  final VoidCallback _onPressed;

  const new({
    super.key,
    required this._label,
    required this._onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xFFEB1555),
        ),
        onPressed: _onPressed,
        child: Text(
          _label,
          style: kLargeButtonText,
        ),
      ),
    );
  }
}
