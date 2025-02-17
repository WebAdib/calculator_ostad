// This is CalculatorButton.dart page

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
    double screenWidth1 = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(8),
        height: screenWidth1 * 0.17,
        width: screenWidth1 * 0.17,
        decoration: BoxDecoration(
          color: btnColor ?? Colors.grey[800],
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            btnText,
            style:
                TextStyle(fontSize: screenWidth1 * 0.08, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
