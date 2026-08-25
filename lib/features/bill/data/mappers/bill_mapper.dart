import '../../../guests/data/mappers/guest_mapper.dart';
import '../../../guests/data/models/guest_dto.dart';
import '../../../guests/domain/entities/guest.dart';
import '../../domain/entities/bill.dart';
import '../../domain/entities/bill_item.dart';
import '../../domain/entities/item_assignment.dart';
import '../models/bill_dto.dart';
import '../models/bill_item_dto.dart';
import '../models/item_assignment_dto.dart';

extension BillDtoMapper on BillDto {
  Bill toDomain() {
    return Bill(
      id: id,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAtMillis),
      items: items.map((BillItemDto e) => e.toDomain()).toList(),
      // Гость из истории не обязан оставаться в справочнике.
      guests: guests
          .map(
            (GuestDto e) => Guest(
              id: e.id,
              name: e.name,
              colorValue: e.colorValue,
            ),
          )
          .toList(),
      assignments: <String, ItemAssignment>{
        for (final ItemAssignmentDto e in assignments) e.itemId: e.toDomain(),
      },
      tipPercent: tipPercent,
      placeName: placeName,
      recognizedTotalMinor: recognizedTotalMinor,
    );
  }
}

extension BillItemDtoMapper on BillItemDto {
  BillItem toDomain() => BillItem(
    id: id,
    title: title,
    quantity: quantity,
    unitPriceMinor: unitPriceMinor,
    totalMinor: totalMinor,
  );
}

extension ItemAssignmentDtoMapper on ItemAssignmentDto {
  ItemAssignment toDomain() =>
      ItemAssignment(itemId: itemId, shares: Map<String, int>.of(shares));
}

extension BillMapper on Bill {
  BillDto toDto() => BillDto(
    id: id,
    createdAtMillis: createdAt.millisecondsSinceEpoch,
    items: items.map((BillItem e) => e.toDto()).toList(),
    guests: guests
        .map((Guest e) => e.toDto(createdAtMillis: createdAt.millisecondsSinceEpoch))
        .toList(),
    assignments: assignments.values
        .map((ItemAssignment e) => e.toDto())
        .toList(),
    tipPercent: tipPercent,
    placeName: placeName,
    recognizedTotalMinor: recognizedTotalMinor,
  );
}

extension BillItemMapper on BillItem {
  BillItemDto toDto() => BillItemDto(
    id: id,
    title: title,
    quantity: quantity,
    unitPriceMinor: unitPriceMinor,
    totalMinor: totalMinor,
  );
}

extension ItemAssignmentMapper on ItemAssignment {
  ItemAssignmentDto toDto() =>
      ItemAssignmentDto(itemId: itemId, shares: Map<String, int>.of(shares));
}
