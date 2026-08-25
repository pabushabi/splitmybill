import '../../../guests/data/models/guest_dto.dart';
import 'bill_item_dto.dart';
import 'item_assignment_dto.dart';

class BillDto {
  const BillDto({
    required this.id,
    required this.createdAtMillis,
    required this.items,
    required this.guests,
    required this.assignments,
    required this.tipPercent,
    this.placeName,
    this.recognizedTotalMinor,
  });

  factory BillDto.fromJson(Map<String, dynamic> json) {
    return BillDto(
      id: json['id'] as String,
      createdAtMillis: (json['createdAt'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((dynamic e) => BillItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      guests: (json['guests'] as List<dynamic>)
          .map((dynamic e) => GuestDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      assignments: (json['assignments'] as List<dynamic>)
          .map(
            (dynamic e) =>
                ItemAssignmentDto.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      tipPercent: (json['tipPercent'] as num?)?.toInt() ?? 0,
      placeName: json['placeName'] as String?,
      recognizedTotalMinor: (json['recognizedTotal'] as num?)?.toInt(),
    );
  }

  final String id;
  final int createdAtMillis;
  final List<BillItemDto> items;
  final List<GuestDto> guests;
  final List<ItemAssignmentDto> assignments;
  final int tipPercent;
  final String? placeName;
  final int? recognizedTotalMinor;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'createdAt': createdAtMillis,
    'items': items.map((BillItemDto e) => e.toJson()).toList(),
    'guests': guests.map((GuestDto e) => e.toJson()).toList(),
    'assignments': assignments
        .map((ItemAssignmentDto e) => e.toJson())
        .toList(),
    'tipPercent': tipPercent,
    'placeName': placeName,
    'recognizedTotal': recognizedTotalMinor,
  };
}
