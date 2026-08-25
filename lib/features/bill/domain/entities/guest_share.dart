import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'share_line.dart';

part 'guest_share.freezed.dart';

/// Сколько должен один гость: сумма по позициям, чаевые и детализация.
@freezed
sealed class GuestShare with _$GuestShare {
  const factory GuestShare({
    required Guest guest,
    required int subtotalMinor,
    @Default(0) int tipMinor,
    @Default(<ShareLine>[]) List<ShareLine> lines,
  }) = _GuestShare;

  const GuestShare._();

  int get totalMinor => subtotalMinor + tipMinor;

  bool get isEmpty => lines.isEmpty;
}
