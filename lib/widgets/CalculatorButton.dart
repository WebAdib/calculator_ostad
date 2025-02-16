import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String btnText;
  final Color? btnColor;
  final VoidCallback onTap;

  const CalculatorButton({
    Key? key,
    required this.btnText,
    this.btnColor,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(8),
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: btnColor ?? Colors.grey[800],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            btnText,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
