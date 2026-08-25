import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/widgets/app_button.dart';

class SplitEvenlyButton extends StatelessWidget {
  const SplitEvenlyButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: AppStrings.splitEveryone,
      icon: Icons.groups_rounded,
      variant: AppButtonVariant.secondary,
      size: AppButtonSize.medium,
      onPressed: onPressed,
    );
  }
}
