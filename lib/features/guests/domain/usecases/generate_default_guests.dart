import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/theme/guest_palette.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';

/// Готовит список гостей для нового счёта.
///
/// Сначала берутся выбранные постоянные гости, недостающие добираются
/// безымянными «Гость N» с цветами палитры, ещё не занятыми в списке.
@lazySingleton
class GenerateDefaultGuests {
  const GenerateDefaultGuests(this._uuid);

  final Uuid _uuid;

  List<Guest> call({
    required int count,
    List<Guest> selected = const <Guest>[],
  }) {
    final List<Guest> result = selected.take(count).toList();
    final Set<int> usedColors = result.map((Guest g) => g.colorValue).toSet();

    int paletteIndex = 0;
    while (result.length < count) {
      final int colorValue = _nextFreeColor(usedColors, paletteIndex);
      usedColors.add(colorValue);
      paletteIndex++;

      result.add(
        Guest(
          id: _uuid.v4(),
          name: AppStrings.guestNumber(result.length + 1),
          colorValue: colorValue,
        ),
      );
    }

    return result;
  }

  int _nextFreeColor(Set<int> used, int startIndex) {
    for (int offset = 0; offset < GuestPalette.length; offset++) {
      final int value = GuestPalette.valueByIndex(startIndex + offset);
      if (!used.contains(value)) return value;
    }
    // Все цвета заняты — палитра идёт по кругу.
    return GuestPalette.valueByIndex(startIndex);
  }
}
