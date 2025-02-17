// This is Calculator.dart page

import 'package:flutter/material.dart';
import 'Functions.dart';
import 'widgets/Colors.dart';
import 'widgets/CalculatorButton.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  String _input = "";
  String _operand = "";
  double _currentNumber = 0.0;
  double _previousNumber = 0.0;
  bool _showCalculatorText = true; // Add this variable

  void updateState(String input, String output, String operand,
      double previousNumber, double currentNumber) {
    setState(() {
      _input = input;
      _output = output;
      _operand = operand;
      _previousNumber = previousNumber;
      _currentNumber = currentNumber;
      _showCalculatorText = input.isEmpty; // Hide text if input is not empty
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.myDarkGray,
      body: Column(
        children: [
          SizedBox(height: screenWidth * 0.05),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  AnimatedOpacity(
                    opacity: _showCalculatorText ? 1.0 : 0.0, // Animate opacity
                    duration: Duration(milliseconds: 180), // Animation speed
                    child: Row(
                      children: [
                        Text(
                          "Calculator",
                          style: TextStyle(
                              fontSize: screenWidth * 0.15,
                              color: AppColors.myGray),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _input.isEmpty ? "0" : _input, // Show input numbers
                        style: TextStyle(
                            fontSize: screenWidth * 0.15, color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        _output,
                        style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            color: AppColors.myGray),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildButtonRow(["A", "C", "%", "÷"], AppColors.mybtnColor1),
                  buildButtonRow(["7", "8", "9", "×"], AppColors.mybtnColor1),
                  buildButtonRow(["4", "5", "6", "–"], AppColors.mybtnColor1),
                  buildButtonRow(["1", "2", "3", "+"], AppColors.mybtnColor1),
                  buildButtonRow(["√", "0", ".", "="], AppColors.mybtnColor2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons, Color? color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons
          .map(
            (btnText) => CalculatorButton(
              btnText: btnText,
              btnColor: btnText == "=" ? AppColors.mybtnColor2 : color,
              onTap: () => buttonPressed(btnText, updateState, _input, _output,
                  _operand, _previousNumber, _currentNumber),
            ),
          )
          .toList(),
    );
  }
}
