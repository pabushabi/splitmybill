import 'package:injectable/injectable.dart';

import '../../../../core/utils/result.dart';
import '../entities/bill.dart';
import '../repositories/bills_repository.dart';

@lazySingleton
class GetBillHistory {
  const GetBillHistory(this._repository);

  final BillsRepository _repository;

  Future<Result<List<Bill>>> call() => _repository.getHistory();

  Future<Result<Bill?>> byId(String billId) => _repository.getById(billId);
}
