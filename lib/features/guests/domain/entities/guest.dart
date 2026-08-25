import 'package:flutter/painting.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/theme/guest_palette.dart';

part 'guest.freezed.dart';

/// Участник разделения счёта.
@freezed
sealed class Guest with _$Guest {
  const factory Guest({
    required String id,
    required String name,
    required int colorValue,

    /// Гость сохранён в справочник и предлагается для следующих счетов.
    @Default(false) bool isPersisted,
  }) = _Guest;

  const Guest._();

  factory Guest.fromPalette({
    required String id,
    required String name,
    required int paletteIndex,
    bool isPersisted = false,
  }) {
    return Guest(
      id: id,
      name: name,
      colorValue: GuestPalette.valueByIndex(paletteIndex),
      isPersisted: isPersisted,
    );
  }

  Color get color => Color(colorValue);
}
