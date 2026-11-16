// IA: archivo preparado con ayuda de Claude Code (Claude Opus 5.5); revisado y probado por el autor.
import 'cliente.dart';

/// Repositorio de prueba (sin HTTP): la primera llamada falla y la segunda
/// funciona, para poder ver el estado de error y el reintento.
class RepositorioClientesFalso {
  int _llamadas = 0;

  Future<List<Cliente>> obtener() async {
    await Future.delayed(const Duration(seconds: 2));
    _llamadas++;
    if (_llamadas == 1) throw Exception('Sin conexión'); // falla la 1.ª vez
    return const [
      Cliente(
        nombre: 'María Fernanda López',
        correo: 'maria.lopez@correo.com',
        telefono: '777 123 4567',
      ),
      Cliente(
        nombre: 'Carlos Hernández Ruiz',
        correo: 'carlos.hernandez@correo.com',
        telefono: '777 234 5678',
      ),
      Cliente(
        nombre: 'Ana Sofía Martínez',
        correo: 'ana.martinez@correo.com',
        telefono: '777 345 6789',
      ),
      Cliente(
        nombre: 'Jorge Ramírez Torres',
        correo: 'jorge.ramirez@correo.com',
        telefono: '777 456 7890',
        activo: false,
      ),
      Cliente(
        nombre: 'Lucía Gómez Díaz',
        correo: 'lucia.gomez@correo.com',
        telefono: '777 567 8901',
      ),
      Cliente(
        nombre: 'Ricardo Flores Vega',
        correo: 'ricardo.flores@correo.com',
        telefono: '777 678 9012',
      ),
    ];
  }
}
