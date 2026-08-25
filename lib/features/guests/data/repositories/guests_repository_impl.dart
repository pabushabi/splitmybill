import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/domain/repositories/guests_repository.dart';
import 'package:splitmybill/features/guests/data/datasources/guests_local_data_source.dart';
import 'package:splitmybill/features/guests/data/mappers/guest_mapper.dart';
import 'package:splitmybill/features/guests/data/models/guest_dto.dart';

@LazySingleton(as: GuestsRepository)
class GuestsRepositoryImpl implements GuestsRepository {
  const GuestsRepositoryImpl(this._localDataSource);

  final GuestsLocalDataSource _localDataSource;

  @override
  Future<Result<List<Guest>>> getSavedGuests() {
    return guardAsync(() async {
      final List<GuestDto> dtos = await _localDataSource.readAll();
      return dtos.map((GuestDto dto) => dto.toDomain()).toList();
    });
  }

  @override
  Future<Result<Guest>> saveGuest(Guest guest) {
    return guardAsync(() async {
      final Guest persisted = guest.copyWith(isPersisted: true);
      await _localDataSource.write(persisted.toDto());
      return persisted;
    });
  }

  @override
  Future<Result<void>> deleteGuest(String guestId) {
    return guardAsync(() => _localDataSource.delete(guestId));
  }

  @override
  Future<Result<void>> saveAll(List<Guest> guests) {
    return guardAsync(() {
      return _localDataSource.writeAll(
        guests.map((Guest guest) => guest.toDto()).toList(),
      );
    });
  }
}
