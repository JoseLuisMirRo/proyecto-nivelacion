
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:integradora_mobile/repositorio_resenas.dart';
import 'package:integradora_mobile/resenas_screen.dart';

void main() {
  testWidgets('Muestra error y permite reintentar hasta cargar reseñas',
      (tester) async {
    final repositorio = RepositorioResenas();

    await tester.pumpWidget(
      MaterialApp(
        home: ResenasScreen(repositorio: repositorio),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();

    expect(
      find.textContaining('No pudimos cargar las reseñas'),
      findsOneWidget,
    );

    await tester.tap(find.text('Reintentar'));
    await tester.pump();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pump();

    expect(find.text('Ana López'), findsOneWidget);
    expect(find.text('Carlos Pérez'), findsOneWidget);
    expect(find.text('María García'), findsOneWidget);
    expect(find.text('Luis Hernández'), findsOneWidget);

    expect(
      find.text('Excelente café y muy buen servicio.'),
      findsOneWidget,
    );
  });
}