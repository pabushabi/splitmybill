import 'package:injectable/injectable.dart';

import '../entities/bill.dart';
import '../entities/bill_totals.dart';

@lazySingleton
class CalculateBillTotals {
  const CalculateBillTotals();

  BillTotals call(Bill bill) {
    return BillTotals(
      itemsTotalMinor: bill.itemsTotalMinor,
      assignedMinor: bill.assignedTotalMinor,
      tipMinor: bill.tipMinor,
      unassignedCount: bill.unassignedCount,
      itemsCount: bill.items.length,
    );
  }
}
