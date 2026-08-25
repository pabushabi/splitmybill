import 'package:flutter/material.dart';

/// Тени карточек и плавающих элементов.
abstract final class AppShadows {
  static const List<BoxShadow> none = <BoxShadow>[];

  static const List<BoxShadow> card = <BoxShadow>[
    BoxShadow(
      color: Color(0x0D0F172A),
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> raised = <BoxShadow>[
    BoxShadow(
      color: Color(0x141F2937),
      blurRadius: 28,
      offset: Offset(0, 12),
    ),
  ];

  static const List<BoxShadow> bottomBar = <BoxShadow>[
    BoxShadow(
      color: Color(0x1A0F172A),
      blurRadius: 32,
      offset: Offset(0, -8),
    ),
  ];

  /// В тёмной теме мягкие тени не читаются, поэтому глубину даёт граница.
  static const List<BoxShadow> cardDark = <BoxShadow>[
    BoxShadow(
      color: Color(0x33000000),
      blurRadius: 18,
      offset: Offset(0, 6),
    ),
  ];
}
