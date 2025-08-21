import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Progress Indicators')),
      body: const Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Text('Curcular progress indicator'),
            SizedBox(height: 10),
            CircularProgressIndicator(
              strokeWidth: 2,
              backgroundColor: Colors.black45,
            ),
            SizedBox(height: 10),
            Text('Curcular idnicator controlado'),
            SizedBox(height: 10),
            _ControllerProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class _ControllerProgressIndicator extends StatelessWidget {
  const _ControllerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (value) => (value * 2) / 100, // 0.0, 1.0
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        // AsyncSnapshot<double> snapshot Emite valores de tipo double
        final controller = snapshot.data;
        return Padding(
          padding: const EdgeInsetsGeometry.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: controller,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(width: 10),
              Expanded(child: LinearProgressIndicator(value: controller)),
            ],
          ),
        );
      },
    );
  }
}
