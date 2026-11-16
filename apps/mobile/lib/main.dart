import 'package:flutter/material.dart';

import 'pantalla_pedidos.dart';
import 'repositorio_pedidos_falso.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedidos cafetería',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        useMaterial3: true,
      ),
      home: PantallaPedidos(repositorio: RepositorioPedidosFalso()),
    );
  }
}
