import 'package:calculator_app/core/utils/button_color_controller.dart';
import 'package:calculator_app/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:calculator_app/presentation/view_models/calculator_viewmodel.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(calculatorViewModelProvider);
    final viewModelNotifier = ref.watch(calculatorViewModelProvider.notifier);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        backgroundColor: numbersColor,
        title: const Text(
          'Calculator',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                viewModel.expression,
                style: TextStyle(fontSize: 26),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(1),
              alignment: Alignment.centerRight,
              child: Text(
                viewModel.result,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _buildButtonGrid(viewModelNotifier),
        ],
      ),
    );
  }

  Widget _buildButtonGrid(CalculatorViewModel viewModel) {
    final btnCtrl = ButtonColorController();
    return Expanded(
      flex: 2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.4),
        itemCount: buttons.length, // Add itemCount to GridView.builder
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(30),
            hoverColor: Color.fromARGB(255, 17, 0, 57),
            onTap: () => viewModel.onButtonPressed(buttons[index]),
            splashColor: const Color.fromARGB(255, 135, 132, 132)
                .withOpacity(0.3), // Splash effect color
            highlightColor: const Color.fromARGB(255, 97, 96, 96)
                .withOpacity(0.1), // Highlight effect color
            radius: 30,
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: btnCtrl.colorChecker(index),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  buttons[index],
                  style: TextStyle(fontSize: 26, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
