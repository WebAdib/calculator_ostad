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
  } else if (buttonText == "√") {
    // Allow √ only at the beginning or after an operator
    if (input.isEmpty || "+–×÷%".contains(input[input.length - 1])) {
      input += "√";
    }
  } else if (["+", "–", "×", "÷", "%"].contains(buttonText)) {
    // Store first number and operand
    if (input.isNotEmpty && operand.isEmpty) {
      previousNumber = parseNumber(input);
      operand = buttonText;
      input += buttonText;
      output = ""; // Clear output until next number is entered
    }
  } else if (buttonText == "=") {
    // Ensure calculation only happens if there is an operand
    if (operand.isNotEmpty) {
      try {
        // Extract second number from input after the operand
        String secondPart = input.split(RegExp(r'[+–×÷%]'))[1];

        currentNumber = parseNumber(secondPart);
        output = calculateResult(operand, previousNumber, currentNumber);
        input = output; // Make input = output
        previousNumber = double.tryParse(output) ?? 0.0;
        operand = "";
      } catch (e) {
        output = "Error";
      }
    } else if (input.contains("√")) {
      // Handle case where "=" is pressed after a square root operation
      output = parseNumber(input).toString();
      input = output; // Sync input with output
    }
  } else {
    // Append numbers and decimals
    input += buttonText;

    // Auto-update output when a number follows √
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

  // Update the UI
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
