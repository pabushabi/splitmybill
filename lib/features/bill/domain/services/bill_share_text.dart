import 'package:splitmybill/core/constants/app_strings.dart';
import 'package:splitmybill/core/utils/date_formatter.dart';
import 'package:splitmybill/core/utils/money_formatter.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/entities/guest_share.dart';
import 'package:splitmybill/features/bill/domain/entities/share_line.dart';

/// Собирает текстовую сводку счёта для шаринга.
abstract final class BillShareText {
  static String format(Bill bill, List<GuestShare> shares) {
    final StringBuffer buffer = StringBuffer()
      ..writeln(AppStrings.appName)
      ..writeln(DateFormatter.full(bill.createdAt));

    final String? place = bill.placeName;
    if (place != null && place.isNotEmpty) {
      buffer.writeln(place);
    }
    buffer.writeln();

    for (final GuestShare share in shares) {
      buffer.writeln(
        '${share.guest.name} — ${MoneyFormatter.format(share.totalMinor)}',
      );
      for (final ShareLine line in share.lines) {
        final String portion = line.isShared
            ? ' (${line.weight} ${AppStrings.splitOf} ${line.totalWeight})'
            : '';
        buffer.writeln(
          '  ${line.title}$portion — ${MoneyFormatter.format(line.amountMinor)}',
        );
      }
      if (share.tipMinor > 0) {
        buffer.writeln(
          '  ${AppStrings.summaryTip} — '
          '${MoneyFormatter.format(share.tipMinor)}',
        );
      }
      buffer.writeln();
    }

    if (bill.tipPercent > 0) {
      buffer.writeln(
        '${AppStrings.summaryTip} ${bill.tipPercent}% — '
        '${MoneyFormatter.format(bill.tipMinor)}',
      );
    }
    buffer.writeln(
      '${AppStrings.summaryTotal}: ${MoneyFormatter.format(bill.grandTotalMinor)}',
    );

    return buffer.toString().trim();
  }
}
