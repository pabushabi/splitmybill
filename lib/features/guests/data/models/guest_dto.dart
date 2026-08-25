/// Модель гостя для хранения в Hive в виде JSON.
class GuestDto {
  const GuestDto({
    required this.id,
    required this.name,
    required this.colorValue,
    required this.createdAtMillis,
  });

  factory GuestDto.fromJson(Map<String, dynamic> json) {
    return GuestDto(
      id: json['id'] as String,
      name: json['name'] as String,
      colorValue: (json['colorValue'] as num).toInt(),
      createdAtMillis: (json['createdAt'] as num?)?.toInt() ?? 0,
    );
  }

  final String id;
  final String name;
  final int colorValue;
  final int createdAtMillis;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'name': name,
    'colorValue': colorValue,
    'createdAt': createdAtMillis,
  };
}
