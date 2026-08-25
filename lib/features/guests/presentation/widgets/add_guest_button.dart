import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/widgets/app_button.dart';

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
