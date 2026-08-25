import 'package:flutter/material.dart';

import 'package:splitmybill/core/theme/app_colors.dart';
import 'package:splitmybill/core/theme/app_shadows.dart';
import 'package:splitmybill/core/theme/app_theme_extension.dart';

extension BuildContextX on BuildContext {
  ThemeData get theme => Theme.of(this);

  TextTheme get textStyles => Theme.of(this).textTheme;

  AppColors get colors =>
      Theme.of(this).extension<AppColorsExtension>()!.colors;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  List<BoxShadow> get cardShadow =>
      isDark ? AppShadows.cardDark : AppShadows.card;

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get screenSize => MediaQuery.sizeOf(this);

  EdgeInsets get viewPadding => MediaQuery.viewPaddingOf(this);

  double get bottomInset => MediaQuery.viewInsetsOf(this).bottom;

  void showSnack(String message, {bool isError = false}) {
    final ScaffoldMessengerState messenger = ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? colors.danger : colors.surfaceInverse,
      ),
    );
  }
}
