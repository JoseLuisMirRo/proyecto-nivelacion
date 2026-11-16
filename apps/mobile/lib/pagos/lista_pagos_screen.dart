// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5).
import 'package:flutter/material.dart';

import 'pago.dart';
import 'repositorio_falso.dart';
import 'resultado.dart';

class ListaPagosScreen extends StatefulWidget {
  const ListaPagosScreen({super.key, required this.repositorio});

  final RepositorioFalso repositorio;

  @override
  State<ListaPagosScreen> createState() => _ListaPagosScreenState();
}

class _ListaPagosScreenState extends State<ListaPagosScreen> {
  // El estado de la pantalla empieza en Cargando.
  Resultado<List<Pago>> _estado = const Cargando();

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    // Al reintentar, se vuelve a mostrar el indicador de carga.
    setState(() => _estado = const Cargando());
    try {
      final pagos = await widget.repositorio.obtener();
      // Si la pantalla se cerró mientras esperábamos, no se llama a setState.
      if (!mounted) return;
      setState(() => _estado = Exito(pagos));
    } catch (_) {
      if (!mounted) return;
      // Mensaje en español; no se muestra el texto de la excepción.
      setState(
        () => _estado = const Error(
          'No pudimos cargar los pagos. Revisa tu conexión e inténtalo '
          'de nuevo.',
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pagos de la cafetería')),
      // switch exhaustivo: sin default, porque Resultado es sealed.
      body: switch (_estado) {
        Cargando() => const Center(child: CircularProgressIndicator()),
        Exito(datos: final pagos) => ListView.builder(
          itemCount: pagos.length,
          itemBuilder: (context, i) {
            final pago = pagos[i];
            return Card(
              child: ListTile(
                title: Text('${pago.folio} · ${pago.metodo}'),
                subtitle: Text(
                  'Pedido ${pago.pedido}'
                  '${pago.referencia != null ? ' · ${pago.referencia}' : ''}',
                ),
                trailing: Text('\$${pago.monto.toStringAsFixed(2)}'),
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
