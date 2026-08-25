class ItemAssignmentDto {
  const ItemAssignmentDto({required this.itemId, required this.shares});

  factory ItemAssignmentDto.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> rawShares =
        (json['shares'] as Map<String, dynamic>?) ?? <String, dynamic>{};
    return ItemAssignmentDto(
      itemId: json['itemId'] as String,
      shares: rawShares.map(
        (String guestId, Object? weight) =>
            MapEntry<String, int>(guestId, (weight as num).toInt()),
      ),
    );
  }

  final String itemId;
  final Map<String, int> shares;

  Map<String, dynamic> toJson() => <String, dynamic>{
    'itemId': itemId,
    'shares': shares,
  };
}
