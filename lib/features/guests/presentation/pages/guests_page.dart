import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/widgets/empty_view.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_view.dart';
import '../../domain/entities/guest.dart';
import '../cubit/guests_cubit.dart';
import '../cubit/guests_state.dart';
import '../widgets/add_guest_button.dart';
import '../widgets/guest_editor_sheet.dart';
import '../widgets/guest_list_tile.dart';

class GuestsPage extends StatelessWidget {
  const GuestsPage({super.key});

  Future<void> _edit(BuildContext context, Guest guest) async {
    final Guest? result = await GuestEditorSheet.show(
      context: context,
      guest: guest,
    );
    if (result == null || !context.mounted) return;
    await context.read<GuestsCubit>().save(result);
  }

  Future<void> _confirmDelete(BuildContext context, Guest guest) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text(AppStrings.guestsDeleteConfirm),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text(AppStrings.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, true),
              child: Text(
                AppStrings.delete,
                style: TextStyle(color: dialogContext.colors.danger),
              ),
            ),
          ],
        );
      },
    );
    if (confirmed == true && context.mounted) {
      await context.read<GuestsCubit>().remove(guest.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.guestsTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<GuestsCubit, GuestsState>(
        builder: (BuildContext context, GuestsState state) {
          if (state.status.isLoading && state.guests.isEmpty) {
            return const LoadingView();
          }
          if (state.status.isFailure && state.guests.isEmpty) {
            return ErrorView(
              message: state.errorMessage ?? AppStrings.somethingWentWrong,
              onRetry: () => context.read<GuestsCubit>().load(),
            );
          }
          if (state.isEmpty) {
            return EmptyView(
              title: AppStrings.guestsEmpty,
              message: AppStrings.guestsEmptyHint,
              icon: Icons.people_outline_rounded,
              actionLabel: AppStrings.guestsAdd,
              onAction: () => _edit(
                context,
                context.read<GuestsCubit>().draftGuest(),
              ),
            );
          }

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenPadding,
                    AppSpacing.md,
                    AppSpacing.screenPadding,
                    AppSpacing.lg,
                  ),
                  itemCount: state.guests.length,
                  separatorBuilder: (_, _) => const Divider(height: 1),
                  itemBuilder: (BuildContext context, int index) {
                    final Guest guest = state.guests[index];
                    return GuestListTile(
                      guest: guest,
                      onTap: () => _edit(context, guest),
                      onDelete: () => _confirmDelete(context, guest),
                    );
                  },
                ),
              ),
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenPadding,
                    AppSpacing.sm,
                    AppSpacing.screenPadding,
                    AppSpacing.lg,
                  ),
                  child: AddGuestButton(
                    onPressed: () => _edit(
                      context,
                      context.read<GuestsCubit>().draftGuest(),
                    ),
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
