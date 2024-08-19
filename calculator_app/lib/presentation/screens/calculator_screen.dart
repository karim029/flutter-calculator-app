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
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
              child: Text(
                viewModel.expression,
                style: TextStyle(fontSize: 24),
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
    return Expanded(
      flex: 2,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, childAspectRatio: 1.4),
        itemCount: buttons.length, // Add itemCount to GridView.builder
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => viewModel.onButtonPressed(buttons[index]),
            child: Container(
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child: Text(
                  buttons[index],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
