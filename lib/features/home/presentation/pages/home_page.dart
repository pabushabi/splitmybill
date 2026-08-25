import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:splitmybill/app/di/injection.dart';
import 'package:splitmybill/app/router/app_routes.dart';
import 'package:splitmybill/core/constants/app_spacing.dart';
import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/extensions/build_context_x.dart';
import 'package:splitmybill/core/theme/app_typography.dart';
import 'package:splitmybill/core/widgets/app_card.dart';
import 'package:splitmybill/features/bill/presentation/cubit/split_cubit.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/presentation/cubit/guests_cubit.dart';
import 'package:splitmybill/features/guests/presentation/cubit/guests_state.dart';
import 'package:splitmybill/features/home/presentation/cubit/home_cubit.dart';
import 'package:splitmybill/features/home/presentation/cubit/home_state.dart';
import 'package:splitmybill/features/home/presentation/widgets/app_logo_header.dart';
import 'package:splitmybill/features/home/presentation/widgets/guest_count_selector.dart';
import 'package:splitmybill/features/home/presentation/widgets/history_shortcut_card.dart';
import 'package:splitmybill/features/home/presentation/widgets/saved_guests_picker.dart';
import 'package:splitmybill/features/home/presentation/widgets/start_scan_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (_) => getIt<HomeCubit>(),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (BuildContext context, HomeState homeState) {
            final HomeCubit homeCubit = context.read<HomeCubit>();
            final List<Guest> preview = homeCubit.buildParty();

            return Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.screenPadding,
                      AppSpacing.xl,
                      AppSpacing.screenPadding,
                      AppSpacing.lg,
                    ),
                    children: <Widget>[
                      const AppLogoHeader(),
                      const SizedBox(height: AppSpacing.xxxl),
                      AppCard(
                        child: GuestCountSelector(
                          count: homeState.guestCount,
                          previewGuests: preview,
                          onChanged: homeCubit.setGuestCount,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      AppCard(
                        child: BlocBuilder<GuestsCubit, GuestsState>(
                          builder: (BuildContext context, GuestsState guestsState) {
                            return SavedGuestsPicker(
                              guests: guestsState.guests,
                              selectedIds: homeState.selectedGuests
                                  .map((Guest g) => g.id)
                                  .toSet(),
                              onToggle: homeCubit.toggleSavedGuest,
                              onManage: () =>
                                  context.pushNamed(AppRoutes.guestsName),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: AppSpacing.lg),
                      HistoryShortcutCard(
                        onTap: () => context.pushNamed(AppRoutes.historyName),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.screenPadding,
                    AppSpacing.sm,
                    AppSpacing.screenPadding,
                    AppSpacing.lg,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        AppStrings.homeStartHint,
                        style: AppTypography.bodySmall.copyWith(
                          color: context.colors.textTertiary,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.md),
                      StartScanButton(
                        onPressed: () {
                          context.read<SplitCubit>().prepareGuests(
                            homeCubit.buildParty(),
                          );
                          context.pushNamed(AppRoutes.captureName);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
