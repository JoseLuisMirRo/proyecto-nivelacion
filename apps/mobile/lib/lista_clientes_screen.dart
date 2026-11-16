// IA: archivo preparado con ayuda de Claude Code (Claude Opus 5.5); revisado y probado por el autor.
import 'package:flutter/material.dart';

import 'cliente.dart';
import 'repositorio_clientes_falso.dart';
import 'resultado.dart';

/// Pantalla de clientes con tres estados: cargando, lista y error con reintento.
class ListaClientesScreen extends StatefulWidget {
  const ListaClientesScreen({super.key, required this.repositorio});

  final RepositorioClientesFalso repositorio;

  @override
  State<ListaClientesScreen> createState() => _ListaClientesScreenState();
}

class _ListaClientesScreenState extends State<ListaClientesScreen> {
  // El estado empieza en Cargando.
  Resultado<List<Cliente>> _estado = const Cargando();

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    setState(() => _estado = const Cargando());
    try {
      final clientes = await widget.repositorio.obtener();
      // La pantalla pudo cerrarse mientras esperábamos: no llamar setState.
      if (!mounted) return;
      setState(() => _estado = Exito(clientes));
    } catch (_) {
      if (!mounted) return;
      setState(
        () => _estado = const Error(
          'No pudimos cargar los clientes. Revisa tu conexión e inténtalo de nuevo.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clientes')),
      // switch exhaustivo sobre la clase sellada: sin default.
      body: switch (_estado) {
        Cargando() => const Center(child: CircularProgressIndicator()),
        Exito(datos: final clientes) => ListView.builder(
          itemCount: clientes.length,
          itemBuilder: (context, i) {
            final c = clientes[i];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: ListTile(
                leading: CircleAvatar(child: Text(c.nombre[0])),
                title: Text(c.nombre),
                subtitle: Text('${c.correo}\n${c.telefono}'),
                isThreeLine: true,
                trailing: Text(c.activo ? 'Activo' : 'Inactivo'),
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
                const Icon(Icons.wifi_off, size: 48),
                const SizedBox(height: 12),
                Text(mensaje, textAlign: TextAlign.center),
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
