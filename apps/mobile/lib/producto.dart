// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5); revisado y probado por el autor.
/// Entidad de la cafetería.
class Producto {
  const Producto({
    required this.nombre,
    required this.precio,
    required this.categoria,
    this.disponible = true,
  });

  final String nombre;
  final double precio;
  final String categoria;
  final bool disponible;
}
