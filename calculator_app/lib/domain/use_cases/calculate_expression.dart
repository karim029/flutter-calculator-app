import 'package:expressions/expressions.dart';
import 'package:calculator_app/data/models/calculator_model.dart';

class CalculateExpression {
  CalculatorModel calculate(String expression) {
    final evaluator = const ExpressionEvaluator();
    double result;

    try {
      final parsedExpression = Expression.parse(expression);
      result = evaluator.eval(parsedExpression, {});
    } catch (e) {
      result = double.nan;
    }

    return CalculatorModel(expression: expression, result: result.toString());
  }
}
