import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/hive_boxes.dart';
import '../models/bill_dto.dart';

abstract interface class BillsLocalDataSource {
  Future<List<BillDto>> readAll();

  Future<BillDto?> read(String billId);

  Future<void> write(BillDto bill);

  Future<void> delete(String billId);
}

@LazySingleton(as: BillsLocalDataSource)
class HiveBillsLocalDataSource implements BillsLocalDataSource {
  const HiveBillsLocalDataSource(@Named(HiveBoxes.bills) this._box);

  final Box<String> _box;

  @override
  Future<List<BillDto>> readAll() async {
    try {
      final List<BillDto> bills = <BillDto>[];
      for (final String raw in _box.values) {
        final Object? decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          bills.add(BillDto.fromJson(decoded));
        }
      }
      // Свежие счета сверху.
      bills.sort(
        (BillDto a, BillDto b) =>
            b.createdAtMillis.compareTo(a.createdAtMillis),
      );
      return bills;
    } catch (e) {
      throw StorageException('Не удалось прочитать историю счетов: $e');
    }
  }

  @override
  Future<BillDto?> read(String billId) async {
    try {
      final String? raw = _box.get(billId);
      if (raw == null) return null;
      final Object? decoded = jsonDecode(raw);
      if (decoded is! Map<String, dynamic>) return null;
      return BillDto.fromJson(decoded);
    } catch (e) {
      throw StorageException('Не удалось прочитать счёт: $e');
    }
  }

  @override
  Future<void> write(BillDto bill) async {
    try {
      await _box.put(bill.id, jsonEncode(bill.toJson()));
    } catch (e) {
      throw StorageException('Не удалось сохранить счёт: $e');
    }
  }

  @override
  Future<void> delete(String billId) async {
    try {
      await _box.delete(billId);
    } catch (e) {
      throw StorageException('Не удалось удалить счёт: $e');
    }
  }
}
