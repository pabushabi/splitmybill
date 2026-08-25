import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/app_text_field.dart';

class GuestNameField extends StatelessWidget {
  const GuestNameField({
    required this.controller,
    this.errorText,
    this.autofocus = false,
    this.onChanged,
    super.key,
  });

  final TextEditingController controller;
  final String? errorText;
  final bool autofocus;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      label: AppStrings.guestsNameLabel,
      hint: AppStrings.guestsNameHint,
      errorText: errorText,
      autofocus: autofocus,
      textCapitalization: TextCapitalization.words,
      textInputAction: TextInputAction.done,
      maxLength: 24,
      onChanged: onChanged,
    );
  }
}
