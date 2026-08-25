import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/domain/repositories/guests_repository.dart';

@lazySingleton
class SaveGuest {
  const SaveGuest(this._repository);

  final GuestsRepository _repository;

  Future<Result<Guest>> call(Guest guest) => _repository.saveGuest(guest);
}
