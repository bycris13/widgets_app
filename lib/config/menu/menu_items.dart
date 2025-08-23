import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' show IconData;

class MenuItems {
  final String titel;
  final String subTitel;
  final String link;
  final IconData icon;
  const MenuItems({
    required this.titel,
    required this.subTitel,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    titel: 'Botones',
    subTitel: 'Varios botones en Flutter',
    link: '/buttons',
    icon: Icons.smart_button_outlined,
  ),
  MenuItems(
    titel: 'Tarjetas',
    subTitel: 'Un contenedor estilizado',
    link: '/cards',
    icon: Icons.credit_card,
  ),
  MenuItems(
    titel: 'ProgressIndicators',
    subTitel: 'Generales y controladores',
    link: '/progress',
    icon: Icons.refresh_outlined,
  ),
  MenuItems(
    titel: 'Snackbars y dialogos',
    subTitel: 'Generales y controladores',
    link: '/snackbars',
    icon: Icons.info_outline,
  ),
  MenuItems(
    titel: 'Animated',
    subTitel: 'Animaciones en flutter',
    link: '/animated',
    icon: Icons.animation,
  ),
];
