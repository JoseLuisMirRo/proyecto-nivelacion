// IA: archivo preparado con ayuda de Claude Code (Claude Sonnet 5.5).
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integradora_mobile/pagos/lista_pagos_screen.dart';
import 'package:integradora_mobile/pagos/repositorio_falso.dart';

void main() {
  testWidgets('cargando, error con reintento y lista', (tester) async {
    final repositorio = RepositorioFalso(
      espera: const Duration(milliseconds: 100),
    );
    await tester.pumpWidget(
      MaterialApp(home: ListaPagosScreen(repositorio: repositorio)),
    );

    // 1. Al abrir: cargando.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // 2. La primera llamada falla: mensaje legible y botón Reintentar.
    await tester.pump(const Duration(milliseconds: 150));
    expect(find.byType(CircularProgressIndicator), findsNothing);
    expect(find.textContaining('No pudimos cargar'), findsOneWidget);
    expect(find.textContaining('Exception'), findsNothing);
    expect(find.text('Reintentar'), findsOneWidget);

    // 3. Al reintentar vuelve a cargar y llega a la lista.
    await tester.tap(find.text('Reintentar'));
    await tester.pump();
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pump(const Duration(milliseconds: 150));
    expect(find.byType(Card), findsWidgets);
    expect(find.text('P-01 · Efectivo'), findsOneWidget);
    expect(find.text('Reintentar'), findsNothing);
  });
}
