import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entities/guest.dart';
import '../repositories/guests_repository.dart';

@lazySingleton
class SaveGuest {
  const SaveGuest(this._repository);

  final GuestsRepository _repository;

  Future<Result<Guest>> call(Guest guest) => _repository.saveGuest(guest);
}
