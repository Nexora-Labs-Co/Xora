import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
          topBar: const OneTopBar(title: Text('Xora')),
          bottomBar: OneBottomBar(
            selectedIndex: _index,
            onTap: (i) => setState(() => _index = i),
            items: const [
              OneBottomBarItem(icon: FaIcon(FontAwesomeIcons.palette), label: 'Home'),
              OneBottomBarItem(icon: FaIcon(FontAwesomeIcons.tableCells), label: 'Components'),
              OneBottomBarItem(icon: FaIcon(FontAwesomeIcons.penToSquare), label: 'Forms'),
              OneBottomBarItem(icon: FaIcon(FontAwesomeIcons.bell), label: 'Feedback'),
            ],
          ),
          child: pages[_index],
        ),
        tablet: XoraSlate(child: pages[_index]),
        desktop: XoraNexo(
          leftSidebar: NexoSidebar(
            items: [
              NexoSidebarItem(
                label: 'Foundations',
                icon: FontAwesomeIcons.palette,
                onTap: () => setState(() => _index = 0),
              ),
              NexoSidebarItem(
                label: 'Components',
                icon: FontAwesomeIcons.tableCells,
                onTap: () => setState(() => _index = 1),
              ),
              NexoSidebarItem(
                label: 'Forms',
                icon: FontAwesomeIcons.penToSquare,
                onTap: () => setState(() => _index = 2),
              ),
              NexoSidebarItem(
                label: 'Feedback',
                icon: FontAwesomeIcons.bell,
                onTap: () => setState(() => _index = 3),
              ),
            ],
          ),
          rightPanel: XoraCard(
            child: Text('Context panel for page ${_index + 1}'),
          ),
          appVersion: 'v0.1.0',
          bottomActions: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.github),
              tooltip: 'GitHub',
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.mugHot),
              tooltip: 'Ko-fi',
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.gear),
              tooltip: 'Settings',
            ),
          ],
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
        Text('Colors', style: Theme.of(context).textTheme.titleLarge),
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
        Text('Typography', style: Theme.of(context).textTheme.titleLarge),
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
        Text('Spacing & radius', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        XoraCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card content with padding ${XoraSpacing.lg}'),
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
        Text('Buttons', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: const [
            XoraButton(label: 'Primary'),
            XoraButton(
              label: 'Secondary',
              variant: XoraButtonVariant.secondary,
            ),
            XoraButton(label: 'Outline', variant: XoraButtonVariant.outline),
            XoraButton(label: 'Ghost', variant: XoraButtonVariant.ghost),
            XoraButton(label: 'Danger', variant: XoraButtonVariant.danger),
          ],
        ),
        const SizedBox(height: 8),
        const XoraButton(label: 'Full width', fullWidth: true),
        const SizedBox(height: 8),
        const XoraButton(label: 'Loading', loading: true),
        const SizedBox(height: 8),
        XoraButton(
          label: "With icon",
          icon: FaIcon(FontAwesomeIcons.plus, size: 16, color: Colors.white),
        ),
        const SizedBox(height: 24),
        Text('Badges', style: Theme.of(context).textTheme.titleLarge),
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
        Text('Avatars', style: Theme.of(context).textTheme.titleLarge),
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
        Text('List tiles', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        XoraCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              XoraListTile(
                leading: XoraAvatar(initials: 'JD'),
                title: Text('Jane Doe'),
                subtitle: Text('Product Designer'),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
              ),
              XoraDivider(indent: 72),
              XoraListTile(
                leading: XoraAvatar(initials: 'MK'),
                title: Text('Mark Kent'),
                subtitle: Text('Engineer'),
                trailing: FaIcon(FontAwesomeIcons.chevronRight),
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
        XoraTextField(controller: _name, label: 'Name', hint: 'Your full name'),
        const SizedBox(height: 16),
        XoraTextField(
          controller: _email,
          label: 'Email',
          hint: 'you@nexora.dev',
          keyboardType: TextInputType.emailAddress,
          errorText: _emailError,
          prefixIcon: FaIcon(FontAwesomeIcons.envelope),
        ),
        const SizedBox(height: 16),
        XoraSwitch(
          value: _notifications,
          onChanged: (v) => setState(() => _notifications = v),
          label: 'Notifications',
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Checkbox(
              value: _terms,
              onChanged: (v) => setState(() => _terms = v ?? false),
            ),
            const Text('Accept terms'),
          ],
        ),
        const SizedBox(height: 24),
        XoraButton(
          label: 'Submit',
          fullWidth: true,
          onPressed: () {
            setState(() {
              _emailError = _email.text.contains('@') ? null : 'Invalid email';
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
          label: 'Show success',
          onPressed: () => XoraSnackbar.show(
            context,
            message: 'Operation completed',
            type: XoraSnackbarType.success,
          ),
        ),
        const SizedBox(height: 8),
        XoraButton(
          label: 'Show error',
          variant: XoraButtonVariant.danger,
          onPressed: () => XoraSnackbar.show(
            context,
            message: 'Something went wrong',
            type: XoraSnackbarType.error,
          ),
        ),
        const SizedBox(height: 24),
        XoraEmptyState(
          icon: FaIcon(FontAwesomeIcons.inbox),
          title: 'No items yet',
          subtitle: 'Create your first item to get started.',
        ),
        const SizedBox(height: 24),
        Center(child: XoraLoading(size: 32)),
        const SizedBox(height: 24),
        XoraCard(
          child: XoraEmptyState(
            icon: FaIcon(FontAwesomeIcons.magnifyingGlassMinus),
            title: 'No results',
            subtitle: 'Try adjusting your search filters.',
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
