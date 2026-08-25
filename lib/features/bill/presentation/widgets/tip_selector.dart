import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_radius.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/money_parser.dart';

class TipSelector extends StatefulWidget {
  const TipSelector({
    required this.percent,
    required this.onChanged,
    super.key,
  });

  final int percent;
  final ValueChanged<int> onChanged;

  static const List<int> presets = <int>[0, 5, 10, 15];

  @override
  State<TipSelector> createState() => _TipSelectorState();
}

class _TipSelectorState extends State<TipSelector> {
  late final TextEditingController _customController = TextEditingController(
    text: TipSelector.presets.contains(widget.percent)
        ? ''
        : '${widget.percent}',
  );

  bool get _isCustom => !TipSelector.presets.contains(widget.percent);

  @override
  void didUpdateWidget(covariant TipSelector oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_isCustom && _customController.text.isNotEmpty) {
      _customController.clear();
    }
  }

  @override
  void dispose() {
    _customController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          AppStrings.summaryTip,
          style: AppTypography.titleSmall.copyWith(
            color: context.colors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSpacing.xxs),
        Text(
          AppStrings.summaryTipHint,
          style: AppTypography.bodySmall.copyWith(
            color: context.colors.textSecondary,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.sm,
          children: <Widget>[
            for (final int value in TipSelector.presets)
              _TipChip(
                label: value == 0 ? '0%' : '$value%',
                isSelected: widget.percent == value,
                onTap: () => widget.onChanged(value),
              ),
            _TipChip(
              label: AppStrings.summaryTipCustom,
              isSelected: _isCustom,
              onTap: () {
                if (!_isCustom) widget.onChanged(widget.percent == 0 ? 20 : widget.percent);
              },
            ),
          ],
        ),
        if (_isCustom) ...<Widget>[
          const SizedBox(height: AppSpacing.md),
          SizedBox(
            width: 120,
            child: TextField(
              controller: _customController,
              autofocus: widget.percent == 20 && _customController.text.isEmpty,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(3),
              ],
              decoration: InputDecoration(
                suffixText: '%',
                hintText: '20',
              ),
              onChanged: (String raw) {
                final int? value = MoneyParser.parseQuantity(raw);
                if (value != null) widget.onChanged(value.clamp(0, 100));
              },
            ),
          ),
        ],
      ],
    );
  }
}

class _TipChip extends StatelessWidget {
  const _TipChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onTap(),
      selectedColor: context.colors.brandSoft,
      labelStyle: AppTypography.labelMedium.copyWith(
        color: isSelected ? context.colors.brand : context.colors.textPrimary,
      ),
      shape: RoundedRectangleBorder(borderRadius: AppRadius.pillAll),
      side: BorderSide(
        color: isSelected ? context.colors.brand : context.colors.border,
      ),
      backgroundColor: context.colors.surface,
      showCheckmark: false,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
      visualDensity: VisualDensity.compact,
    );
  }
}
