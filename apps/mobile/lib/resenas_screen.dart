
import 'package:flutter/material.dart';

import 'resena.dart';
import 'repositorio_resenas.dart';
import 'resultado.dart';

class ResenasScreen extends StatefulWidget {
  const ResenasScreen({
    super.key,
    required this.repositorio,
  });

  final RepositorioResenas repositorio;

  @override
  State<ResenasScreen> createState() => _ResenasScreenState();
}

class _ResenasScreenState extends State<ResenasScreen> {
  Resultado<List<Resena>> _estado = const Cargando();

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    setState(() => _estado = const Cargando());

    try {
      final datos = await widget.repositorio.obtener();

      if (!mounted) return;

      setState(() => _estado = Exito(datos));
    } catch (_) {
      if (!mounted) return;

      setState(
        () => _estado = const Error(
          'No pudimos cargar las reseñas. Revisa tu conexión e inténtalo de nuevo.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reseñas de la cafetería'),
      ),
      body: switch (_estado) {
        Cargando() => const Center(
            child: CircularProgressIndicator(),
          ),

        Exito(datos: final resenas) => ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: resenas.length,
            itemBuilder: (context, i) {
              final resena = resenas[i];

              return Card(
                margin: const EdgeInsets.symmetric(vertical: 6),
                child: ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(resena.autor),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            index < resena.calificacion
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(resena.comentario),
                    ],
                  ),
                  isThreeLine: true,
                ),
              );
            },
          ),

        Error(mensaje: final mensaje) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.wifi_off,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    mensaje,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: _cargar,
                    child: const Text('Reintentar'),
                  ),
                ],
              ),
            ),
          ),
      },
    );
  }
}