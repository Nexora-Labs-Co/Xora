import 'package:flutter/material.dart';
import 'package:xora/xora.dart';

void main() {
  runApp(const XoraShowcaseApp());
}

class XoraShowcaseApp extends StatefulWidget {
  const XoraShowcaseApp({super.key});

  @override
  State<XoraShowcaseApp> createState() => _XoraShowcaseAppState();
}

class _XoraShowcaseAppState extends State<XoraShowcaseApp> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xora Showcase',
      debugShowCheckedModeBanner: false,
      theme: XoraTheme.light(),
      darkTheme: XoraTheme.dark(),
      themeMode: _dark ? ThemeMode.dark : ThemeMode.light,
      home: ShowcaseHome(
        dark: _dark,
        onToggleTheme: () => setState(() => _dark = !_dark),
      ),
    );
  }
}

class ShowcaseHome extends StatefulWidget {
  const ShowcaseHome({
    super.key,
    required this.dark,
    required this.onToggleTheme,
  });

  final bool dark;
  final VoidCallback onToggleTheme;

  @override
  State<ShowcaseHome> createState() => _ShowcaseHomeState();
}

class _ShowcaseHomeState extends State<ShowcaseHome> {
  int _index = 0;
  String _userName = 'Usuario';
  String? _avatarPath;

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      FoundationsPage(onToggleTheme: widget.onToggleTheme, dark: widget.dark),
      const ComponentsPage(),
      const FormsPage(),
      const FeedbackPage(),
    ];
    return Scaffold(
      body: XoraResponsive(
        mobile: XoraOne(
          topBar: OneTopBar(appName: 'Xora', avatar: _avatarPath == null ? XoraAvatar(initials: _userName) : null, accountAvatarPath: _avatarPath, accountName: _userName, accountStatus: 'Premium', accountInitials: _userName, onToggleTheme: widget.onToggleTheme, isDark: widget.dark, onProfileChanged: (name, path) => setState(() { _userName = name; _avatarPath = path; }),),
          bottomBar: OneBottomBar(
            selectedIndex: _index,
            onTap: (i) => setState(() => _index = i),
            items: const [
              OneBottomBarItem(
                icon: XoraIcon(XoraIcons.palette),
                label: 'Inicio',
              ),
              OneBottomBarItem(
                icon: XoraIcon(XoraIcons.squaresFour),
                label: 'Componentes',
              ),
              OneBottomBarItem(
                icon: XoraIcon(XoraIcons.notePencil),
                label: 'Formularios',
              ),
              OneBottomBarItem(
                icon: XoraIcon(XoraIcons.bell),
                label: 'Notificaciones',
              ),
            ],
          ),
          child: pages[_index],
        ),
        tablet: XoraSlate(child: pages[_index]),
        desktop: XoraNexo(
          appName: 'Xora',
          sidebarSections: [
            NexoSidebarSection(
              title: 'Menú',
              items: [
                NexoSidebarItem(
                  label: 'Inicio',
                  icon: XoraIcons.palette,
                  onTap: () => setState(() => _index = 0),
                ),
                NexoSidebarItem(
                  label: 'Fundamentos',
                  icon: XoraIcons.squaresFour,
                  onTap: () => setState(() => _index = 1),
                ),
                NexoSidebarItem(
                  label: 'Componentes',
                  icon: XoraIcons.notePencil,
                  onTap: () => setState(() => _index = 2),
                ),
                NexoSidebarItem(
                  label: 'Formularios',
                  icon: XoraIcons.bell,
                  onTap: () => setState(() => _index = 3),
                ),
              ],
            ),
            NexoSidebarSection(
              title: 'Favoritos',
              items: [
                NexoSidebarItem(
                  label: 'Colores',
                  icon: XoraIcons.palette,
                  onTap: () => setState(() => _index = 0),
                ),
                NexoSidebarItem(
                  label: 'Tipografía',
                  icon: XoraIcons.notePencil,
                  onTap: () => setState(() => _index = 1),
                ),
              ],
            ),
            NexoSidebarSection(
              title: 'Etiquetas',
              items: [
                NexoSidebarItem(
                  label: 'Primario',
                  icon: XoraIcons.squaresFour,
                  onTap: () => setState(() => _index = 2),
                ),
                NexoSidebarItem(
                  label: 'Secundario',
                  icon: XoraIcons.bell,
                  onTap: () => setState(() => _index = 3),
                ),
              ],
            ),
          ],
          userName: 'Usuario',
          userStatus: 'Premium',
          userInitials: 'U',
          rightPanel: XoraCard(
            child: Text('Panel de contexto para la página ${_index + 1}'),
          ),
          appVersion: 'v0.1.0',
          onToggleTheme: widget.onToggleTheme,
          isDark: widget.dark,
          child: pages[_index],
        ),
      ),
    );
  }
}

