import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  String _result = "";

  void _calculate(String operation) {
    int num1 = int.tryParse(_num1Controller.text) ?? 0;
    int num2 = int.tryParse(_num2Controller.text) ?? 0;
    double res;

    switch (operation) {
      case 'add':
        res = (num1 + num2).toDouble();
        break;
      case 'subtract':
        res = (num1 - num2).toDouble();
        break;
      case 'multiply':
        res = (num1 * num2).toDouble();
        break;
      case 'divide':
        res = num2 != 0 ? num1 / num2 : double.infinity;
        break;
      default:
        res = 0;
    }

    setState(() {
      _result = "Result: $res";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "Enter first number"),
            ),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: "Enter second number"),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () => _calculate("add"), child: const Text("+")),
                ElevatedButton(
                    onPressed: () => _calculate("subtract"),
                    child: const Text("-")),
                ElevatedButton(
                    onPressed: () => _calculate("multiply"),
                    child: const Text("×")),
                ElevatedButton(
                    onPressed: () => _calculate("divide"),
                    child: const Text("÷")),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
