import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/guests/domain/repositories/guests_repository.dart';

@lazySingleton
class DeleteGuest {
  const DeleteGuest(this._repository);

  final GuestsRepository _repository;

  Future<Result<void>> call(String guestId) => _repository.deleteGuest(guestId);
}
