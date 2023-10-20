import 'package:flutter/material.dart';

void main() => runApp(MyCalculatorApp());

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "0";
  String equation = "";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  void buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        output = "0";
        equation = "";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
        num1 = double.parse(output);
        operand = buttonText;
        equation = output + operand;
        output = "0";
      } else if (buttonText == "=") {
        num2 = double.parse(output);
        if (operand == "+") {
          output = (num1 + num2).toString();
        }
        if (operand == "-") {
          output = (num1 - num2).toString();
        }
        if (operand == "*") {
          output = (num1 * num2).toString();
        }
        if (operand == "/") {
          output = (num1 / num2).toString();
        }
        equation = "";
        num1 = 0.0;
        num2 = 0.0;
        operand = "";
      } else {
        if (output == "0") {
          output = buttonText;
        } else {
          output = output + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText) {
  return Expanded(
    child: OutlinedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(24.0)),
      ),
      onPressed: () => buttonPressed(buttonText),
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20.0,
        ),
      ),
    ),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
            child: Text(
              equation,
              style: TextStyle(fontSize: 24.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 48.0),
            child: Text(
              output,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("/"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("-"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("."),
                  buildButton("0"),
                  buildButton("C"),
                  buildButton("+"),
                ],
              ),
              Row(
                children: <Widget>[
                  buildButton("="),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

