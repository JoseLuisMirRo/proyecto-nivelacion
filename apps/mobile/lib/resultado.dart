// IA: archivo preparado con ayuda de Claude Code (Claude Opus 5.5); revisado y probado por el autor.
/// Los tres estados posibles de una pantalla que carga datos (de la T1).
sealed class Resultado<T> {
  const Resultado();
}

/// Todavía se esperan los datos.
class Cargando<T> extends Resultado<T> {
  const Cargando();
}

/// Los datos llegaron bien.
class Exito<T> extends Resultado<T> {
  const Exito(this.datos);
  final T datos;
}

// `Error` ya existe en dart:core; esta declaración local lo tapa a propósito
// para coincidir con los nombres del deck P3 de la nivelación.
/// Algo falló; [mensaje] es legible para el usuario (sin excepción cruda).
class Error<T> extends Resultado<T> {
  const Error(this.mensaje);
  final String mensaje;
}
