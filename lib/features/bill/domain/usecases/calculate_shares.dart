import 'package:injectable/injectable.dart';

import '../../../../core/utils/money_splitter.dart';
import '../../../guests/domain/entities/guest.dart';
import '../entities/bill.dart';
import '../entities/bill_item.dart';
import '../entities/guest_share.dart';
import '../entities/item_assignment.dart';
import '../entities/share_line.dart';

/// Считает, сколько должен каждый гость.
///
/// Каждая позиция делится между её участниками пропорционально весам долей
/// методом наибольших остатков, поэтому сумма долей всегда точно равна цене
/// позиции. Чаевые распределяются пропорционально суммам гостей и тоже
/// раскладываются без потери копеек.
@lazySingleton
class CalculateShares {
  const CalculateShares();

  List<GuestShare> call(Bill bill) {
    final Map<String, int> subtotals = <String, int>{
      for (final Guest guest in bill.guests) guest.id: 0,
    };
    final Map<String, List<ShareLine>> lines = <String, List<ShareLine>>{
      for (final Guest guest in bill.guests) guest.id: <ShareLine>[],
    };

    for (final BillItem item in bill.items) {
      final ItemAssignment assignment = bill.assignmentFor(item.id);
      if (!assignment.isAssigned) continue;

      final List<String> guestIds = assignment.guestIds
          .where((String id) => subtotals.containsKey(id))
          .toList();
      if (guestIds.isEmpty) continue;

      final List<int> weights = guestIds
          .map((String id) => assignment.weightOf(id))
          .toList();
      final int totalWeight = weights.fold(0, (int s, int w) => s + w);
      final List<int> amounts = MoneySplitter.split(item.totalMinor, weights);

      for (int i = 0; i < guestIds.length; i++) {
        final String guestId = guestIds[i];
        subtotals[guestId] = subtotals[guestId]! + amounts[i];
        lines[guestId]!.add(
          ShareLine(
            itemId: item.id,
            title: item.title,
            amountMinor: amounts[i],
            weight: weights[i],
            totalWeight: totalWeight,
          ),
        );
      }
    }

    final List<int> tips = _distributeTip(
      tipMinor: bill.tipMinor,
      guests: bill.guests,
      subtotals: subtotals,
    );

    return <GuestShare>[
      for (int i = 0; i < bill.guests.length; i++)
        GuestShare(
          guest: bill.guests[i],
          subtotalMinor: subtotals[bill.guests[i].id] ?? 0,
          tipMinor: tips[i],
          lines: lines[bill.guests[i].id] ?? const <ShareLine>[],
        ),
    ];
  }

  List<int> _distributeTip({
    required int tipMinor,
    required List<Guest> guests,
    required Map<String, int> subtotals,
  }) {
    if (tipMinor == 0 || guests.isEmpty) {
      return List<int>.filled(guests.length, 0);
    }

    final List<int> weights = guests
        .map((Guest guest) => subtotals[guest.id] ?? 0)
        .toList();
    final bool nobodyPays = weights.every((int w) => w == 0);

    // Если распределения ещё нет, чаевые делятся поровну.
    return MoneySplitter.split(
      tipMinor,
      nobodyPays ? List<int>.filled(guests.length, 1) : weights,
    );
  }
}
