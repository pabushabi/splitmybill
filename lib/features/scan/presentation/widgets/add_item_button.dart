import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/app_button.dart';

class AddItemButton extends StatelessWidget {
  const AddItemButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: AppStrings.reviewAddItem,
      icon: Icons.add_rounded,
      variant: AppButtonVariant.secondary,
      size: AppButtonSize.medium,
      onPressed: onPressed,
    );
  }
}
