import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:splitmybill/app/router/app_routes.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/widgets/empty_view.dart';
import 'package:splitmybill/core/widgets/error_view.dart';
import 'package:splitmybill/core/widgets/loading_view.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/presentation/cubit/history_cubit.dart';
import 'package:splitmybill/features/bill/presentation/cubit/history_state.dart';
import 'package:splitmybill/features/bill/presentation/widgets/history_bill_tile.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  Future<void> _confirmDelete(BuildContext context, Bill bill) async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text(AppStrings.historyDeleteConfirm),
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
      await context.read<HistoryCubit>().remove(bill.id);
      if (context.mounted) context.showSnack(AppStrings.historyDeleted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.historyTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        builder: (BuildContext context, HistoryState state) {
          if (state.status.isLoading && state.bills.isEmpty) {
            return const LoadingView();
          }
          if (state.status.isFailure && state.bills.isEmpty) {
            return ErrorView(
              message: state.errorMessage ?? AppStrings.somethingWentWrong,
              onRetry: () => context.read<HistoryCubit>().load(),
            );
          }
          if (state.isEmpty) {
            return const EmptyView(
              title: AppStrings.historyEmpty,
              message: AppStrings.historyEmptyHint,
              icon: Icons.history_rounded,
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.screenPadding,
              AppSpacing.md,
              AppSpacing.screenPadding,
              AppSpacing.lg,
            ),
            itemCount: state.bills.length,
            itemBuilder: (BuildContext context, int index) {
              final Bill bill = state.bills[index];
              return HistoryBillTile(
                bill: bill,
                onTap: () => context.pushNamed(
                  AppRoutes.historyDetailName,
                  pathParameters: <String, String>{'billId': bill.id},
                ),
                onDelete: () => _confirmDelete(context, bill),
              );
            },
          );
        },
      ),
    );
  }
}
