import 'package:flutter/material.dart';
import 'package:calculator_app/core/utils/constants.dart';

class ButtonColorController {
  Color colorChecker(int index) {
    final buttonText = buttons[index];
    return operations.contains(buttonText) ? operationColor : numbersColor;
  }
}
