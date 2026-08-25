import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entities/bill.dart';
import '../repositories/bills_repository.dart';

@lazySingleton
class SaveBill {
  const SaveBill(this._repository);

  final BillsRepository _repository;

  Future<Result<void>> call(Bill bill) => _repository.save(bill);
}
