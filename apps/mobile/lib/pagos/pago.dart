// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5).
// Entidad de gestor_cafeteria, el proyecto de mi equipo.
// Los datos de ejemplo no son reales.

class Pago {
  const Pago({
    required this.folio,
    required this.pedido,
    required this.metodo,
    required this.monto,
    this.referencia,
  });

  final String folio;

  // Código del pedido que se está pagando (por ejemplo «A-01»).
  final String pedido;

  // «Efectivo», «Tarjeta» o «Transferencia».
  final String metodo;

  // Importe en pesos.
  final double monto;

  // Solo existe en pagos con tarjeta o transferencia; en efectivo es null.
  final String? referencia;
}
