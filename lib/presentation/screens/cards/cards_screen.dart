import 'package:flutter/material.dart';

const card = <Map<String, dynamic>>[
  {'elevation': 0.0, 'label': 'Elvation 0'},
  {'elevation': 1.0, 'label': 'Elvation 1'},
  {'elevation': 2.0, 'label': 'Elvation 2'},
  {'elevation': 3.0, 'label': 'Elvation 3'},
  {'elevation': 4.0, 'label': 'Elvation 4'},
  {'elevation': 5.0, 'label': 'Elvation 5'},
];

class CardsScreen extends StatelessWidget {
  static const String name = 'cards_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cards Screen')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...card.map(
              (card) =>
                  _CardType1(elvation: card['elevation'], label: card['label']),
            ),
            ...card.map(
              (card) =>
                  _CardType2(elvation: card['elevation'], label: card['label']),
            ),
            ...card.map(
              (card) =>
                  _CardType3(elvation: card['elevation'], label: card['label']),
            ),
            ...card.map(
              (card) =>
                  _CardType4(elvation: card['elevation'], label: card['label']),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final double elvation;
  final String label;
  const _CardType1({required this.elvation, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elvation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(alignment: Alignment.topLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final double elvation;
  final String label;
  const _CardType2({required this.elvation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      elevation: elvation,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        side: BorderSide(color: colors.outline),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text('$label - Outline'),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final double elvation;
  final String label;
  const _CardType3({required this.elvation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainerHigh,
      elevation: elvation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
            Align(alignment: Alignment.topLeft, child: Text(label)),
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final double elvation;
  final String label;
  const _CardType4({required this.elvation, required this.label});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Card(
      color: colors.surfaceContainerHigh,
      elevation: elvation,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Image.network(
            'https://picsum.photos/id/${elvation.toInt()}/600/250',
            height: 350,
            fit: BoxFit.cover,
          ),

          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_outlined),
              ),
            ),
          ),
          Align(alignment: Alignment.topLeft, child: Text('$label - image')),
        ],
      ),
    );
  }
}
