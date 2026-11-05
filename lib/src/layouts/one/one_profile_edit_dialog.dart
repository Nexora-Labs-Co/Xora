import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../components/data_display/xora_avatar.dart';
import '../../theme/xora_spacing.dart';

class OneProfileEditResult {
  const OneProfileEditResult({required this.name, this.avatarPath});

  final String name;
  final String? avatarPath;
}

Future<OneProfileEditResult?> showOneProfileEditDialog(
  BuildContext context, {
  String initialName = 'Usuario',
  String? initialAvatarPath,
}) {
  return showDialog<OneProfileEditResult>(
    context: context,
    builder: (_) => _OneProfileEditDialog(
      initialName: initialName,
      initialAvatarPath: initialAvatarPath,
    ),
  );
}

class _OneProfileEditDialog extends StatefulWidget {
  const _OneProfileEditDialog({
    required this.initialName,
    this.initialAvatarPath,
  });

  final String initialName;
  final String? initialAvatarPath;

  @override
  State<_OneProfileEditDialog> createState() => _OneProfileEditDialogState();
}

class _OneProfileEditDialogState extends State<_OneProfileEditDialog> {
  late final TextEditingController _nameController =
      TextEditingController(text: widget.initialName);
  String? _avatarPath;

  @override
  void initState() {
    super.initState();
    _avatarPath = widget.initialAvatarPath;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      withData: false,
    );
    if (result == null || result.files.isEmpty) return;
    final path = result.files.single.path;
    if (path == null) return;
    setState(() => _avatarPath = path);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Editar perfil'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: _pickImage,
            child: _avatarPath == null
                ? XoraAvatar(initials: _nameController.text, size: 72)
                : ClipOval(
                    child: Image.file(
                      File(_avatarPath!),
                      width: 72,
                      height: 72,
                      fit: BoxFit.cover,
                      errorBuilder: (_, _, _) =>
                          XoraAvatar(initials: _nameController.text, size: 72),
                    ),
                  ),
          ),
          const SizedBox(height: XoraSpacing.md),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nombre'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancelar'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(
            OneProfileEditResult(
              name: _nameController.text.trim().isEmpty
                  ? widget.initialName
                  : _nameController.text.trim(),
              avatarPath: _avatarPath,
            ),
          ),
          child: const Text('Guardar'),
        ),
      ],
    );
  }
}

