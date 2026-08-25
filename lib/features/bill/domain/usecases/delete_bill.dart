import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../repositories/bills_repository.dart';

@lazySingleton
class DeleteBill {
  const DeleteBill(this._repository);

  final BillsRepository _repository;

  Future<Result<void>> call(String billId) => _repository.delete(billId);
}
