# Declaración de uso de IA · Nivelación T3 · Lista con tres estados

Alumna: Danna Paola Sánchez Martínez · Matrícula: 20213tn039 · Rama: `feat/lista-tres-estados-danna`

## Herramienta

Claude Sonnet 5.5 usado a través de **Claude Code** (modo agente) en la computadora de mi compañero José Luis Miranda Roldán. En esta tarea la herramienta **sí generó el código**: escribió los archivos de la pantalla, la prueba, las capturas y los commits. No fue solo una consulta como tutor.

## Cómo se pidió

El trabajo se pidió desde la sesión de Claude Code de José Luis, con mi autorización, que él comunicó. Yo no escribí los prompts. Se pidió preparar la Nivelación T3 para mí: `Resultado<T>`, una entidad de la cafetería (`Pago`), un repositorio falso que falla la primera vez y una pantalla con `switch` exhaustivo y reintento, en una rama aparte para no pisar la de él.

## Qué generó la herramienta

- `resultado.dart`, `pago.dart`, `repositorio_falso.dart` y `lista_pagos_screen.dart` (en `apps/mobile/lib/pagos/`).
- `main_pagos.dart`, un punto de entrada aparte para no modificar `main.dart`: `flutter run -t lib/main_pagos.dart`.
- La prueba `pagos_tres_estados_test.dart`, las capturas y los commits.

## Lo que revisé o cambié yo

- Hasta este commit **no he modificado** el código que generó la herramienta; lo recibí como está.
- Di mi visto bueno para que se preparara y se publicara en mi rama.
- Antes de la defensa oral voy a leer cada archivo, correr `flutter test` y practicar los cambios en vivo, y lo que cambie lo agregaré en commits míos.

## Cómo se probó

- `flutter analyze`: sin problemas.
- `flutter test`: pasa la prueba de widgets, que recorre cargando, error legible sin texto de excepción, reintento y lista con 6 tarjetas.
- Capturas de los tres estados en `docs/evidencia-t3-danna/`, tomadas de la app compilada para web a 412×800.

## Marcas `// IA:`

Todos los archivos Dart de esta tarea llevan la marca `// IA:` en su primera línea.

## Defensa oral

Debo poder explicar cada línea de este código y modificarlo en vivo. Código que no pueda explicar se considera no entregado.
