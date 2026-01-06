import 'package:flutter_bloc/flutter_bloc.dart';
import '../events/calculator_event.dart';
import '../states/calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState(result: 0)) {
    on<OnCalculate>((event, emit) {
      double res = 0;
      switch (event.operation) {
        case '+':
          res = event.num1 + event.num2;
          break;
        case '-':
          res = event.num1 - event.num2;
          break;
        case '×':
          res = event.num1 * event.num2;
          break;
        case '÷':
          res = event.num2 != 0 ? event.num1 / event.num2 : 0;
          break;
      }
      emit(CalculatorState(result: res));
    });

    on<OnReset>((event, emit) => emit(CalculatorState(result: 0)));
  }
}
