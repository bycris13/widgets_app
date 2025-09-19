import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/app_theme.dart';

// Esatado => darkModeProvider = boolean.
final darkModeProvider = StateProvider((ref) => false);

// Listado de colores inmutable.
final colorListProvider = Provider((ref) => colorsList);

final selectedColorProvider = StateProvider((ref) => 0);
