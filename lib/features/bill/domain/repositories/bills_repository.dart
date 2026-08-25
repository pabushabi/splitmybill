import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';

/// История сохранённых счетов.
abstract interface class BillsRepository {
  Future<Result<List<Bill>>> getHistory();

  Future<Result<Bill?>> getById(String billId);

  Future<Result<void>> save(Bill bill);

  Future<Result<void>> delete(String billId);
}
