import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/data/models/guest_dto.dart';

extension GuestDtoMapper on GuestDto {
  Guest toDomain() => Guest(
    id: id,
    name: name,
    colorValue: colorValue,
    isPersisted: true,
  );
}

extension GuestMapper on Guest {
  GuestDto toDto({int? createdAtMillis}) => GuestDto(
    id: id,
    name: name,
    colorValue: colorValue,
    createdAtMillis:
        createdAtMillis ?? DateTime.now().millisecondsSinceEpoch,
  );
}
