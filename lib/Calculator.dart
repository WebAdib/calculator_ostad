import 'package:calculator_ostad/widgets/Colors.dart';
import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.myDarkGray,
      //appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 50),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Container(
                width: double.infinity,
                color: AppColors.myDarkGray,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Calculator",
                          style: TextStyle(
                            fontSize: screenWidth * 0.15,
                            color: AppColors.myGray,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .end, // Aligns second text to the right
                      children: [
                        Text(
                          "7x6",
                          style: TextStyle(
                            fontSize: screenWidth * 0.15,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .end, // Aligns third text to the right
                      children: [
                        Text(
                          "42",
                          style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            color: AppColors.myGray,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              color: Colors.black,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10, right: 10, top: 25, bottom: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalculatorButton(btnText: 'A'),
                        CalculatorButton(btnText: 'C'),
                        CalculatorButton(btnText: '%'),
                        CalculatorButton(
                            btnText: '÷', btnColor: AppColors.mybtnColor1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalculatorButton(btnText: '7'),
                        CalculatorButton(btnText: '8'),
                        CalculatorButton(btnText: '9'),
                        CalculatorButton(
                            btnText: '×', btnColor: AppColors.mybtnColor1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalculatorButton(btnText: '4'),
                        CalculatorButton(btnText: '5'),
                        CalculatorButton(btnText: '6'),
                        CalculatorButton(
                            btnText: '–', btnColor: AppColors.mybtnColor1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalculatorButton(btnText: '1'),
                        CalculatorButton(btnText: '2'),
                        CalculatorButton(btnText: '3'),
                        CalculatorButton(
                            btnText: '+', btnColor: AppColors.mybtnColor1),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalculatorButton(btnText: '^'),
                        CalculatorButton(btnText: '0'),
                        CalculatorButton(btnText: '.'),
                        CalculatorButton(
                            btnText: '=', btnColor: AppColors.mybtnColor2),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
