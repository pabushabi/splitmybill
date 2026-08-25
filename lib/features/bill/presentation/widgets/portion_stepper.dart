import 'package:flutter/material.dart';

import 'package:splitmybill/core/widgets/count_stepper.dart';

class PortionStepper extends StatelessWidget {
  const PortionStepper({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return CountStepper(
      value: value,
      min: 0,
      max: 12,
      compact: true,
      onChanged: onChanged,
    );
  }
}
