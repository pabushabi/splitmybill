class BillItemDto {
  const BillItemDto({
    required this.id,
    required this.title,
    required this.quantity,
    required this.unitPriceMinor,
    required this.totalMinor,
  });

  factory BillItemDto.fromJson(Map<String, dynamic> json) {
    return BillItemDto(
      id: json['id'] as String,
      title: json['title'] as String,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      unitPriceMinor: (json['unitPrice'] as num).toInt(),
      totalMinor: (json['total'] as num).toInt(),
    );
  }

  final String id;
  final String title;
  final int quantity;
  final int unitPriceMinor;
  final int totalMinor;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'title': title,
    'quantity': quantity,
    'unitPrice': unitPriceMinor,
    'total': totalMinor,
  };
}
