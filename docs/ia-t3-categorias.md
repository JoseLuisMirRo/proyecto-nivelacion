# Declaración de uso de IA · Nivelación T3 · Lista con tres estados (Categorías)

Alumna: AlexandraHernandez16 · Rama: `feat/lista-tres-estados-alexandrahernandez16` · Entidad: **Categoría**

## Herramienta

Claude Code (modelo Claude Sonnet 5.5), dentro de VS Code. Nivel 2 de la política de IA: herramienta declarada.

## Prompt principal

Pedí implementar la T3 solo para la entidad Categoría, reutilizando `Resultado<T>`, con repositorio falso (primera llamada falla, segunda funciona), pantalla `StatefulWidget` con `switch` exhaustivo, `mounted` después del `await`, capturas reales del emulador y esta declaración.

## Qué generó la herramienta (marcado con `// IA:`)

| Archivo | Contenido |
|---|---|
| `apps/mobile/lib/resultado.dart` | `Resultado<T>` sellado: `Cargando`, `Exito`, `Error` |
| `apps/mobile/lib/categoria.dart` | Entidad `Categoria` (nombre, descripción, totalProductos) |
| `apps/mobile/lib/repositorio_categorias_falso.dart` | Repositorio con `Future.delayed` de 2 s, 6 categorías y fallo en la 1.ª llamada |
| `apps/mobile/lib/pantalla_categorias.dart` | Pantalla con los tres estados y botón Reintentar |
| `apps/mobile/test/categorias_tres_estados_test.dart` | Prueba de widget: cargando → error → reintentar → lista |

## Qué se cambió o adaptó

- Se tomó el dominio (cafetería) y la estructura de archivos de las ramas de mis compañeros para mantener coherencia, sin copiar ni modificar su trabajo.
- `main.dart` ahora muestra `PantallaCategorias` en lugar de la plantilla del contador.
- Se eliminó `test/widget_test.dart` (prueba del contador) porque dejó de aplicar al cambiar `main.dart`.
- El repositorio recibe la espera por parámetro (`espera`, 2 s por defecto) para que la prueba automática no tarde.
- El mensaje de error es legible en español y no muestra la excepción.

## Cómo se probó

1. `flutter analyze`: sin problemas.
2. `flutter test`: la prueba de widget pasa (cargando → error → reintentar → lista).
3. En el emulador Pixel 7 Pro con un APK debug:
   - Al abrir la app se muestra el spinner y, a los 2 s, falla la primera llamada y aparece el error.
   - Se toca **Reintentar**: vuelve el spinner y, a los 2 s, aparece la lista de 6 tarjetas.
4. Las capturas están en `docs/evidencias/t3/categorias/`:
   - `evidencia-categorias-cargando.png`
   - `evidencia-categorias-error.png`
   - `evidencia-categorias-exito.png`

## Para la defensa oral

- `Resultado` es sellado: el compilador sabe que solo hay 3 subtipos, por eso el `switch` es exhaustivo y no necesita `default`.
- `setState` marca el estado como modificado y Flutter vuelve a llamar a `build`.
- `if (!mounted) return;` evita llamar a `setState` si la pantalla se cerró mientras esperaba el `await`.
