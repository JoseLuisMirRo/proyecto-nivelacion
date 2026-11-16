import 'package:flutter/material.dart';

import 'categoria.dart';
import 'repositorio_categorias_falso.dart';
import 'resultado.dart';

// IA: bloque generado con Claude Code (pantalla con tres estados).
class PantallaCategorias extends StatefulWidget {
  const PantallaCategorias({super.key, required this.repositorio});

  final RepositorioCategoriasFalso repositorio;

  @override
  State<PantallaCategorias> createState() => _PantallaCategoriasState();
}

class _PantallaCategoriasState extends State<PantallaCategorias> {
  Resultado<List<Categoria>> _estado = const Cargando();

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    setState(() => _estado = const Cargando());
    try {
      final datos = await widget.repositorio.obtener();
      // La pantalla pudo cerrarse durante el await: sin esto, setState lanza.
      if (!mounted) return;
      setState(() => _estado = Exito(datos));
    } catch (_) {
      if (!mounted) return;
      setState(
        () => _estado = const Error(
          'No pudimos cargar las categorías. Revisa tu conexión e inténtalo de nuevo.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categorías de la cafetería')),
      body: switch (_estado) {
        Cargando() => const Center(child: CircularProgressIndicator()),
        Exito(datos: final categorias) => _ListaCategorias(
          categorias: categorias,
        ),
        Error(mensaje: final m) => _EstadoError(
          mensaje: m,
          onReintentar: _cargar,
        ),
      },
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({required this.categorias});

  final List<Categoria> categorias;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categorias.length,
      itemBuilder: (context, i) {
        final c = categorias[i];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: ListTile(
            leading: const Icon(Icons.category),
            title: Text(c.nombre),
            subtitle: Text('${c.descripcion} · ${c.totalProductos} productos'),
          ),
        );
      },
    );
  }
}

class _EstadoError extends StatelessWidget {
  const _EstadoError({required this.mensaje, required this.onReintentar});

  final String mensaje;
  final VoidCallback onReintentar;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.error_outline, size: 56, color: Colors.redAccent),
            const SizedBox(height: 12),
            Text(
              mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            FilledButton.icon(
              onPressed: onReintentar,
              icon: const Icon(Icons.refresh),
              label: const Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }
}