class FoundationsPage extends StatelessWidget {
  const FoundationsPage({
    super.key,
    required this.onToggleTheme,
    required this.dark,
  });

  final VoidCallback onToggleTheme;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Colores', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _colorChip('Primary', XoraColors.primary),
            _colorChip('Secondary', XoraColors.secondary),
            _colorChip('Accent', XoraColors.accent),
            _colorChip('Success', XoraColors.success),
            _colorChip('Warning', XoraColors.warning),
            _colorChip('Danger', XoraColors.danger),
            _colorChip('Info', XoraColors.info),
          ],
        ),
        const SizedBox(height: 24),
        Text('Tipografía', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Text(
          'Display',
          style: XoraTypography.display.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Headline',
          style: XoraTypography.headline.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Title',
          style: XoraTypography.title.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Subtitle',
          style: XoraTypography.subtitle.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Body',
          style: XoraTypography.body.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Body small',
          style: XoraTypography.bodySmall.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Label',
          style: XoraTypography.label.copyWith(color: scheme.onSurface),
        ),
        Text(
          'Caption',
          style: XoraTypography.caption.copyWith(color: scheme.onSurface),
        ),
        const SizedBox(height: 24),
        Text(
          'Espaciado y radios',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        XoraCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contenido de tarjeta con padding ${XoraSpacing.lg}'),
              const SizedBox(height: 8),
              Container(
                height: 8,
                width: XoraSpacing.xxxl * 2,
                decoration: BoxDecoration(
                  color: scheme.primary,
                  borderRadius: BorderRadius.circular(XoraRadius.md),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _colorChip(String name, Color color) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(XoraRadius.md),
          ),
        ),
        const SizedBox(height: 4),
        Text(name, style: const TextStyle(fontSize: 11)),
      ],
    );
  }
}

