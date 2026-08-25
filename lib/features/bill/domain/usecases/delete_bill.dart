import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/bill/domain/repositories/bills_repository.dart';

@lazySingleton
class DeleteBill {
  const DeleteBill(this._repository);

  final BillsRepository _repository;

  Future<Result<void>> call(String billId) => _repository.delete(billId);
}
