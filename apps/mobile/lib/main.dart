import 'package:flutter/material.dart';

import 'pantalla_categorias.dart';
import 'repositorio_categorias_falso.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categorías cafetería',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: PantallaCategorias(repositorio: RepositorioCategoriasFalso()),
    );
  }
}
