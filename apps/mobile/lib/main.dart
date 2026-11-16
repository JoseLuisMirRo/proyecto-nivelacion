// IA: archivo preparado con ayuda de Claude Code (Claude Opus 5.5); revisado y probado por el autor.
import 'package:flutter/material.dart';

import 'lista_clientes_screen.dart';
import 'repositorio_clientes_falso.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista con tres estados',
      theme: ThemeData(colorSchemeSeed: Colors.indigo),
      home: ListaClientesScreen(repositorio: RepositorioClientesFalso()),
    );
  }
}
