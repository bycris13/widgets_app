import 'package:flutter/material.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/cards/cards_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menuItem = appMenuItems[index];
        return _CustomeListTitle(menuItem: menuItem);
      },
    );
  }
}

class _CustomeListTitle extends StatelessWidget {
  const _CustomeListTitle({required this.menuItem});

  final MenuItems menuItem;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(menuItem.icon, color: colors.primary),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      title: Text(menuItem.titel),
      subtitle: Text(menuItem.subTitel),
      onTap: () {
        // Navigator

        /*  Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const CardsScreen())); */

        Navigator.pushNamed(context, menuItem.link);
      },
    );
  }
}
