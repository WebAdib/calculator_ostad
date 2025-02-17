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
  bool _showCalculatorText = true;
  bool _isResultDisplayed = false; // Track if '=' is pressed

  void updateState(String input, String output, String operand,
      double previousNumber, double currentNumber, bool isResult) {
    setState(() {
      _input = input;
      _output = output;
      _operand = operand;
      _previousNumber = previousNumber;
      _currentNumber = currentNumber;
      _showCalculatorText = input.isEmpty;
      _isResultDisplayed = isResult; // Track result display state
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
                    opacity: _showCalculatorText ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 180),
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
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(
                            _input.isEmpty ? "0" : _input,
                            style: TextStyle(
                              fontSize: _isResultDisplayed
                                  ? screenWidth * 0.07
                                  : screenWidth * 0.15,
                              color: _isResultDisplayed
                                  ? AppColors.myGray
                                  : Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          reverse: true,
                          child: Text(
                            _output,
                            style: TextStyle(
                              fontSize: _isResultDisplayed
                                  ? screenWidth * 0.12
                                  : screenWidth * 0.07,
                              color: _isResultDisplayed
                                  ? Colors.white
                                  : AppColors.myGray,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
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
                  buildButtonRow(["A", "C", "%", "÷"]),
                  buildButtonRow(["7", "8", "9", "×"]),
                  buildButtonRow(["4", "5", "6", "–"]),
                  buildButtonRow(["1", "2", "3", "+"]),
                  buildButtonRow(["√", "0", ".", "="]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map(
        (btnText) {
          Color btnColor;
          if (["÷", "×", "–", "+"].contains(btnText)) {
            btnColor = AppColors.mybtnColor1; // Operators
          } else if (btnText == "=") {
            btnColor = AppColors.mybtnColor2; // Equals button
          } else {
            btnColor = Colors.black; // Other buttons
          }

          return CalculatorButton(
            btnText: btnText,
            btnColor: btnColor,
            onTap: () => buttonPressed(btnText, updateState, _input, _output,
                _operand, _previousNumber, _currentNumber, btnText == "="),
          );
        },
      ).toList(),
    );
  }
}
