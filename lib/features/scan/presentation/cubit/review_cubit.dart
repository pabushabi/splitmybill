import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/state/cubit_state.dart';
import '../../../bill/domain/entities/bill_item.dart';
import '../../domain/entities/parsed_item.dart';
import '../../domain/entities/parsed_receipt.dart';
import 'review_state.dart';

/// Правка распознанных позиций перед распределением.
@injectable
class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit(this._uuid) : super(ReviewState.initial());

  final Uuid _uuid;

  void start(ParsedReceipt receipt) {
    emit(
      ReviewState(
        status: CubitState.success,
        placeName: receipt.placeName,
        recognizedTotalMinor: receipt.totalMinor,
        items: receipt.items
            .map(
              (ParsedItem item) => BillItem(
                id: _uuid.v4(),
                title: item.title,
                quantity: item.quantity,
                unitPriceMinor: item.unitPriceMinor,
                totalMinor: item.totalMinor,
              ),
            )
            .toList(),
      ),
    );
  }

  BillItem draftItem() => BillItem(
    id: _uuid.v4(),
    title: '',
    unitPriceMinor: 0,
    totalMinor: 0,
  );

  void upsertItem(BillItem item) {
    final List<BillItem> updated = List<BillItem>.of(state.items);
    final int index = updated.indexWhere((BillItem i) => i.id == item.id);
    if (index == -1) {
      updated.add(item);
    } else {
      updated[index] = item;
    }
    emit(state.copyWith(status: CubitState.success, items: updated));
  }

  void removeItem(String itemId) {
    emit(
      state.copyWith(
        items: state.items.where((BillItem i) => i.id != itemId).toList(),
      ),
    );
  }
}
