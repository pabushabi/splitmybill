import 'package:freezed_annotation/freezed_annotation.dart';

part 'share_line.freezed.dart';

/// Строка детализации: сколько гость платит за конкретную позицию.
@freezed
sealed class ShareLine with _$ShareLine {
  const factory ShareLine({
    required String itemId,
    required String title,
    required int amountMinor,

    /// Вес доли гостя и общий вес по позиции — для подписи «1 из 3».
    required int weight,
    required int totalWeight,
  }) = _ShareLine;

  const ShareLine._();

  /// Позицию делили с кем-то ещё.
  bool get isShared => totalWeight > weight;
}
