import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/repositories/bills_repository.dart';

@lazySingleton
class SaveBill {
  const SaveBill(this._repository);

  final BillsRepository _repository;

  Future<Result<void>> call(Bill bill) => _repository.save(bill);
}
