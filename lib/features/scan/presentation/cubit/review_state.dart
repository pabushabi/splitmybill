import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:splitmybill/core/state/cubit_state.dart';
import 'package:splitmybill/features/bill/domain/entities/bill_item.dart';

part 'review_state.freezed.dart';

@freezed
sealed class ReviewState with _$ReviewState {
  const factory ReviewState({
    @Default(CubitState.initial) CubitState status,
    @Default(<BillItem>[]) List<BillItem> items,
    final String? placeName,
    final int? recognizedTotalMinor,
    final String? errorMessage,
  }) = _ReviewState;

  const ReviewState._();

  factory ReviewState.initial() => const ReviewState();

  bool get isEmpty => items.isEmpty;

  bool get canContinue => items.isNotEmpty;

  int get itemsTotalMinor =>
      items.fold(0, (int sum, BillItem item) => sum + item.totalMinor);

  /// Насколько сумма позиций отличается от итога в чеке.
  int? get mismatchMinor {
    final int? recognized = recognizedTotalMinor;
    if (recognized == null || items.isEmpty) return null;
    final int diff = itemsTotalMinor - recognized;
    return diff == 0 ? null : diff;
  }

  bool get hasMismatch => mismatchMinor != null;
}
