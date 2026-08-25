import '../../../../core/utils/result.dart';
import '../entities/guest.dart';

/// Справочник постоянных гостей.
abstract interface class GuestsRepository {
  Future<Result<List<Guest>>> getSavedGuests();

  Future<Result<Guest>> saveGuest(Guest guest);

  Future<Result<void>> deleteGuest(String guestId);

  Future<Result<void>> saveAll(List<Guest> guests);
}
