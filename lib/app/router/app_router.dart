import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/constants/app_durations.dart';
import 'package:splitmybill/features/bill/presentation/cubit/history_cubit.dart';
import 'package:splitmybill/features/bill/presentation/pages/history_detail_page.dart';
import 'package:splitmybill/features/bill/presentation/pages/history_page.dart';
import 'package:splitmybill/features/bill/presentation/pages/split_page.dart';
import 'package:splitmybill/features/bill/presentation/pages/summary_page.dart';
import 'package:splitmybill/features/guests/presentation/pages/guests_page.dart';
import 'package:splitmybill/features/home/presentation/pages/home_page.dart';
import 'package:splitmybill/features/scan/domain/entities/parsed_receipt.dart';
import 'package:splitmybill/features/scan/presentation/cubit/capture_cubit.dart';
import 'package:splitmybill/features/scan/presentation/cubit/review_cubit.dart';
import 'package:splitmybill/features/scan/presentation/pages/capture_page.dart';
import 'package:splitmybill/features/scan/presentation/pages/crop_page.dart';
import 'package:splitmybill/features/scan/presentation/pages/review_page.dart';
import 'package:splitmybill/app/di/injection.dart';
import 'app_routes.dart';

@lazySingleton
class AppRouter {
  late final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutes.home,
        name: AppRoutes.homeName,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            _fade(state, const HomePage()),
        routes: <RouteBase>[
          GoRoute(
            path: 'guests',
            name: AppRoutes.guestsName,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _slide(state, const GuestsPage()),
          ),
          // Съёмка и обрезка работают с одним CaptureCubit: он переживает
          // переход между экранами и держит результат распознавания.
          ShellRoute(
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return BlocProvider<CaptureCubit>(
                create: (_) => getIt<CaptureCubit>(),
                child: child,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'capture',
                name: AppRoutes.captureName,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _slide(state, const CapturePage()),
                routes: <RouteBase>[
                  GoRoute(
                    path: 'crop',
                    name: AppRoutes.cropName,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final String imagePath = state.extra as String? ?? '';
                      return _slide(state, CropPage(imagePath: imagePath));
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'review',
            name: AppRoutes.reviewName,
            pageBuilder: (BuildContext context, GoRouterState state) {
              final ParsedReceipt receipt = state.extra is ParsedReceipt
                  ? state.extra! as ParsedReceipt
                  : ParsedReceipt.empty();
              return _slide(
                state,
                BlocProvider<ReviewCubit>(
                  create: (_) => getIt<ReviewCubit>()..start(receipt),
                  child: const ReviewPage(),
                ),
              );
            },
          ),
          GoRoute(
            path: 'split',
            name: AppRoutes.splitName,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                _slide(state, const SplitPage()),
            routes: <RouteBase>[
              GoRoute(
                path: 'summary',
                name: AppRoutes.summaryName,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _slide(state, const SummaryPage()),
              ),
            ],
          ),
          ShellRoute(
            builder: (BuildContext context, GoRouterState state, Widget child) {
              return BlocProvider<HistoryCubit>(
                create: (_) => getIt<HistoryCubit>()..load(),
                child: child,
              );
            },
            routes: <RouteBase>[
              GoRoute(
                path: 'history',
                name: AppRoutes.historyName,
                pageBuilder: (BuildContext context, GoRouterState state) =>
                    _slide(state, const HistoryPage()),
                routes: <RouteBase>[
                  GoRoute(
                    path: ':billId',
                    name: AppRoutes.historyDetailName,
                    pageBuilder: (BuildContext context, GoRouterState state) {
                      final String billId =
                          state.pathParameters['billId'] ?? '';
                      return _slide(
                        state,
                        HistoryDetailPage(billId: billId),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static CustomTransitionPage<void> _fade(GoRouterState state, Widget child) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: AppDurations.fast,
      transitionsBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) => FadeTransition(opacity: animation, child: child),
    );
  }

  static CustomTransitionPage<void> _slide(GoRouterState state, Widget child) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: child,
      transitionDuration: AppDurations.normal,
      reverseTransitionDuration: AppDurations.fast,
      transitionsBuilder:
          (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            final CurvedAnimation curved = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOutCubic,
              reverseCurve: Curves.easeInCubic,
            );
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.06, 0),
                end: Offset.zero,
              ).animate(curved),
              child: FadeTransition(opacity: curved, child: child),
            );
          },
    );
  }
}
