// IA: archivo preparado con ayuda de Claude Code (Claude Opus 5.5); revisado y probado por el autor.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integradora_mobile/lista_clientes_screen.dart';
import 'package:integradora_mobile/repositorio_clientes_falso.dart';

void main() {
  testWidgets('clientes: cargando -> error -> reintentar -> lista', (t) async {
    await t.pumpWidget(MaterialApp(
      home: ListaClientesScreen(repositorio: RepositorioClientesFalso()),
    ));

    // 1) Cargando
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // 2) Error legible (la primera llamada falla), sin texto de excepción
    await t.pump(const Duration(seconds: 3));
    expect(find.text('Reintentar'), findsOneWidget);
    expect(find.textContaining('No pudimos cargar los clientes'), findsOneWidget);
    expect(find.textContaining('Exception'), findsNothing);

    // 3) Reintentar -> cargando -> lista con al menos 5 tarjetas
    await t.tap(find.text('Reintentar'));
    await t.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await t.pump(const Duration(seconds: 3));
    expect(find.byType(Card), findsAtLeastNWidgets(5));
    expect(find.text('María Fernanda López'), findsOneWidget);
  });
}
