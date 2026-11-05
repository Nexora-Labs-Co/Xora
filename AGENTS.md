# AGENTS.md

## Repo type
- Flutter UI kit named `xora` (Nexora design system). Package lives at repo root; isolated showcase app in `example/`.

## Commands
- Package: `flutter pub get && flutter analyze && flutter test`
- Example: `cd example && flutter pub get && flutter analyze && flutter test`
- Run showcase: `cd example && flutter run -d chrome` (or `flutter build web`)

## Structure
- Barrel export: `lib/xora.dart`
- Design tokens: `lib/src/theme/` (`XoraColors`, `XoraSpacing`, `XoraRadius`, `XoraTypography`, `XoraShadows`, `XoraTheme`)
- Components: `lib/src/components/{buttons,inputs,surfaces,feedback,data_display}/`
- Theme entrypoints: `XoraTheme.light()` / `XoraTheme.dark()`
- Design: primary `#A50021`, background `#EBF5EE`, foreground `#090C02`; fonts Google Sans (UI) / Gliker (logos); icons FontAwesome (`XoraIcons`); responsive layouts Nexo (desktop), One (mobile), Slate (tablet)

## Conventions
- Branches: `feat/...`, `fix/...`, `docs/...`, `refactor/...`
- Commits: Conventional Commits (e.g. `feat(ui): ...`)
- Major changes need an Issue first; PRs target `main`.

## Governance
- License: PolyForm Noncommercial 1.0.0; "Nexora" name/logo/trademarks require written permission.
- Security: follow SECURITY.md reporting flow; no public disclosure.

## Verification
- Run `flutter analyze` + `flutter test` for both root package and `example` before finishing. No lint/typecheck beyond `flutter analyze`.