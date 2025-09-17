import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const String name = 'couter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      body: const Center(
        child: Text('Valor: 10', style: TextStyle(fontSize: 25)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
