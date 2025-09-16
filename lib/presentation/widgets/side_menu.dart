import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu({super.key, required this.scaffoldKey});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    if (Platform.isAndroid) {
      print('Android: $hasNotch');
    } else {
      print('IOS $hasNotch');
    }
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: const Text('Main'),
        ),

        ...appMenuItems
            .sublist(0, 3)
            .map(
              (item) => NavigationDrawerDestination(
                icon: Icon(item.icon),
                label: Text(item.titel),
              ),
            ),
        // Linea de divicion
        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 16, 10),
          child: Divider(),
        ),

        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20, 16, 10),
          child: const Text('Menu options'),
        ),

        ...appMenuItems
            .sublist(3)
            .map(
              (item) => ListTile(
                leading: Icon(item.icon),
                title: Text(item.titel),
                subtitle: Text(item.subTitel),
                onTap: () {
                  context.push(item.link);
                },
              ),
            ),
      ],
    );
  }
}
