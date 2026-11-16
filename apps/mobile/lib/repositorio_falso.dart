// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5); revisado y probado por el autor.
import 'producto.dart';

/// Repositorio de prueba: la primera llamada falla y la segunda funciona,
/// para poder ver el estado de error y el reintento.
class RepositorioFalso {
  int _llamadas = 0;

  Future<List<Producto>> obtener() async {
    await Future.delayed(const Duration(seconds: 2));
    _llamadas++;
    if (_llamadas == 1) throw Exception('Sin conexión'); // falla la 1.ª vez
    return const [
      Producto(nombre: 'Latte', precio: 45, categoria: 'Bebidas calientes'),
      Producto(nombre: 'Espresso', precio: 30, categoria: 'Bebidas calientes'),
      Producto(nombre: 'Frappé de moka', precio: 58, categoria: 'Bebidas frías'),
      Producto(nombre: 'Galleta de avena', precio: 20, categoria: 'Postres'),
      Producto(nombre: 'Sándwich de pollo', precio: 65, categoria: 'Alimentos'),
      Producto(
        nombre: 'Pastel de chocolate',
        precio: 48,
        categoria: 'Postres',
        disponible: false,
      ),
    ];
  }
}
