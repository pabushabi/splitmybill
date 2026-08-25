import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/widgets/app_button.dart';

class AddGuestButton extends StatelessWidget {
  const AddGuestButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: AppStrings.guestsAdd,
      icon: Icons.person_add_alt_1_rounded,
      onPressed: onPressed,
    );
  }
}
