import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/error_view.dart';
import '../../../../core/widgets/loading_view.dart';
import '../../domain/entities/bill.dart';
import '../../domain/entities/guest_share.dart';
import '../../domain/services/bill_share_text.dart';
import '../cubit/history_cubit.dart';
import '../cubit/history_state.dart';
import '../widgets/guest_share_card.dart';

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({required this.billId, super.key});

  final String billId;

  @override
  State<HistoryDetailPage> createState() => _HistoryDetailPageState();
}

class _HistoryDetailPageState extends State<HistoryDetailPage> {
  @override
  void initState() {
    super.initState();
    context.read<HistoryCubit>().open(widget.billId);
  }

  Future<void> _delete(BuildContext context, Bill bill) async {
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
      if (context.mounted) {
        context.showSnack(AppStrings.historyDeleted);
        context.pop();
      }
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
          if (state.status.isLoading && state.selected == null) {
            return const LoadingView();
          }
          final Bill? bill = state.selected;
          if (bill == null) {
            return ErrorView(
              message: state.errorMessage ?? AppStrings.somethingWentWrong,
              onRetry: () => context.read<HistoryCubit>().open(widget.billId),
            );
          }

          return Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenPadding,
                    AppSpacing.md,
                    AppSpacing.screenPadding,
                    AppSpacing.lg,
                  ),
                  children: <Widget>[
                    Text(
                      bill.placeName?.isNotEmpty == true
                          ? bill.placeName!
                          : AppStrings.appName,
                      style: AppTypography.headlineMedium.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      DateFormatter.full(bill.createdAt),
                      style: AppTypography.bodyMedium.copyWith(
                        color: context.colors.textSecondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    AppCard(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              AppStrings.summaryTotal,
                              style: AppTypography.titleSmall.copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ),
                          ),
                          Text(
                            MoneyFormatter.format(bill.grandTotalMinor),
                            style: AppTypography.money.copyWith(
                              color: context.colors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    ...state.selectedShares.map(
                      (GuestShare share) => Padding(
                        padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                        child: GuestShareCard(share: share),
                      ),
                    ),
                  ],
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
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: AppButton(
                          label: AppStrings.summaryShare,
                          icon: Icons.ios_share_rounded,
                          variant: AppButtonVariant.secondary,
                          onPressed: () {
                            SharePlus.instance.share(
                              ShareParams(
                                text: BillShareText.format(
                                  bill,
                                  state.selectedShares,
                                ),
                                subject: AppStrings.summaryShareSubject,
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Expanded(
                        child: AppButton(
                          label: AppStrings.delete,
                          variant: AppButtonVariant.danger,
                          onPressed: () => _delete(context, bill),
                        ),
                      ),
                    ],
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
