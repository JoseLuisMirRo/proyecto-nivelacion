// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5).
// Punto de entrada de la T3 de Danna. Se corre con:
//   flutter run -t lib/main_pagos.dart
// Así no se toca lib/main.dart, que usan otras ramas del equipo.
import 'package:flutter/material.dart';

import 'pagos/lista_pagos_screen.dart';
import 'pagos/repositorio_falso.dart';

void main() {
  runApp(const PagosApp());
}

class PagosApp extends StatelessWidget {
  const PagosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista con tres estados',
      theme: ThemeData(colorSchemeSeed: Colors.brown, useMaterial3: true),
      home: ListaPagosScreen(repositorio: RepositorioFalso()),
    );
  }
}
