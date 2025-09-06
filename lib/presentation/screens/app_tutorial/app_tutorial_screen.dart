import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String titel;
  final String caption;
  final String imageUrl;

  SlideInfo({
    required this.titel,
    required this.caption,
    required this.imageUrl,
  });
}

final slides = <SlideInfo>[
  SlideInfo(
    titel: 'Busca la comida',
    caption:
        'Culpa labore proident non incididunt ad ex do amet veniam tempor sint proident do sit.',
    imageUrl: 'assets/images/1.png',
  ),
  SlideInfo(
    titel: 'Entrega rapida',
    caption:
        'Occaecat nisi cupidatat mollit velit consectetur pariatur officia minim Lorem dolore aliquip.',
    imageUrl: 'assets/images/2.png',
  ),
  SlideInfo(
    titel: 'Disfruta la comida',
    caption: 'Officia aute eu nulla veniam qui magna.',
    imageUrl: 'assets/images/3.png',
  ),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewController = PageController();
  bool endReached = false;
  @override
  void initState() {
    super.initState();

    pageviewController.addListener(() {
      final page = pageviewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            // controller: ??
            controller: pageviewController,
            children: [
              ...slides.map(
                (slideData) => _Slide(
                  title: slideData.titel,
                  caption: slideData.caption,
                  imageUrl: slideData.imageUrl,
                ),
              ),
            ],
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () {
                context.pop();
              },
              child: const Text('Salir'),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 20,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      onPressed: () => context.pop(),
                      child: const Text('Comenzar'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;
    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 10),
            ListTile(
              title: Text(title, style: titleStyle),
              subtitle: Text(caption, style: captionStyle),
            ),
          ],
        ),
      ),
    );
  }
}
