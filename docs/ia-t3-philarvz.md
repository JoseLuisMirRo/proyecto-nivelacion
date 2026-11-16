# Declaración de uso de IA · Nivelación T3 · Lista con tres estados

Alumno: Erick Mireles · Matrícula: 20233tn070 · Usuario GitHub: @philarvz · Rama: `feat/lista-tres-estados-philarvz`

## Herramienta

Claude Code (Claude Opus 4.7) en modo agente, en mi computadora. La herramienta sí generó código: preparó el esqueleto de los archivos (`resultado.dart`, `pedido.dart`, `repositorio_pedidos_falso.dart`, `pantalla_pedidos.dart`, `main.dart`) y organizó los commits incrementales.

## Prompts principales

| # | Lo que le pedí |
|---|---|
| 1 | Analizar el documento `nivelacion-t3-lista-tres-estados (1).docx` y respetar sus instrucciones (rama, 3 estados, switch exhaustivo sin `default`, reintento, ≥ 3 commits convencionales). |
| 2 | Portar mi `Resultado<T>` de la T1, definir la entidad `Pedido` del gestor de cafetería, hacer un repositorio falso que falle la primera llamada y devuelva 6 pedidos la segunda, y armar la pantalla con `switch` exhaustivo sobre `Resultado<List<Pedido>>`. |
| 3 | Confirmar que el reparto del equipo (tabla «¿Qué cambios son individuales y cuáles compartidos?») permite que `Resultado<T>` sea compartido y que entidad/repo/pantalla sean individuales — por eso elegí `Pedido` como entidad propia distinta a la de José Luis (`Producto`). |

## Qué acepté

- `lib/resultado.dart`: `sealed class Resultado<T>` con `Cargando`, `Exito`, `Error`. Portado tal cual de mi T1.
- `lib/pedido.dart`: entidad `Pedido` con `id`, `productoId`, `cliente`, `producto`, `estado`.
- `lib/repositorio_pedidos_falso.dart`: espera de 2 s, lanza `Exception('Sin conexion con el servicio de pedidos')` la primera vez, devuelve 6 pedidos la segunda.
- `lib/pantalla_pedidos.dart`: `StatefulWidget` con `switch` exhaustivo sin `default`, mensaje legible sin texto de excepción, botón **Reintentar** que vuelve a llamar `_cargar()`.
- `lib/main.dart`: `home: PantallaPedidos(repositorio: RepositorioPedidosFalso())`.

## Qué cambié o rechacé

- El `main.dart` original del equipo tenía `.fromSeed(...)` y `mainAxisAlignment: .center` sin la clase delante (parecía copia incompleta de `flutter create`); lo reemplacé por un `main` limpio que monta mi pantalla.
- Decidí nombrar los archivos de evidencia y la declaración de IA con sufijo `-philarvz` (`docs/evidencia-t3-philarvz/` y `docs/ia-t3-philarvz.md`) para no pisar los archivos que el otro integrante del equipo ya subió en su propia rama.
- Mi rama se llama `feat/lista-tres-estados-philarvz` en lugar de `feat/lista-tres-estados` (que ya la tomó José Luis) para respetar la convención del equipo de que cada integrante entrega su propia pantalla.

## Cómo lo probé

- Revisé que la primera llamada al repositorio lance excepción y que el botón **Reintentar** logre pasar al estado `Exito` con 6 pedidos.
- Capturas de los tres estados en `docs/evidencia-t3-philarvz/` (`1-cargando.png`, `2-error.png`, `3-lista.png`).
- El `switch` sobre `Resultado` no lleva `default`: como `Resultado<T>` es `sealed`, el analizador verifica que las tres ramas (`Cargando`, `Exito`, `Error`) estén cubiertas.

## Qué sé defender si me preguntan

- **Por qué el `switch` no necesita `default`:** `Resultado<T>` es `sealed`, el analizador conoce las tres subclases y marca el `switch` como exhaustivo. Si mañana aparece una cuarta subclase, el compilador me obliga a actualizar el `switch`.
- **Para qué sirve `mounted` después de un `await`:** entre que empieza el `await` del repositorio y que termina, el usuario pudo cerrar la pantalla. `if (!mounted) return;` evita llamar `setState` sobre un `State` desmontado y que Flutter arroje un error.
- **Ciclo `setState → build`:** `setState` marca el `State` como *dirty* y encola un rebuild; Flutter llama a `build` en el siguiente frame con el nuevo `_estado` y el `switch` elige qué widget pintar.

## Defensa oral

Debo poder explicar cada línea de este código. Código que no pueda explicar se considera no entregado.
