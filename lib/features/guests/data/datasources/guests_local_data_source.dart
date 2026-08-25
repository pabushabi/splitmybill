import 'dart:convert';

import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/storage/hive_boxes.dart';
import '../models/guest_dto.dart';

abstract interface class GuestsLocalDataSource {
  Future<List<GuestDto>> readAll();

  Future<void> write(GuestDto guest);

  Future<void> writeAll(List<GuestDto> guests);

  Future<void> delete(String guestId);
}

@LazySingleton(as: GuestsLocalDataSource)
class HiveGuestsLocalDataSource implements GuestsLocalDataSource {
  const HiveGuestsLocalDataSource(@Named(HiveBoxes.guests) this._box);

  final Box<String> _box;

  @override
  Future<List<GuestDto>> readAll() async {
    try {
      final List<GuestDto> guests = <GuestDto>[];
      for (final String raw in _box.values) {
        final Object? decoded = jsonDecode(raw);
        if (decoded is Map<String, dynamic>) {
          guests.add(GuestDto.fromJson(decoded));
        }
      }
      guests.sort(
        (GuestDto a, GuestDto b) =>
            a.createdAtMillis.compareTo(b.createdAtMillis),
      );
      return guests;
    } catch (e) {
      throw StorageException('Не удалось прочитать список гостей: $e');
    }
  }

  @override
  Future<void> write(GuestDto guest) async {
    try {
      await _box.put(guest.id, jsonEncode(guest.toJson()));
    } catch (e) {
      throw StorageException('Не удалось сохранить гостя: $e');
    }
  }

  @override
  Future<void> writeAll(List<GuestDto> guests) async {
    try {
      await _box.putAll(<String, String>{
        for (final GuestDto guest in guests)
          guest.id: jsonEncode(guest.toJson()),
      });
    } catch (e) {
      throw StorageException('Не удалось сохранить гостей: $e');
    }
  }

  @override
  Future<void> delete(String guestId) async {
    try {
      await _box.delete(guestId);
    } catch (e) {
      throw StorageException('Не удалось удалить гостя: $e');
    }
  }
}
