import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static const name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext contextl, WidgetRef ref) {
    final bool isDarkMode = ref.watch(darkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Theme Changer'),
        actions: [
          IconButton(
            onPressed: () {
              ref
                  .read(darkModeProvider.notifier)
                  .update((changeMode) => !isDarkMode);
            },
            icon: isDarkMode
                ? const Icon(Icons.light_mode_outlined)
                : const Icon(Icons.dark_mode_outlined),
          ),
        ],
      ),
      body: _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int selectedColor = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colorsList.length,
      itemBuilder: (context, index) {
        final color = colorsList[index];
        return RadioListTile(
          title: Text('Este Color', style: TextStyle(color: color)),
          subtitle: Text('${color.value}'),
          value: index,
          groupValue: selectedColor,
          onChanged: (value) {
            ref
                .read(selectedColorProvider.notifier)
                .update((state) => state = index);
          },
        );
      },
    );
  }
}