class ComponentsPage extends StatelessWidget {
  const ComponentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text('Botones', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            XoraButton(label: 'Primario'),
            XoraButton(
              label: 'Secondary',
              variant: XoraButtonVariant.secondary,
            ),
            XoraButton(label: 'Contorno', variant: XoraButtonVariant.outline),
            XoraButton(label: 'Fantasma', variant: XoraButtonVariant.ghost),
            XoraButton(label: 'Peligro', variant: XoraButtonVariant.danger),
          ],
        ),
        const SizedBox(height: 8),
        const XoraButton(label: 'Ancho completo', fullWidth: true),
        const SizedBox(height: 8),
        const XoraButton(label: 'Cargando', loading: true),
        const SizedBox(height: 8),
        XoraButton(label: "With icon", icon: XoraIcon(XoraIcons.plus)),
        const SizedBox(height: 24),
        Text('Insignias', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            XoraBadge(label: 'Neutral'),
            XoraBadge(label: 'Primary', variant: XoraBadgeVariant.primary),
            XoraBadge(label: 'Success', variant: XoraBadgeVariant.success),
            XoraBadge(label: 'Warning', variant: XoraBadgeVariant.warning),
            XoraBadge(label: 'Danger', variant: XoraBadgeVariant.danger),
            XoraBadge(label: 'Info', variant: XoraBadgeVariant.info),
          ],
        ),
        const SizedBox(height: 24),
        Text('Avatares', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        const Row(
          children: [
            XoraAvatar(initials: 'AB'),
            SizedBox(width: 8),
            XoraAvatar(initials: 'CD', backgroundColor: XoraColors.secondary),
            SizedBox(width: 8),
            XoraAvatar(initials: 'EF', size: 56),
          ],
        ),
        const SizedBox(height: 24),
        Text('Listas', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        XoraCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              XoraListTile(
                leading: XoraAvatar(initials: 'JD'),
                title: Text('Ana García'),
                subtitle: Text('Diseñadora de producto'),
                trailing: XoraIcon(XoraIcons.caretRight),
              ),
              XoraDivider(indent: 72),
              XoraListTile(
                leading: XoraAvatar(initials: 'MK'),
                title: Text('Marcos Kent'),
                subtitle: Text('Ingeniero'),
                trailing: XoraIcon(XoraIcons.caretRight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class FormsPage extends StatefulWidget {
  const FormsPage({super.key});

  @override
  State<FormsPage> createState() => _FormsPageState();
}

class _FormsPageState extends State<FormsPage> {
  final _name = TextEditingController();
  final _email = TextEditingController();
  bool _notifications = true;
  bool _terms = false;
  String? _emailError;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        XoraTextField(
          controller: _name,
          label: 'Nombre',
          hint: 'Your full name',
        ),
        const SizedBox(height: 16),
        XoraTextField(
          controller: _email,
          label: 'Correo',
          hint: 'tu@nexora.dev',
          keyboardType: TextInputType.emailAddress,
          errorText: _emailError,
          prefixIcon: XoraIcon(XoraIcons.envelopeSimple),
        ),
        const SizedBox(height: 16),
        XoraSwitch(
          value: _notifications,
          onChanged: (v) => setState(() => _notifications = v),
          label: 'Notificaciones',
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _terms,
              onChanged: (v) => setState(() => _terms = v ?? false),
            ),
            const Text('Aceptar términos'),
          ],
        ),
        const SizedBox(height: 24),
        XoraButton(
          label: 'Enviar',
          fullWidth: true,
          onPressed: () {
            setState(() {
              _emailError = _email.text.contains('@')
                  ? null
                  : 'Correo inválido';
            });
            if (_emailError == null) {
              XoraSnackbar.show(
                context,
                message: 'Submitted successfully',
                type: XoraSnackbarType.success,
              );
            }
          },
        ),
      ],
    );
  }
}

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        XoraButton(
          label: 'Mostrar éxito',
          onPressed: () => XoraSnackbar.show(
            context,
            message: 'Operation completed',
            type: XoraSnackbarType.success,
          ),
        ),
        const SizedBox(height: 8),
        XoraButton(
          label: 'Mostrar error',
          variant: XoraButtonVariant.danger,
          onPressed: () => XoraSnackbar.show(
            context,
            message: 'Something went wrong',
            type: XoraSnackbarType.error,
          ),
        ),
        const SizedBox(height: 24),
        XoraEmptyState(
          icon: XoraIcon(XoraIcons.tray),
          title: 'Sin elementos',
          subtitle: 'Crea tu primer elemento para comenzar.',
        ),
        const SizedBox(height: 24),
        Center(child: XoraLoading(size: 32)),
        const SizedBox(height: 24),
        XoraCard(
          child: XoraEmptyState(
            icon: XoraIcon(XoraIcons.magnifyingGlassMinus),
            title: 'Sin resultados',
            subtitle: 'Intenta ajustar los filtros de búsqueda.',
            action: XoraButton(
              label: 'Clear filters',
              variant: XoraButtonVariant.outline,
            ),
          ),
        ),
      ],
    );
  }
}

