import 'package:calculadora_flutter/my_app_controller.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _result = "No value yet";
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstOperatorController = TextEditingController();
  final TextEditingController _secondOperatorController = TextEditingController();

  void makeCalculate(){
    int first = int.parse(_firstOperatorController.text);
    int second = int.parse(_secondOperatorController.text);

    setState(() {
      _result = "The result is ${first + second}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _firstOperatorController,
                decoration: const InputDecoration(
                  labelText: 'First Operator',
                  suffixIcon: Icon(
                    Icons.onetwothree,
                  ),
                ),
              ),
              TextFormField(
                controller: _secondOperatorController,
                decoration: const InputDecoration(
                  labelText: 'Second Operator',
                  suffixIcon: Icon(
                    Icons.onetwothree,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Text(_result),
              ),
              ElevatedButton(
                onPressed: () {
                  makeCalculate();
                },
                child: const Text("Sum")
              ),
            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
