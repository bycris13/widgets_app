import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomeSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      backgroundColor: Colors.red,
      content: const Text('Hola Mundo'),
      action: SnackBarAction(
        label: 'OK!',
        textColor: Colors.yellow,
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Center(child: Text('¿Estas seguro?')),
        content: const Text(
          'sadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsdasadasdadadadadadasdasdasdasdfdgdgdgffsda',
        ),
        actions: [
          TextButton(
            // Gracias al go_router tengo acceso a ese context.pop()
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(onPressed: () {}, child: const Text('Aceptar')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Snackbars y dialogos')),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  children: [
                    const Text(
                      'askjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjdaskjdhjasdahsndkjashdakjd',
                    ),
                  ],
                );
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar dialogo'),
            ),
          ],
        ),
      ),
      // Boton extendido con icono que levanta el snackbar
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar snakbar'),
        onPressed: () {
          //SnackBar
          /* ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              // duration: Duration(milliseconds: 800),
              content: Text('Hola mundo'),
            ),
          ); */
          showCustomeSnackBar(context);
        },
      ),
    );
  }
}
