// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5); revisado y probado por el autor.
import 'package:flutter/material.dart';

import 'producto.dart';
import 'repositorio_falso.dart';
import 'resultado.dart';

class ListaProductosScreen extends StatefulWidget {
  const ListaProductosScreen({super.key, required this.repositorio});

  final RepositorioFalso repositorio;

  @override
  State<ListaProductosScreen> createState() => _ListaProductosScreenState();
}

class _ListaProductosScreenState extends State<ListaProductosScreen> {
  Resultado<List<Producto>> _estado = const Cargando();

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
      setState(() => _estado = const Error('No pudimos cargar el menú. Revisa tu conexión e inténtalo de nuevo.'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menú de la cafetería')),
      body: switch (_estado) {
        Cargando() => const Center(child: CircularProgressIndicator()),
        Exito(datos: final productos) => ListView.builder(
            itemCount: productos.length,
            itemBuilder: (context, i) {
              final p = productos[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                child: ListTile(
                  title: Text(p.nombre),
                  subtitle: Text('${p.categoria} · ${p.disponible ? 'Disponible' : 'Agotado'}'),
                  trailing: Text('\$${p.precio.toStringAsFixed(2)}'),
                ),
              );
            },
          ),
        Error(mensaje: final m) => Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off, size: 48),
                  const SizedBox(height: 12),
                  Text(m, textAlign: TextAlign.center),
                  const SizedBox(height: 16),
                  FilledButton(onPressed: _cargar, child: const Text('Reintentar')),
                ],
              ),
            ),
          ),
      },
    );
  }
}
