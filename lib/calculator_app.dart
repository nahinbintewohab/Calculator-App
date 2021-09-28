import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  TextEditingController x = TextEditingController();
  TextEditingController y = TextEditingController();
  int sum = 0;
  int remove = 0;
  int mul = 0;
  double div = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[600],
        title: Center(
            child: Text(
          "Calculator",
        )),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Add",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$sum",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        "Substract",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$remove",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        "Multiplication",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$mul",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(width: 40),
                  Column(
                    children: [
                      Text(
                        "Division",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "$div",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: x,
                decoration: InputDecoration(
                  labelText: "Enter a number",
                  hintText: '1',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  RegExp regex = RegExp(r'/d$');
                  if (!regex.hasMatch(value!)) {
                    return 'only numbers are allowed';
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: y,
                decoration: InputDecoration(
                  labelText: "Enter a number",
                  hintText: '1',
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.always,
                validator: (value) {
                  RegExp regex = RegExp(r'\d$');
                  if (!regex.hasMatch(value!)) {
                    return 'only numbers are allowed';
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      int num1 = int.parse(x.text);
                      int num2 = int.parse(y.text);
                      sum = num1 + num2;
                      setState(() {});
                    },
                    child: Text("Add"),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      int num1 = int.parse(x.text);
                      int num2 = int.parse(y.text);
                      remove = num1 - num2;
                      setState(() {});
                    },
                    child: Text("Remove"),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      int num1 = int.parse(x.text);
                      int num2 = int.parse(y.text);
                      mul = num1 * num2;
                      setState(() {});
                    },
                    child: Text("Mul"),
                  ),
                  SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () {
                      double num1 = double.parse(x.text);
                      double num2 = double.parse(y.text);
                      //sum = num1 / num2;
                      if (num2 == 0) {
                        print("invalid");
                      } else {
                        div = num1 / num2;
                      }

                      setState(() {});
                    },
                    child: Text("Div"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
