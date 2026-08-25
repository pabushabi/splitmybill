import 'package:injectable/injectable.dart';

import 'package:splitmybill/core/utils/result.dart';
import 'package:splitmybill/features/bill/domain/entities/bill.dart';
import 'package:splitmybill/features/bill/domain/repositories/bills_repository.dart';
import 'package:splitmybill/features/bill/data/datasources/bills_local_data_source.dart';
import 'package:splitmybill/features/bill/data/mappers/bill_mapper.dart';
import 'package:splitmybill/features/bill/data/models/bill_dto.dart';

@LazySingleton(as: BillsRepository)
class BillsRepositoryImpl implements BillsRepository {
  const BillsRepositoryImpl(this._localDataSource);

  final BillsLocalDataSource _localDataSource;

  @override
  Future<Result<List<Bill>>> getHistory() {
    return guardAsync(() async {
      final List<BillDto> dtos = await _localDataSource.readAll();
      return dtos.map((BillDto dto) => dto.toDomain()).toList();
    });
  }

  @override
  Future<Result<Bill?>> getById(String billId) {
    return guardAsync(() async {
      final BillDto? dto = await _localDataSource.read(billId);
      return dto?.toDomain();
    });
  }

  @override
  Future<Result<void>> save(Bill bill) {
    return guardAsync(() => _localDataSource.write(bill.toDto()));
  }

  @override
  Future<Result<void>> delete(String billId) {
    return guardAsync(() => _localDataSource.delete(billId));
  }
}
