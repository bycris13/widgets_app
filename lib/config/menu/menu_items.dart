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
    titel: 'Counter Screen',
    subTitel: 'Introducción a RiverPod',
    link: '/counter-river',
    icon: Icons.add,
  ),
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
    titel: 'Animated container',
    subTitel: 'Stateful widget animado',
    link: '/animated',
    icon: Icons.check_box_outline_blank_rounded,
  ),
  MenuItems(
    titel: 'UI Controlls + Titles',
    subTitel: 'Una serie de controles de flutter',
    link: '/ui-controls',
    icon: Icons.car_rental_outlined,
  ),
  MenuItems(
    titel: 'Introduccion a la aplicacion',
    subTitel: 'Pequeño tutorial de la App',
    link: '/tutorial',
    icon: Icons.accessible_rounded,
  ),
  MenuItems(
    titel: 'InfiniteScroll y pull',
    subTitel: 'Listas infinitas y pull to refresh',
    link: '/infinite',
    icon: Icons.list_alt_outlined,
  ),
  MenuItems(
    titel: 'Cambiar Tema',
    subTitel: 'Cambiar tema de la aplicacion',
    link: '/theme_changer',
    icon: Icons.color_lens_outlined,
  ),
];
