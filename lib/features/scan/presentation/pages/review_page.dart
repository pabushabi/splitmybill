import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:splitmybill/app/router/app_routes.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/core/widgets/app_button.dart';
import 'package:splitmybill/core/widgets/empty_view.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';
import 'package:splitmybill/features/bill/presentation/cubit/split_cubit.dart';
import 'package:splitmybill/features/scan/presentation/cubit/review_cubit.dart';
import 'package:splitmybill/features/scan/presentation/cubit/review_state.dart';
import 'package:splitmybill/features/scan/presentation/widgets/add_item_button.dart';
import 'package:splitmybill/features/scan/presentation/widgets/receipt_total_mismatch_banner.dart';
import 'package:splitmybill/features/scan/presentation/widgets/review_item_editor_sheet.dart';
import 'package:splitmybill/features/scan/presentation/widgets/review_item_tile.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({super.key});

  Future<void> _edit(BuildContext context, BillItem item, {required bool isNew}) async {
    final BillItem? result = await showModalBottomSheet<BillItem>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => ReviewItemEditorSheet(item: item, isNew: isNew),
    );
    if (result == null || !context.mounted) return;
    context.read<ReviewCubit>().upsertItem(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.reviewTitle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocBuilder<ReviewCubit, ReviewState>(
        builder: (BuildContext context, ReviewState state) {
          final ReviewCubit cubit = context.read<ReviewCubit>();

          return Column(
            children: <Widget>[
              Expanded(
                child: state.isEmpty
                    ? EmptyView(
                        title: AppStrings.reviewEmpty,
                        message: AppStrings.ocrEmptyHint,
                        icon: Icons.receipt_long_outlined,
                        actionLabel: AppStrings.reviewAddItem,
                        onAction: () => _edit(
                          context,
                          cubit.draftItem(),
                          isNew: true,
                        ),
                      )
                    : ListView(
                        padding: const EdgeInsets.fromLTRB(
                          AppSpacing.screenPadding,
                          AppSpacing.md,
                          AppSpacing.screenPadding,
                          AppSpacing.lg,
                        ),
                        children: <Widget>[
                          Text(
                            AppStrings.reviewSubtitle,
                            style: AppTypography.bodyMedium.copyWith(
                              color: context.colors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          if (state.hasMismatch &&
                              state.recognizedTotalMinor != null) ...<Widget>[
                            ReceiptTotalMismatchBanner(
                              itemsTotalMinor: state.itemsTotalMinor,
                              receiptTotalMinor: state.recognizedTotalMinor!,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                          ],
                          ...state.items.map(
                            (BillItem item) => Padding(
                              padding: const EdgeInsets.only(
                                bottom: AppSpacing.sm,
                              ),
                              child: ReviewItemTile(
                                item: item,
                                onTap: () => _edit(context, item, isNew: false),
                                onDelete: () => cubit.removeItem(item.id),
                              ),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.md),
                          AddItemButton(
                            onPressed: () => _edit(
                              context,
                              cubit.draftItem(),
                              isNew: true,
                            ),
                          ),
                        ],
                      ),
              ),
              if (!state.isEmpty)
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
                        Row(
                          children: <Widget>[
                            Text(
                              '${AppStrings.reviewItemsCount}: ${state.items.length}',
                              style: AppTypography.bodySmall.copyWith(
                                color: context.colors.textSecondary,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              MoneyFormatter.format(state.itemsTotalMinor),
                              style: AppTypography.titleMedium.copyWith(
                                color: context.colors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.md),
                        AppButton(
                          label: AppStrings.reviewToSplit,
                          onPressed: state.canContinue
                              ? () {
                                  context.read<SplitCubit>().startBill(
                                    items: state.items,
                                    placeName: state.placeName,
                                    recognizedTotalMinor:
                                        state.recognizedTotalMinor,
                                  );
                                  context.pushNamed(AppRoutes.splitName);
                                }
                              : null,
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
