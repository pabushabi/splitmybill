import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/guests/domain/entities/guest.dart';
import 'package:splitmybill/features/guests/domain/repositories/guests_repository.dart';

@lazySingleton
class GetSavedGuests {
  const GetSavedGuests(this._repository);

  final GuestsRepository _repository;

  Future<Result<List<Guest>>> call() => _repository.getSavedGuests();
}
