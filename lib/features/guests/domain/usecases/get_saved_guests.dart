import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entities/guest.dart';
import '../repositories/guests_repository.dart';

@lazySingleton
class GetSavedGuests {
  const GetSavedGuests(this._repository);

  final GuestsRepository _repository;

  Future<Result<List<Guest>>> call() => _repository.getSavedGuests();
}
