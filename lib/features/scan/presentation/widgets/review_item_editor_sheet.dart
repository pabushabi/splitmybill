import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/extensions/string_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/money_parser.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../core/widgets/count_stepper.dart';
import '../../../bill/domain/entities/bill_item.dart';

/// Правка одной позиции: название, цена за штуку и количество.
class ReviewItemEditorSheet extends StatefulWidget {
  const ReviewItemEditorSheet({
    required this.item,
    required this.isNew,
    super.key,
  });

  final BillItem item;
  final bool isNew;

  @override
  State<ReviewItemEditorSheet> createState() => _ReviewItemEditorSheetState();
}

class _ReviewItemEditorSheetState extends State<ReviewItemEditorSheet> {
  late final TextEditingController _titleController = TextEditingController(
    text: widget.item.title,
  );
  late final TextEditingController _priceController = TextEditingController(
    text: widget.item.unitPriceMinor == 0
        ? ''
        : MoneyFormatter.toInput(widget.item.unitPriceMinor),
  );

  late int _quantity = widget.item.quantity;
  String? _titleError;
  String? _priceError;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  int get _unitPriceMinor => MoneyParser.parse(_priceController.text) ?? 0;

  void _submit() {
    final String title = _titleController.text.collapsedSpaces;
    final int unitPrice = _unitPriceMinor;

    setState(() {
      _titleError = title.isBlank ? AppStrings.guestsNameEmptyError : null;
      _priceError = unitPrice <= 0 ? AppStrings.reviewPriceError : null;
    });
    if (_titleError != null || _priceError != null) return;

    Navigator.of(context).pop(
      widget.item.copyWith(
        title: title,
        quantity: _quantity,
        unitPriceMinor: unitPrice,
        totalMinor: unitPrice * _quantity,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: widget.isNew ? AppStrings.reviewAddItem : AppStrings.edit,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          AppTextField(
            controller: _titleController,
            label: AppStrings.reviewItemName,
            hint: AppStrings.reviewItemNameHint,
            autofocus: widget.isNew,
            errorText: _titleError,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: AppSpacing.lg),
          AppTextField(
            controller: _priceController,
            label: AppStrings.reviewItemPrice,
            hint: '0',
            errorText: _priceError,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[\d.,]')),
            ],
            onChanged: (_) => setState(() {}),
            suffix: Padding(
              padding: const EdgeInsets.only(right: AppSpacing.lg),
              child: Text(
                AppStrings.currencySymbol,
                style: AppTypography.bodyLarge.copyWith(
                  color: context.colors.textTertiary,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  AppStrings.reviewItemQuantity,
                  style: AppTypography.labelMedium.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ),
              CountStepper(
                value: _quantity,
                onChanged: (int value) => setState(() => _quantity = value),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Row(
            children: <Widget>[
              Text(
                AppStrings.reviewItemTotal,
                style: AppTypography.titleSmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const Spacer(),
              Text(
                MoneyFormatter.format(_unitPriceMinor * _quantity),
                style: AppTypography.titleMedium.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.xl),
          AppButton(label: AppStrings.save, onPressed: _submit),
        ],
      ),
    );
  }
}
