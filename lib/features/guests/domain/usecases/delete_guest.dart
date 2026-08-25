import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../repositories/guests_repository.dart';

@lazySingleton
class DeleteGuest {
  const DeleteGuest(this._repository);

  final GuestsRepository _repository;

  Future<Result<void>> call(String guestId) => _repository.deleteGuest(guestId);
}
