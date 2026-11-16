// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5).
// Resultado<T>: los tres estados posibles de una carga de datos.
// Es "sealed": el compilador conoce todos los subtipos y por eso un switch
// sobre Resultado no necesita default.
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

class Error<T> extends Resultado<T> {
  const Error(this.mensaje);
  final String mensaje;
}
