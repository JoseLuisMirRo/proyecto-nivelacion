import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integradora_mobile/pantalla_categorias.dart';
import 'package:integradora_mobile/repositorio_categorias_falso.dart';

// IA: bloque generado con Claude Code (prueba de los tres estados y reintento).
void main() {
  testWidgets('cargando -> error -> reintentar -> lista', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: PantallaCategorias(
          repositorio: RepositorioCategoriasFalso(
            espera: const Duration(milliseconds: 100),
          ),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 150));
    expect(find.text('Reintentar'), findsOneWidget);
    expect(find.textContaining('No pudimos cargar'), findsOneWidget);
    expect(find.textContaining('Exception'), findsNothing);

    await tester.tap(find.text('Reintentar'));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(milliseconds: 150));
    expect(find.byType(Card), findsWidgets);
    expect(find.text('Postres'), findsOneWidget);
  });
}
