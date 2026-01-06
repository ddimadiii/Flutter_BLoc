import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/calculator_bloc.dart';
import '../events/calculator_event.dart';
import '../states/calculator_state.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController num1Controller = TextEditingController();
    final TextEditingController num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: TextField(
                          controller: num1Controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'First Number',
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: TextField(
                          controller: num2Controller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: 'Second Number',
                            enabledBorder: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            double n1 = double.parse(num1Controller.text);
                            double n2 = double.parse(num2Controller.text);
                            context.read<CalculatorBloc>().add(
                              OnCalculate(n1, n2, '+'),
                            );
                          },
                          child: const Text('+'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            double n1 = double.parse(num1Controller.text);
                            double n2 = double.parse(num2Controller.text);
                            context.read<CalculatorBloc>().add(
                              OnCalculate(n1, n2, '-'),
                            );
                          },
                          child: const Text('-'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            double n1 = double.parse(num1Controller.text);
                            double n2 = double.parse(num2Controller.text);
                            context.read<CalculatorBloc>().add(
                              OnCalculate(n1, n2, '×'),
                            );
                          },
                          child: const Text('×'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: ElevatedButton(
                          onPressed: () {
                            double n1 = double.parse(num1Controller.text);
                            double n2 = double.parse(num2Controller.text);
                            context.read<CalculatorBloc>().add(
                              OnCalculate(n1, n2, '÷'),
                            );
                          },
                          child: const Text('÷'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: Text(
                    "Result : ${state.result}",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      num1Controller.clear();
                      num2Controller.clear();
                      context.read<CalculatorBloc>().add(OnReset());
                    },
                    child: const Text('Reset'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
