import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    // Controllers to grab the text from fields
    final TextEditingController num1Controller = TextEditingController();
    final TextEditingController num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 10.0,
                    ), // Gap on the right
                    child: TextField(
                      controller: num1Controller,
                      decoration: const InputDecoration(
                        labelText: 'First Number',
                        enabledBorder: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                    ), // Gap on the left
                    child: TextField(
                      controller: num2Controller,
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

            // Action Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {}, child: const Text('+')),
                ElevatedButton(onPressed: () {}, child: const Text('-')),
                ElevatedButton(onPressed: () {}, child: const Text('×')),
                ElevatedButton(onPressed: () {}, child: const Text('÷')),
              ],
            ),
            const SizedBox(height: 20),

            const TextField(
              readOnly: true,
              decoration: InputDecoration(
                labelText: 'Result',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  num1Controller.clear();
                  num2Controller.clear();
                },
                child: const Text('Reset'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
