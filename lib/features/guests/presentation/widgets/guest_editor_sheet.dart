import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/extensions/string_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/app_button.dart';
import '../../domain/entities/guest.dart';
import 'color_picker_row.dart';
import 'guest_name_field.dart';

class GuestEditorSheet extends StatefulWidget {
  const GuestEditorSheet({
    required this.guest,
    this.showRemember = false,
    super.key,
  });

  final Guest guest;
  final bool showRemember;

  static Future<Guest?> show({
    required BuildContext context,
    required Guest guest,
    bool showRemember = false,
  }) {
    return AppBottomSheet.show<Guest>(
      context: context,
      builder: (_) => GuestEditorSheet(
        guest: guest,
        showRemember: showRemember,
      ),
    );
  }

  @override
  State<GuestEditorSheet> createState() => _GuestEditorSheetState();
}

class _GuestEditorSheetState extends State<GuestEditorSheet> {
  late final TextEditingController _nameController = TextEditingController(
    text: widget.guest.name,
  );
  late int _colorValue = widget.guest.colorValue;
  late bool _remember = widget.guest.isPersisted;
  String? _nameError;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _submit() {
    final String name = _nameController.text.collapsedSpaces;
    if (name.isBlank) {
      setState(() => _nameError = AppStrings.guestsNameEmptyError);
      return;
    }

    Navigator.of(context).pop(
      widget.guest.copyWith(
        name: name,
        colorValue: _colorValue,
        isPersisted: widget.showRemember ? _remember : true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: AppStrings.guestsEditTitle,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GuestNameField(
            controller: _nameController,
            autofocus: widget.guest.name.isBlank,
            errorText: _nameError,
            onChanged: (_) {
              if (_nameError != null) setState(() => _nameError = null);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            AppStrings.guestsColorLabel,
            style: AppTypography.labelMedium.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          ColorPickerRow(
            selectedValue: _colorValue,
            onSelected: (int value) => setState(() => _colorValue = value),
          ),
          if (widget.showRemember) ...<Widget>[
            const SizedBox(height: AppSpacing.lg),
            SwitchListTile.adaptive(
              contentPadding: EdgeInsets.zero,
              title: Text(
                AppStrings.guestsRemember,
                style: AppTypography.bodyMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              value: _remember,
              onChanged: (bool value) => setState(() => _remember = value),
            ),
          ],
          const SizedBox(height: AppSpacing.xl),
          AppButton(label: AppStrings.save, onPressed: _submit),
        ],
      ),
    );
  }
}
