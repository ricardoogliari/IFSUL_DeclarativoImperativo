import 'package:calculadora_flutter/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppController extends StatelessWidget {
  const MyAppController({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstOperatorController = TextEditingController();
  final TextEditingController _secondOperatorController = TextEditingController();

  void makeCalculate(){
    controller.calculate(_firstOperatorController.text, _secondOperatorController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Sum"),
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
                child: Obx(() => Text(controller.result.value)),
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