import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/extensions/build_context_x.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/utils/money_formatter.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_card.dart';
import '../../domain/entities/bill.dart';
import '../../domain/entities/guest_share.dart';
import '../../domain/services/bill_share_text.dart';
import '../cubit/split_cubit.dart';
import '../cubit/split_state.dart';
import '../widgets/guest_share_card.dart';
import '../widgets/tip_selector.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  Future<void> _share(Bill bill, List<GuestShare> shares) {
    return SharePlus.instance.share(
      ShareParams(
        text: BillShareText.format(bill, shares),
        subject: AppStrings.summaryShareSubject,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.summaryTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<SplitCubit, SplitState>(
        listenWhen: (SplitState prev, SplitState next) =>
            prev.isSaved != next.isSaved ||
            prev.errorMessage != next.errorMessage,
        listener: (BuildContext context, SplitState state) {
          if (state.isSaved) {
            context.showSnack(AppStrings.summarySaved);
          }
          final String? error = state.errorMessage;
          if (error != null) {
            context.showSnack(error, isError: true);
            context.read<SplitCubit>().clearError();
          }
        },
        builder: (BuildContext context, SplitState state) {
          final Bill? bill = state.bill;
          if (bill == null) return const SizedBox.shrink();

          final SplitCubit cubit = context.read<SplitCubit>();

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
                    AppCard(
                      child: Column(
                        children: <Widget>[
                          _TotalRow(
                            label: AppStrings.summarySubtotal,
                            value: MoneyFormatter.format(bill.itemsTotalMinor),
                          ),
                          if (bill.tipPercent > 0) ...<Widget>[
                            const SizedBox(height: AppSpacing.sm),
                            _TotalRow(
                              label:
                                  '${AppStrings.summaryTip} ${bill.tipPercent}%',
                              value: MoneyFormatter.format(bill.tipMinor),
                            ),
                          ],
                          const Divider(height: 24),
                          _TotalRow(
                            label: AppStrings.summaryTotal,
                            value: MoneyFormatter.format(bill.grandTotalMinor),
                            emphasize: true,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    TipSelector(
                      percent: bill.tipPercent,
                      onChanged: cubit.setTipPercent,
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Text(
                      AppStrings.summaryDetails,
                      style: AppTypography.titleMedium.copyWith(
                        color: context.colors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ...state.shares.map(
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
                  child: Column(
                    children: <Widget>[
                      AppButton(
                        label: state.isSaved
                            ? AppStrings.summaryAlreadySaved
                            : AppStrings.summarySave,
                        icon: Icons.bookmark_add_outlined,
                        onPressed: state.isSaved ? null : cubit.save,
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: AppButton(
                              label: AppStrings.summaryShare,
                              icon: Icons.ios_share_rounded,
                              variant: AppButtonVariant.secondary,
                              onPressed: () => _share(bill, state.shares),
                            ),
                          ),
                          const SizedBox(width: AppSpacing.sm),
                          Expanded(
                            child: AppButton(
                              label: AppStrings.summaryNewBill,
                              variant: AppButtonVariant.ghost,
                              onPressed: () {
                                cubit.reset();
                                context.goNamed(AppRoutes.homeName);
                              },
                            ),
                          ),
                        ],
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

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  final String label;
  final String value;
  final bool emphasize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            label,
            style: (emphasize
                    ? AppTypography.titleMedium
                    : AppTypography.bodyMedium)
                .copyWith(color: context.colors.textSecondary),
          ),
        ),
        Text(
          value,
          style: (emphasize ? AppTypography.money : AppTypography.titleMedium)
              .copyWith(color: context.colors.textPrimary),
        ),
      ],
    );
  }
}
