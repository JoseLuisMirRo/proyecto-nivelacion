# Declaración de uso de IA · Nivelación T3 · Lista de clientes con tres estados

Rama: `feat/lista-clientes-tres-estados` · Entidad: `Cliente`

## Herramienta

**Claude Code** (modelo Claude Opus 5.5), en modo agente en mi computadora. La herramienta **sí generó código**: escribió los archivos Dart, la prueba de widgets, hizo los commits y tomó las capturas con ADB en el emulador.

## Prompts principales

| # | Lo que le pedí |
|---|---|
| 1 | Implementar la T3 solo para la entidad `Cliente`: `Resultado<T>`, repositorio falso (1–2 s, ≥ 5 clientes, falla la 1.ª llamada y funciona la 2.ª), pantalla `StatefulWidget` con `switch` exhaustivo sin `default`, y `mounted` después de cada `await`. |
| 2 | Trabajar en la rama `feat/lista-clientes-tres-estados` con ≥ 3 commits convencionales, sin merge ni push y sin tocar el trabajo de otros integrantes. |
| 3 | Tomar capturas reales de los tres estados en el emulador y crear esta declaración. |

## Código generado por IA

Todos llevan la marca `// IA:` en su primera línea:

- `apps/mobile/lib/resultado.dart`: clase sellada `Resultado<T>` con `Cargando`, `Exito(datos)` y `Error(mensaje)` (mismos nombres que la T1 y que usan mis compañeros).
- `apps/mobile/lib/cliente.dart`: entidad `Cliente` (nombre, correo, teléfono, activo).
- `apps/mobile/lib/repositorio_clientes_falso.dart`: `Future<List<Cliente>>` con `Future.delayed` de 2 s y 6 clientes; la primera llamada lanza una excepción.
- `apps/mobile/lib/lista_clientes_screen.dart`: pantalla con los tres estados y el botón **Reintentar**.
- `apps/mobile/lib/main.dart`: abre la pantalla de clientes (reemplaza el contador de ejemplo).
- `apps/mobile/test/lista_clientes_test.dart`: prueba de widgets del flujo completo.

## Qué acepté, cambié o rechacé

- Acepté la estructura que ya usaba el equipo en sus ramas (archivos sueltos en `lib/`, `Resultado` con `Exito(datos)` y `Error(mensaje)`) para que sea coherente.
- El repositorio falso y la pantalla se renombraron para Clientes (`RepositorioClientesFalso`, `ListaClientesScreen`) para no chocar con los archivos de otros integrantes.
- El mensaje de error es fijo y en español; la excepción (`Sin conexión`) **no** se muestra al usuario.
- Se borró la prueba de ejemplo del contador (`test/widget_test.dart`) porque el contador ya no existe en `main.dart`.

## Cómo lo probé

- `flutter analyze`: **No issues found!**
- `flutter test`: 1 prueba, **pasa**. Recorre cargando → error legible (sin la palabra `Exception`) → Reintentar → cargando → lista con al menos 5 tarjetas.
- Prueba manual en el emulador Android **Pixel_7** (APK debug instalado con `adb`):
  1. Al abrir se ve el `CircularProgressIndicator`.
  2. A los 2 s aparece el mensaje de error con el botón **Reintentar**.
  3. Al tocar **Reintentar** vuelve a cargar y después se ve la lista con 6 tarjetas (nombre, correo, teléfono y estado).

## Evidencias

En `docs/evidencias/t3/clientes/`, capturadas con `adb exec-out screencap` en la misma ejecución:

- `evidencia-clientes-cargando.png`: estado Cargando (capturado justo después de tocar Reintentar).
- `evidencia-clientes-error.png`: estado Error con el botón Reintentar.
- `evidencia-clientes-exito.png`: estado Éxito con la lista de clientes.

## Para la defensa oral

- **¿Por qué el `switch` no necesita `default`?** Porque `Resultado` es `sealed`: el compilador conoce todas sus subclases (`Cargando`, `Exito`, `Error`) y comprueba que el `switch` las cubra. Si se agrega un estado nuevo, el código deja de compilar hasta manejarlo.
- **`setState` → `build`:** `setState` cambia `_estado` y marca el widget para reconstruirse; Flutter vuelve a llamar a `build`, que pinta el estado nuevo.
- **`mounted`:** después del `await` (2 s) la pantalla pudo cerrarse; si `mounted` es `false`, llamar a `setState` lanzaría un error, por eso se sale con `return`.
