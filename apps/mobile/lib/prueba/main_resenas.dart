
import 'package:flutter/material.dart';

import '../repositorio_resenas.dart';
import '../resenas_screen.dart';

void main() {
  runApp(const AppResenas());
}

class AppResenas extends StatelessWidget {
  const AppResenas({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reseñas de cafetería',
      theme: ThemeData(
        colorSchemeSeed: Colors.brown,
        useMaterial3: true,
      ),
      home: ResenasScreen(
        repositorio: RepositorioResenas(),
      ),
    );
  }
}
