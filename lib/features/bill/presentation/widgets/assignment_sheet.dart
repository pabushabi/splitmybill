import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/utils/money_splitter.dart';
import '../../../../core/widgets/app_bottom_sheet.dart';
import '../../../../core/widgets/guest_avatar.dart';
import '../../../guests/domain/entities/guest.dart';
import '../../domain/entities/bill_item.dart';
import '../../domain/entities/item_assignment.dart';
import '../cubit/split_cubit.dart';
import '../cubit/split_state.dart';
import 'assignment_guest_chip.dart';
import 'portion_stepper.dart';
import 'split_evenly_button.dart';

class AssignmentSheet extends StatelessWidget {
  const AssignmentSheet({
    required this.item,
    required this.guests,
    super.key,
  });

  final BillItem item;
  final List<Guest> guests;

  static Future<void> show({
    required BuildContext context,
    required BillItem item,
    required List<Guest> guests,
    required SplitCubit cubit,
  }) {
    return AppBottomSheet.show<void>(
      context: context,
      builder: (_) => BlocProvider<SplitCubit>.value(
        value: cubit,
        child: AssignmentSheet(item: item, guests: guests),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBottomSheet(
      title: AppStrings.splitSheetTitle,
      child: BlocBuilder<SplitCubit, SplitState>(
        builder: (BuildContext context, SplitState state) {
          final SplitCubit cubit = context.read<SplitCubit>();
          final ItemAssignment current =
              state.bill?.assignmentFor(item.id) ?? ItemAssignment.empty(item.id);
          final List<int> weights = guests
              .map((Guest guest) => current.weightOf(guest.id))
              .toList();
          final List<int> amounts = MoneySplitter.split(
            item.totalMinor,
            weights,
          );

          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                item.title,
                style: AppTypography.titleSmall.copyWith(
                  color: context.colors.textPrimary,
                ),
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                MoneyFormatter.format(item.totalMinor),
                style: AppTypography.bodySmall.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Wrap(
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.sm,
                children: guests
                    .map(
                      (Guest guest) => AssignmentGuestChip(
                        guest: guest,
                        isSelected: current.hasGuest(guest.id),
                        onTap: () => cubit.toggleGuestOnItem(item.id, guest.id),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: AppSpacing.md),
              SplitEvenlyButton(
                onPressed: () => cubit.assignToEveryone(item.id),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text(
                AppStrings.splitPortions,
                style: AppTypography.labelMedium.copyWith(
                  color: context.colors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              for (int i = 0; i < guests.length; i++)
                if (current.hasGuest(guests[i].id))
                  _PortionRow(
                    guest: guests[i],
                    weight: current.weightOf(guests[i].id),
                    amountMinor: amounts[i],
                    onChanged: (int value) =>
                        cubit.setGuestWeight(item.id, guests[i].id, value),
                  ),
              if (!current.isAssigned)
                Padding(
                  padding: const EdgeInsets.only(top: AppSpacing.sm),
                  child: Text(
                    AppStrings.splitNobodySelected,
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.textTertiary,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _PortionRow extends StatelessWidget {
  const _PortionRow({
    required this.guest,
    required this.weight,
    required this.amountMinor,
    required this.onChanged,
  });

  final Guest guest;
  final int weight;
  final int amountMinor;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        children: <Widget>[
          GuestAvatar(name: guest.name, color: guest.color, size: 28),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  guest.name,
                  style: AppTypography.titleSmall.copyWith(
                    color: context.colors.textPrimary,
                  ),
                ),
                Text(
                  MoneyFormatter.format(amountMinor),
                  style: AppTypography.bodySmall.copyWith(
                    color: context.colors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          PortionStepper(value: weight, onChanged: onChanged),
        ],
      ),
    );
  }
}
