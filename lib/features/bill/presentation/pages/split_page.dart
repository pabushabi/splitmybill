import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:splitmybill/app/router/app_routes.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/presentation/cubit/guests_cubit.dart';
import 'package:splitmybill/features/guests/presentation/widgets/guest_editor_sheet.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'package:splitmybill/features/bill/domain/entities/item_assignment.dart';
import 'package:splitmybill/features/bill/presentation/cubit/split_cubit.dart';
import 'package:splitmybill/features/bill/presentation/cubit/split_state.dart';
import 'package:splitmybill/features/bill/presentation/widgets/assignment_sheet.dart';
import 'package:splitmybill/features/bill/presentation/widgets/bill_item_tile.dart';
import 'package:splitmybill/features/bill/presentation/widgets/guest_strip.dart';
import 'package:splitmybill/features/bill/presentation/widgets/split_bottom_bar.dart';
import 'package:splitmybill/features/bill/presentation/widgets/unassigned_warning.dart';

class SplitPage extends StatelessWidget {
  const SplitPage({super.key});

  Future<void> _editGuest(BuildContext context, Guest guest) async {
    final Guest? result = await GuestEditorSheet.show(
      context: context,
      guest: guest,
      showRemember: !guest.isPersisted,
    );
    if (result == null || !context.mounted) return;
    context.read<SplitCubit>().updateGuest(result);
    if (result.isPersisted) {
      await context.read<GuestsCubit>().save(result);
    }
  }

  Future<void> _onItemTap({
    required BuildContext context,
    required SplitState state,
    required BillItem item,
  }) async {
    final SplitCubit cubit = context.read<SplitCubit>();
    final String? selectedId = state.selectedGuestId;
    if (selectedId != null) {
      cubit.toggleGuestOnItem(item.id, selectedId);
      return;
    }

    await AssignmentSheet.show(
      context: context,
      item: item,
      guests: state.guests,
      cubit: cubit,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.splitTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<SplitCubit, SplitState>(
        listenWhen: (SplitState prev, SplitState next) =>
            prev.errorMessage != next.errorMessage,
        listener: (BuildContext context, SplitState state) {
          final String? error = state.errorMessage;
          if (error != null) {
            context.showSnack(error, isError: true);
            context.read<SplitCubit>().clearError();
          }
        },
        builder: (BuildContext context, SplitState state) {
          final Bill? bill = state.bill;
          if (bill == null) {
            return const SizedBox.shrink();
          }

          final SplitCubit cubit = context.read<SplitCubit>();

          return Column(
            children: <Widget>[
              GuestStrip(
                guests: bill.guests,
                selectedGuestId: state.selectedGuestId,
                amountOf: state.shareOf,
                onSelect: cubit.selectGuest,
                onEdit: (Guest guest) => _editGuest(context, guest),
              ),
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenPadding,
                    AppSpacing.sm,
                    AppSpacing.screenPadding,
                    AppSpacing.lg,
                  ),
                  itemCount: bill.items.length + 1,
                  separatorBuilder: (_, int index) =>
                      const SizedBox(height: AppSpacing.sm),
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return UnassignedWarning(count: state.unassignedCount);
                    }
                    final BillItem item = bill.items[index - 1];
                    final ItemAssignment assignment = bill.assignmentFor(item.id);
                    final List<Guest> assigned = bill.guests
                        .where((Guest guest) => assignment.hasGuest(guest.id))
                        .toList();
                    return BillItemTile(
                      item: item,
                      assignedGuests: assigned,
                      isAssigned: assignment.isAssigned,
                      onTap: () => _onItemTap(
                        context: context,
                        state: state,
                        item: item,
                      ),
                    );
                  },
                ),
              ),
              SplitBottomBar(
                assignedMinor: state.assignedTotalMinor,
                totalMinor: state.itemsTotalMinor,
                unassignedCount: state.unassignedCount,
                canContinue: state.isFullyAssigned,
                onContinue: () => context.pushNamed(AppRoutes.summaryName),
                onAssignRemaining: cubit.assignRemainingToEveryone,
              ),
            ],
          );
        },
      ),
    );
  }
}
