abstract class CalculatorEvent {}

class OnCalculate extends CalculatorEvent {
  final double num1;
  final double num2;
  final String operation;
  OnCalculate(this.num1, this.num2, this.operation);
}

class OnReset extends CalculatorEvent {}
