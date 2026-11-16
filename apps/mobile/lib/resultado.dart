/// Tres estados posibles de una pantalla que carga datos.
///
/// Portado tal cual de la Nivelación T1 de Erick Mireles (20233tn070).
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

// `Error` existe en `dart:core`; se tapa a propósito para coincidir con los
// nombres del deck P3 de la nivelación.
class Error<T> extends Resultado<T> {
  const Error(this.mensaje);
  final String mensaje;
}
