import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    required this.controller,
    this.label,
    this.hint,
    this.errorText,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.autofocus = false,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.textInputAction,
    this.focusNode,
    super.key,
  });

  final TextEditingController controller;
  final String? label;
  final String? hint;
  final String? errorText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;
  final bool autofocus;
  final int? maxLength;
  final TextAlign textAlign;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null) ...<Widget>[
          Text(
            label!,
            style: AppTypography.labelMedium.copyWith(
              color: context.colors.textSecondary,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: autofocus,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          textCapitalization: textCapitalization,
          textAlign: textAlign,
          maxLength: maxLength,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          cursorColor: context.colors.brand,
          style: AppTypography.bodyLarge.copyWith(
            color: context.colors.textPrimary,
          ),
          decoration: InputDecoration(
            hintText: hint,
            errorText: errorText,
            counterText: '',
            suffixIcon: suffix,
          ),
        ),
      ],
    );
  }
}
