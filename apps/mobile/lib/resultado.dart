// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5); revisado y probado por el autor.
/// Los tres estados posibles de una pantalla que carga datos.
sealed class Resultado<T> {
  const Resultado();
}

class Cargando<T> extends Resultado<T> {
  const Cargando();
}

class Exito<T> extends Resultado<T> {
  const Exito(this.datos);
  final T datos;
}

// `Error` ya existe en dart:core; esta declaración local lo tapa
// (así se usa en la nivelación para coincidir con los decks).
class Error<T> extends Resultado<T> {
  const Error(this.mensaje);
  final String mensaje;
}
