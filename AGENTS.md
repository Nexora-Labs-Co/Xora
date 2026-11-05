# AGENTS.md

## Tipo de repositorio
- Kit de UI en Flutter llamado `xora` (sistema de diseño de Nexora). El paquete vive en la raíz del repositorio; la app de ejemplo aislada está en `example/`.

## Comandos
- Paquete: `flutter pub get && flutter analyze && flutter test`
- Ejemplo: `cd example && flutter pub get && flutter analyze && flutter test`
- Ejecutar showcase: `cd example && flutter run -d chrome` (o `flutter build web --no-tree-shake-icons`)

## Estructura
- Exportación principal: `lib/xora.dart`
- Tokens de diseño: `lib/src/theme/` (`XoraColors`, `XoraSpacing`, `XoraRadius`, `XoraTypography`, `XoraShadows`, `XoraTheme`)
- Componentes: `lib/src/components/{buttons,inputs,surfaces,feedback,data_display}/`
- Entradas de tema: `XoraTheme.light()` / `XoraTheme.dark()`
- Diseño: primario `#A50021`, fondo `#EBF5EE`, primer plano `#090C02`; fuentes Google Sans (UI) / Gliker (logos); iconos FontAwesome (`XoraIcons`); layouts responsivos Nexo (escritorio), One (móvil), Slate (tableta)

## Convenciones
- Ramas: `feat/...`, `fix/...`, `docs/...`, `refactor/...`
- Commits: Conventional Commits (p. ej. `feat(ui): ...`)
- Los cambios grandes requieren un Issue primero; los PR van a `main`.

## Gobernanza
- Licencia: PolyForm Noncommercial 1.0.0; el nombre/logotipo/marcas de "Nexora" requieren permiso por escrito.
- Seguridad: seguir el flujo de reporte de SECURITY.md; sin divulgación pública.

## Verificación
- Ejecutar `flutter analyze` + `flutter test` tanto en el paquete raíz como en `example` antes de terminar. No hay lint/typecheck más allá de `flutter analyze`.