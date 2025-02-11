import 'package:flutter/material.dart';

import 'Colors.dart';

class CalculatorButton extends StatelessWidget {
  String btnText;
  Color? btnColor;
  CalculatorButton({
    super.key,
    required this.btnText,
    this.btnColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65, // Set equal width and height
        height: 65,
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: btnColor ?? Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(500), // High radius for a circle
            ),
          ),
          child: Text(
            btnText,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
