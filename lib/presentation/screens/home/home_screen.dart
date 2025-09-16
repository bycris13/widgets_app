import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_Screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(title: const Text('Flutter + Material 3')),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

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
        // Navigacion propia de flutter
        /*  Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (context) => const CardsScreen())); */

        // Navigator.pushNamed(context, menuItem.link);

        // go_router:
        // Navegacion por nombre:
        //context.pushNamed(ButtonsScreen.name);
        context.push(menuItem.link);
      },
    );
  }
}
