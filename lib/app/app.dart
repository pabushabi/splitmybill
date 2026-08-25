import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../core/constants/app_strings.dart';
import '../core/theme/app_theme.dart';
import '../features/bill/presentation/cubit/split_cubit.dart';
import '../features/guests/presentation/cubit/guests_cubit.dart';
import 'di/injection.dart';
import 'router/app_router.dart';

class SplitMyBillApp extends StatelessWidget {
  const SplitMyBillApp({required this.router, super.key});

  final AppRouter router;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<GuestsCubit>.value(value: getIt<GuestsCubit>()..load()),
        BlocProvider<SplitCubit>.value(value: getIt<SplitCubit>()),
      ],
      child: MaterialApp.router(
        title: AppStrings.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: ThemeMode.system,
        routerConfig: router.router,
        locale: const Locale('ru'),
        supportedLocales: const <Locale>[Locale('ru')],
        localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      ),
    );
  }
}
