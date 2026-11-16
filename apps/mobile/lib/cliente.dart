// IA: archivo preparado con ayuda de Claude Code (Claude Opus 5.5); revisado y probado por el autor.
/// Entidad Cliente del proyecto.
class Cliente {
  const Cliente({
    required this.nombre,
    required this.correo,
    required this.telefono,
    this.activo = true,
  });

  final String nombre;
  final String correo;
  final String telefono;
  final bool activo;
}
