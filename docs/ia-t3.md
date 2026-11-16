# Declaración de uso de IA · Nivelación T3 · Lista con tres estados

Alumno: José Luis Miranda Roldán · Matrícula: 20233tn052 · Rama: `feat/lista-tres-estados`

## Herramienta

Claude Sonnet 5.5 usado a través de **Claude Code** (modo agente, en mi computadora). En esta tarea la herramienta **sí generó código**: preparó los archivos de la pantalla, la prueba y los commits, y organizó el repositorio. No fue solo una consulta en chat como tutor.

## Prompts principales

| # | Lo que le pedí |
|---|---|
| 1 | Preparar la Nivelación T3: `Resultado<T>` (Cargando, Exito, Error), una entidad, un repositorio falso que falla la primera vez y una pantalla con `switch` exhaustivo, con reintento. |
| 2 | Crear el repositorio del equipo y subir mi pantalla en la rama `feat/lista-tres-estados`, con al menos 3 commits convencionales desde mi cuenta. |

## Qué acepté

- `resultado.dart` (clase sellada con `Cargando`, `Exito`, `Error`) y `producto.dart` (entidad de la cafetería).
- `repositorio_falso.dart`: espera de 2 s, 6 productos y falla la primera llamada.
- `lista_productos_screen.dart`: `StatefulWidget` con `switch` exhaustivo, sin `default`, y mensaje de error legible con botón «Reintentar».

## Qué cambié o rechacé

- Se ajustaron los imports al paquete `integradora_mobile` del monorepo.
- Se **quitó** de la prueba la comparación con capturas (`matchesGoldenFile`) y la ruta absoluta a las fuentes de mi computadora, porque hacían fallar `flutter test` en otras máquinas. Las capturas quedan como evidencia en `docs/evidencia-t3/`.
- Se borró la prueba de ejemplo del contador que trae `flutter create`.
- Lo que revisé o cambié yo: COMPLETAR.

## Cómo lo probé

- `flutter analyze`: sin problemas.
- `flutter test`: una prueba de widgets que recorre cargando, error legible sin texto de excepción, reintento y lista con al menos 5 tarjetas.
- Capturas de los tres estados en `docs/evidencia-t3/` (`1-cargando.png`, `2-error.png`, `3-lista.png`).

## Marcas `// IA:`

Los archivos Dart de esta tarea (`resultado.dart`, `producto.dart`, `repositorio_falso.dart`, `lista_productos_screen.dart`, `main.dart` y la prueba) llevan la marca `// IA:` en su primera línea.

## Defensa oral

Debo poder explicar cada línea de este código. Código que no pueda explicar se considera no entregado.
