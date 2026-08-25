import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/app_button.dart';

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
