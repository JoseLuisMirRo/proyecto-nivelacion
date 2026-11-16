
import 'resena.dart';

class RepositorioResenas {
  int _llamadas = 0;

  Future<List<Resena>> obtener() async {
    await Future.delayed(const Duration(seconds: 2));

    _llamadas++;

    if (_llamadas == 1) {
      throw Exception('Sin conexión');
    }

    return const [
      Resena(
        autor: 'Ana López',
        calificacion: 5,
        comentario: 'Excelente café y muy buen servicio.',
      ),
      Resena(
        autor: 'Carlos Pérez',
        calificacion: 4,
        comentario: 'El ambiente es agradable y los precios son buenos.',
      ),
      Resena(
        autor: 'María García',
        calificacion: 5,
        comentario: 'Me encantaron los postres.',
      ),
      Resena(
        autor: 'Luis Hernández',
        calificacion: 3,
        comentario: 'La atención puede mejorar.',
      ),
    ];
  }
}