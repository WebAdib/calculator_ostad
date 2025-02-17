// This is Function.dart page

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
  bool showCalculatorText = false; // Hide text when any button is clicked

  if (buttonText == "C") {
    input = "";
    output = "0";
    previousNumber = 0.0;
    currentNumber = 0.0;
    operand = "";
    showCalculatorText = true; // Show text again when "C" is clicked
  } else if (buttonText == "A") {
    if (input.isNotEmpty) {
      input = input.substring(0, input.length - 1);
    }
  } else if (buttonText == "√") {
    if (input.isEmpty || "+–×÷%".contains(input[input.length - 1])) {
      input += "√";
    }
  } else if (["+", "–", "×", "÷", "%"].contains(buttonText)) {
    if (input.isNotEmpty && operand.isEmpty) {
      previousNumber = parseNumber(input);
      operand = buttonText;
      input += buttonText;
      output = "";
    }
  } else if (buttonText == "=") {
    if (operand.isNotEmpty) {
      try {
        String secondPart = input.split(RegExp(r'[+–×÷%]'))[1];
        currentNumber = parseNumber(secondPart);
        output = calculateResult(operand, previousNumber, currentNumber);
        input = output;
        previousNumber = double.tryParse(output) ?? 0.0;
        operand = "";
      } catch (e) {
        output = "Error";
      }
    } else if (input.contains("√")) {
      output = parseNumber(input).toString();
      input = output;
    }
  } else {
    input += buttonText;

    if (input.contains("√") && !input.contains(RegExp(r'[+–×÷%]'))) {
      double rootValue = parseNumber(input);
      output = rootValue.toString();
    } else if (operand.isNotEmpty) {
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

  setStateCallback(input, output, operand, previousNumber, currentNumber);
}

// Function to parse numbers, including square root handling
double parseNumber(String input) {
  if (input.contains("√")) {
    String numStr = input.replaceAll("√", ""); // Remove √ to get the number
    double num = double.tryParse(numStr) ?? 0.0;
    return sqrt(num); // Return square root
  } else {
    return double.tryParse(input) ?? 0.0;
  }
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
