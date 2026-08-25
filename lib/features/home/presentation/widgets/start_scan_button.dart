import 'package:flutter/material.dart';

import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/widgets/app_button.dart';

class StartScanButton extends StatelessWidget {
  const StartScanButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: AppStrings.homeStartScan,
      icon: Icons.document_scanner_outlined,
      onPressed: onPressed,
    );
  }
}
