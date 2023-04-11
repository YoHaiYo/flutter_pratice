import 'package:flutter/material.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _displayValue = '0';

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _displayValue = '0';
      } else if (buttonText == '=') {
        _displayValue = evalExpression(_displayValue);
      } else {
        _displayValue = _displayValue == '0' ? buttonText : _displayValue + buttonText;
      }
    });
  }

  String evalExpression(String expression) {
    // Use a third-party library like math_expressions to evaluate the expression
    return expression;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Calculator')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text(
                _displayValue,
                style: TextStyle(fontSize: 32),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('7'),
              buildButton('8'),
              buildButton('9'),
              buildButton('/'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('4'),
              buildButton('5'),
              buildButton('6'),
              buildButton('*'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('1'),
              buildButton('2'),
              buildButton('3'),
              buildButton('-'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildButton('C'),
              buildButton('0'),
              buildButton('='),
              buildButton('+'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
