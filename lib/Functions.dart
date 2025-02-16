import 'dart:math';
import 'package:flutter/material.dart';

void buttonPressed(
  String buttonText,
  Function setStateCallback,
  String input,
  String output,
  String operand,
  double previousNumber,
  double currentNumber,
) {
  if (buttonText == "C") {
    // Clear everything
    input = "";
    output = "0";
    previousNumber = 0.0;
    currentNumber = 0.0;
    operand = "";
  } else if (buttonText == "A") {
    // Delete last character
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }
  } else if (["+", "–", "×", "÷", "%"].contains(buttonText)) {
    // Store first number and operand
    if (input.isNotEmpty && operand.isEmpty) {
      previousNumber = double.parse(input);
      operand = buttonText;
      input += buttonText; // Append operand without spaces
      output = ""; // Clear output until second number is entered
    }
  } else if (buttonText == "=") {
    // Perform calculation
    if (operand.isNotEmpty) {
      try {
        String secondPart =
            input.split(RegExp(r'[+–×÷%]'))[1]; // Get second number
        currentNumber = double.parse(secondPart);
        output = calculateResult(operand, previousNumber, currentNumber);
        input = output; // Sync input with output
        previousNumber = double.tryParse(output) ?? 0.0;
        operand = "";
      } catch (e) {
        output = "Error";
      }
    }
  } else {
    // Append numbers and decimals
    input += buttonText;

    // Auto-update output if an operand exists
    if (operand.isNotEmpty) {
      try {
        String secondPart =
            input.split(RegExp(r'[+–×÷%]'))[1]; // Get second number
        currentNumber = double.parse(secondPart);
        output = calculateResult(operand, previousNumber, currentNumber);
      } catch (e) {
        output = "";
      }
    }
  }

  // Update the UI
  setStateCallback(input, output, operand, previousNumber, currentNumber);
}

String calculateResult(
    String operand, double previousNumber, double currentNumber) {
  double result = 0.0;

  switch (operand) {
    case "+":
      result = previousNumber + currentNumber;
      break;
    case "–":
      result = previousNumber - currentNumber;
      break;
    case "×":
      result = previousNumber * currentNumber;
      break;
    case "÷":
      result = (currentNumber != 0)
          ? previousNumber / currentNumber
          : double.infinity;
      break;
    case "%":
      result = previousNumber % currentNumber;
      break;
  }

  return result.toString();
}
