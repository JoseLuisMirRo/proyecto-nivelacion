// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5).
import 'pago.dart';

// Repositorio falso: simula pedir los pagos a un servidor.
// Espera, falla la primera vez y funciona desde la segunda.
class RepositorioFalso {
  // La espera se puede cambiar para que las pruebas no tarden.
  RepositorioFalso({this.espera = const Duration(seconds: 2)});

  final Duration espera;
  int _llamadas = 0;

  Future<List<Pago>> obtener() async {
    await Future.delayed(espera);
    _llamadas++;
    if (_llamadas == 1) throw Exception('Sin conexión'); // falla la 1a vez
    return const [
      Pago(folio: 'P-01', pedido: 'A-01', metodo: 'Efectivo', monto: 45),
      Pago(
        folio: 'P-02',
        pedido: 'A-02',
        metodo: 'Tarjeta',
        monto: 30,
        referencia: 'TC-4821',
      ),
      Pago(
        folio: 'P-03',
        pedido: 'A-03',
        metodo: 'Transferencia',
        monto: 58,
        referencia: 'TR-1093',
      ),
      Pago(folio: 'P-04', pedido: 'A-04', metodo: 'Efectivo', monto: 48),
      Pago(
        folio: 'P-05',
        pedido: 'A-05',
        metodo: 'Tarjeta',
        monto: 35,
        referencia: 'TC-7715',
      ),
      Pago(folio: 'P-06', pedido: 'A-06', metodo: 'Efectivo', monto: 28),
    ];
  }
}
