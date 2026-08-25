import 'package:flutter/material.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/widgets/count_stepper.dart';
import '../../../../core/widgets/guest_avatar.dart';
import '../../../guests/domain/entities/guest.dart';
import '../cubit/home_state.dart';

class GuestCountSelector extends StatelessWidget {
  const GuestCountSelector({
    required this.count,
    required this.previewGuests,
    required this.onChanged,
    super.key,
  });

  final int count;
  final List<Guest> previewGuests;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    AppStrings.homeGuestCount,
                    style: AppTypography.titleMedium.copyWith(
                      color: context.colors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxs),
                  Text(
                    AppStrings.guestsCountLabel(count),
                    style: AppTypography.bodySmall.copyWith(
                      color: context.colors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
            CountStepper(
              value: count,
              min: HomeState.minGuests,
              max: HomeState.maxGuests,
              onChanged: onChanged,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        SizedBox(
          height: 44,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: previewGuests.length,
            separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
            itemBuilder: (BuildContext context, int index) {
              final Guest guest = previewGuests[index];
              return GuestAvatar(
                name: guest.name,
                color: guest.color,
                size: 44,
              );
            },
          ),
        ),
      ],
    );
  }
}
