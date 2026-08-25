// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Bill {

 String get id; DateTime get createdAt; List<BillItem> get items; List<Guest> get guests; Map<String, ItemAssignment> get assignments; String? get placeName;/// Итог, распознанный в чеке. Нужен только для сверки.
 int? get recognizedTotalMinor; int get tipPercent;
/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillCopyWith<Bill> get copyWith => _$BillCopyWithImpl<Bill>(this as Bill, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bill&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.guests, guests)&&const DeepCollectionEquality().equals(other.assignments, assignments)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.recognizedTotalMinor, recognizedTotalMinor) || other.recognizedTotalMinor == recognizedTotalMinor)&&(identical(other.tipPercent, tipPercent) || other.tipPercent == tipPercent));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(guests),const DeepCollectionEquality().hash(assignments),placeName,recognizedTotalMinor,tipPercent);

@override
String toString() {
  return 'Bill(id: $id, createdAt: $createdAt, items: $items, guests: $guests, assignments: $assignments, placeName: $placeName, recognizedTotalMinor: $recognizedTotalMinor, tipPercent: $tipPercent)';
}


}

/// @nodoc
abstract mixin class $BillCopyWith<$Res>  {
  factory $BillCopyWith(Bill value, $Res Function(Bill) _then) = _$BillCopyWithImpl;
@useResult
$Res call({
 String id, DateTime createdAt, List<BillItem> items, List<Guest> guests, Map<String, ItemAssignment> assignments, String? placeName, int? recognizedTotalMinor, int tipPercent
});




}
/// @nodoc
class _$BillCopyWithImpl<$Res>
    implements $BillCopyWith<$Res> {
  _$BillCopyWithImpl(this._self, this._then);

  final Bill _self;
  final $Res Function(Bill) _then;

/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? items = null,Object? guests = null,Object? assignments = null,Object? placeName = freezed,Object? recognizedTotalMinor = freezed,Object? tipPercent = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BillItem>,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as List<Guest>,assignments: null == assignments ? _self.assignments : assignments // ignore: cast_nullable_to_non_nullable
as Map<String, ItemAssignment>,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,recognizedTotalMinor: freezed == recognizedTotalMinor ? _self.recognizedTotalMinor : recognizedTotalMinor // ignore: cast_nullable_to_non_nullable
as int?,tipPercent: null == tipPercent ? _self.tipPercent : tipPercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Bill].
extension BillPatterns on Bill {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bill value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bill() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bill value)  $default,){
final _that = this;
switch (_that) {
case _Bill():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bill value)?  $default,){
final _that = this;
switch (_that) {
case _Bill() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  List<BillItem> items,  List<Guest> guests,  Map<String, ItemAssignment> assignments,  String? placeName,  int? recognizedTotalMinor,  int tipPercent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bill() when $default != null:
return $default(_that.id,_that.createdAt,_that.items,_that.guests,_that.assignments,_that.placeName,_that.recognizedTotalMinor,_that.tipPercent);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime createdAt,  List<BillItem> items,  List<Guest> guests,  Map<String, ItemAssignment> assignments,  String? placeName,  int? recognizedTotalMinor,  int tipPercent)  $default,) {final _that = this;
switch (_that) {
case _Bill():
return $default(_that.id,_that.createdAt,_that.items,_that.guests,_that.assignments,_that.placeName,_that.recognizedTotalMinor,_that.tipPercent);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime createdAt,  List<BillItem> items,  List<Guest> guests,  Map<String, ItemAssignment> assignments,  String? placeName,  int? recognizedTotalMinor,  int tipPercent)?  $default,) {final _that = this;
switch (_that) {
case _Bill() when $default != null:
return $default(_that.id,_that.createdAt,_that.items,_that.guests,_that.assignments,_that.placeName,_that.recognizedTotalMinor,_that.tipPercent);case _:
  return null;

}
}

}

/// @nodoc


class _Bill extends Bill {
  const _Bill({required this.id, required this.createdAt, required final  List<BillItem> items, required final  List<Guest> guests, final  Map<String, ItemAssignment> assignments = const <String, ItemAssignment>{}, this.placeName, this.recognizedTotalMinor, this.tipPercent = 0}): _items = items,_guests = guests,_assignments = assignments,super._();
  

@override final  String id;
@override final  DateTime createdAt;
 final  List<BillItem> _items;
@override List<BillItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  List<Guest> _guests;
@override List<Guest> get guests {
  if (_guests is EqualUnmodifiableListView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guests);
}

 final  Map<String, ItemAssignment> _assignments;
@override@JsonKey() Map<String, ItemAssignment> get assignments {
  if (_assignments is EqualUnmodifiableMapView) return _assignments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_assignments);
}

@override final  String? placeName;
/// Итог, распознанный в чеке. Нужен только для сверки.
@override final  int? recognizedTotalMinor;
@override@JsonKey() final  int tipPercent;

/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillCopyWith<_Bill> get copyWith => __$BillCopyWithImpl<_Bill>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bill&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._guests, _guests)&&const DeepCollectionEquality().equals(other._assignments, _assignments)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.recognizedTotalMinor, recognizedTotalMinor) || other.recognizedTotalMinor == recognizedTotalMinor)&&(identical(other.tipPercent, tipPercent) || other.tipPercent == tipPercent));
}


@override
int get hashCode => Object.hash(runtimeType,id,createdAt,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_guests),const DeepCollectionEquality().hash(_assignments),placeName,recognizedTotalMinor,tipPercent);

@override
String toString() {
  return 'Bill(id: $id, createdAt: $createdAt, items: $items, guests: $guests, assignments: $assignments, placeName: $placeName, recognizedTotalMinor: $recognizedTotalMinor, tipPercent: $tipPercent)';
}


}

/// @nodoc
abstract mixin class _$BillCopyWith<$Res> implements $BillCopyWith<$Res> {
  factory _$BillCopyWith(_Bill value, $Res Function(_Bill) _then) = __$BillCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime createdAt, List<BillItem> items, List<Guest> guests, Map<String, ItemAssignment> assignments, String? placeName, int? recognizedTotalMinor, int tipPercent
});




}
/// @nodoc
class __$BillCopyWithImpl<$Res>
    implements _$BillCopyWith<$Res> {
  __$BillCopyWithImpl(this._self, this._then);

  final _Bill _self;
  final $Res Function(_Bill) _then;

/// Create a copy of Bill
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? items = null,Object? guests = null,Object? assignments = null,Object? placeName = freezed,Object? recognizedTotalMinor = freezed,Object? tipPercent = null,}) {
  return _then(_Bill(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BillItem>,guests: null == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as List<Guest>,assignments: null == assignments ? _self._assignments : assignments // ignore: cast_nullable_to_non_nullable
as Map<String, ItemAssignment>,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,recognizedTotalMinor: freezed == recognizedTotalMinor ? _self.recognizedTotalMinor : recognizedTotalMinor // ignore: cast_nullable_to_non_nullable
as int?,tipPercent: null == tipPercent ? _self.tipPercent : tipPercent // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
