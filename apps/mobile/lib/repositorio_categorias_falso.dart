import 'dart:async';

import 'categoria.dart';

// IA: bloque generado con Claude Code (repositorio falso de categorías).
/// Repositorio falso de categorías.
///
/// La primera llamada falla a propósito para probar el estado de error con
/// reintento; la segunda devuelve 6 categorías de ejemplo de la cafetería.
class RepositorioCategoriasFalso {
  RepositorioCategoriasFalso({this.espera = const Duration(seconds: 2)});

  final Duration espera;
  int _llamadas = 0;

  Future<List<Categoria>> obtener() async {
    await Future.delayed(espera);
    _llamadas++;
    if (_llamadas == 1) {
      throw Exception('Sin conexion con el servicio de categorias');
    }
    return const [
      Categoria(
        nombre: 'Café caliente',
        descripcion: 'Espresso, americano y latte',
        totalProductos: 8,
      ),
      Categoria(
        nombre: 'Café frío',
        descripcion: 'Cold brew y frappés',
        totalProductos: 5,
      ),
      Categoria(
        nombre: 'Té e infusiones',
        descripcion: 'Té negro, verde y de hierbas',
        totalProductos: 4,
      ),
      Categoria(
        nombre: 'Postres',
        descripcion: 'Pasteles, galletas y brownies',
        totalProductos: 6,
      ),
      Categoria(
        nombre: 'Panadería',
        descripcion: 'Pan dulce, croissants y baguettes',
        totalProductos: 7,
      ),
      Categoria(
        nombre: 'Desayunos',
        descripcion: 'Sándwiches, molletes y chilaquiles',
        totalProductos: 5,
      ),
    ];
  }
}
