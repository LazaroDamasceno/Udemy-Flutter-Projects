import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  final Color _currentColor;
  final Widget _card;
  final VoidCallback? _callBack;

  const CardContainer({
    super.key,
    required this._currentColor,
    required this._card,
    this._callBack,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _callBack,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        height: 200.0,
        width: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: _currentColor,
        ),
        child: _card,
      ),
    );
  }
}
