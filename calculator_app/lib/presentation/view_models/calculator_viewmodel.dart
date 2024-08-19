import 'package:riverpod/riverpod.dart';
import 'package:calculator_app/domain/use_cases/calculate_expression.dart';
import 'package:calculator_app/data/models/calculator_model.dart';

class CalculatorViewmodel extends StateNotifier<CalculatorModel> {
  final CalculateExpression calculateExpression;
  CalculatorViewmodel(this.calculateExpression)
      : super(
          CalculatorModel(expression: '', result: ''),
        );

  void onButtonPressed(String value) {
    if (value == 'C') {
      state = CalculatorModel(expression: '', result: '');
    } else if (value == '=') {
      _calculate();
    } else {
      state = CalculatorModel(
          expression: state.expression + value, result: state.result);
    }
  }

  void _calculate() {
    final newState = calculateExpression.calculate(state.expression);
    state = newState;
  }
}

final calculatorViewModelProvider =
    StateNotifierProvider<CalculatorViewmodel, CalculatorModel>((ref) {
  return CalculatorViewmodel(CalculateExpression());
});
