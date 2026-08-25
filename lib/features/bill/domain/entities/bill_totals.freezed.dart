// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_totals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BillTotals {

 int get itemsTotalMinor; int get assignedMinor; int get tipMinor; int get unassignedCount; int get itemsCount;
/// Create a copy of BillTotals
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillTotalsCopyWith<BillTotals> get copyWith => _$BillTotalsCopyWithImpl<BillTotals>(this as BillTotals, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillTotals&&(identical(other.itemsTotalMinor, itemsTotalMinor) || other.itemsTotalMinor == itemsTotalMinor)&&(identical(other.assignedMinor, assignedMinor) || other.assignedMinor == assignedMinor)&&(identical(other.tipMinor, tipMinor) || other.tipMinor == tipMinor)&&(identical(other.unassignedCount, unassignedCount) || other.unassignedCount == unassignedCount)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount));
}


@override
int get hashCode => Object.hash(runtimeType,itemsTotalMinor,assignedMinor,tipMinor,unassignedCount,itemsCount);

@override
String toString() {
  return 'BillTotals(itemsTotalMinor: $itemsTotalMinor, assignedMinor: $assignedMinor, tipMinor: $tipMinor, unassignedCount: $unassignedCount, itemsCount: $itemsCount)';
}


}

/// @nodoc
abstract mixin class $BillTotalsCopyWith<$Res>  {
  factory $BillTotalsCopyWith(BillTotals value, $Res Function(BillTotals) _then) = _$BillTotalsCopyWithImpl;
@useResult
$Res call({
 int itemsTotalMinor, int assignedMinor, int tipMinor, int unassignedCount, int itemsCount
});




}
/// @nodoc
class _$BillTotalsCopyWithImpl<$Res>
    implements $BillTotalsCopyWith<$Res> {
  _$BillTotalsCopyWithImpl(this._self, this._then);

  final BillTotals _self;
  final $Res Function(BillTotals) _then;

/// Create a copy of BillTotals
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemsTotalMinor = null,Object? assignedMinor = null,Object? tipMinor = null,Object? unassignedCount = null,Object? itemsCount = null,}) {
  return _then(_self.copyWith(
itemsTotalMinor: null == itemsTotalMinor ? _self.itemsTotalMinor : itemsTotalMinor // ignore: cast_nullable_to_non_nullable
as int,assignedMinor: null == assignedMinor ? _self.assignedMinor : assignedMinor // ignore: cast_nullable_to_non_nullable
as int,tipMinor: null == tipMinor ? _self.tipMinor : tipMinor // ignore: cast_nullable_to_non_nullable
as int,unassignedCount: null == unassignedCount ? _self.unassignedCount : unassignedCount // ignore: cast_nullable_to_non_nullable
as int,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BillTotals].
extension BillTotalsPatterns on BillTotals {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillTotals value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillTotals() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillTotals value)  $default,){
final _that = this;
switch (_that) {
case _BillTotals():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillTotals value)?  $default,){
final _that = this;
switch (_that) {
case _BillTotals() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int itemsTotalMinor,  int assignedMinor,  int tipMinor,  int unassignedCount,  int itemsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillTotals() when $default != null:
return $default(_that.itemsTotalMinor,_that.assignedMinor,_that.tipMinor,_that.unassignedCount,_that.itemsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int itemsTotalMinor,  int assignedMinor,  int tipMinor,  int unassignedCount,  int itemsCount)  $default,) {final _that = this;
switch (_that) {
case _BillTotals():
return $default(_that.itemsTotalMinor,_that.assignedMinor,_that.tipMinor,_that.unassignedCount,_that.itemsCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int itemsTotalMinor,  int assignedMinor,  int tipMinor,  int unassignedCount,  int itemsCount)?  $default,) {final _that = this;
switch (_that) {
case _BillTotals() when $default != null:
return $default(_that.itemsTotalMinor,_that.assignedMinor,_that.tipMinor,_that.unassignedCount,_that.itemsCount);case _:
  return null;

}
}

}

/// @nodoc


class _BillTotals extends BillTotals {
  const _BillTotals({required this.itemsTotalMinor, required this.assignedMinor, required this.tipMinor, required this.unassignedCount, required this.itemsCount}): super._();
  

@override final  int itemsTotalMinor;
@override final  int assignedMinor;
@override final  int tipMinor;
@override final  int unassignedCount;
@override final  int itemsCount;

/// Create a copy of BillTotals
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillTotalsCopyWith<_BillTotals> get copyWith => __$BillTotalsCopyWithImpl<_BillTotals>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillTotals&&(identical(other.itemsTotalMinor, itemsTotalMinor) || other.itemsTotalMinor == itemsTotalMinor)&&(identical(other.assignedMinor, assignedMinor) || other.assignedMinor == assignedMinor)&&(identical(other.tipMinor, tipMinor) || other.tipMinor == tipMinor)&&(identical(other.unassignedCount, unassignedCount) || other.unassignedCount == unassignedCount)&&(identical(other.itemsCount, itemsCount) || other.itemsCount == itemsCount));
}


@override
int get hashCode => Object.hash(runtimeType,itemsTotalMinor,assignedMinor,tipMinor,unassignedCount,itemsCount);

@override
String toString() {
  return 'BillTotals(itemsTotalMinor: $itemsTotalMinor, assignedMinor: $assignedMinor, tipMinor: $tipMinor, unassignedCount: $unassignedCount, itemsCount: $itemsCount)';
}


}

/// @nodoc
abstract mixin class _$BillTotalsCopyWith<$Res> implements $BillTotalsCopyWith<$Res> {
  factory _$BillTotalsCopyWith(_BillTotals value, $Res Function(_BillTotals) _then) = __$BillTotalsCopyWithImpl;
@override @useResult
$Res call({
 int itemsTotalMinor, int assignedMinor, int tipMinor, int unassignedCount, int itemsCount
});




}
/// @nodoc
class __$BillTotalsCopyWithImpl<$Res>
    implements _$BillTotalsCopyWith<$Res> {
  __$BillTotalsCopyWithImpl(this._self, this._then);

  final _BillTotals _self;
  final $Res Function(_BillTotals) _then;

/// Create a copy of BillTotals
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemsTotalMinor = null,Object? assignedMinor = null,Object? tipMinor = null,Object? unassignedCount = null,Object? itemsCount = null,}) {
  return _then(_BillTotals(
itemsTotalMinor: null == itemsTotalMinor ? _self.itemsTotalMinor : itemsTotalMinor // ignore: cast_nullable_to_non_nullable
as int,assignedMinor: null == assignedMinor ? _self.assignedMinor : assignedMinor // ignore: cast_nullable_to_non_nullable
as int,tipMinor: null == tipMinor ? _self.tipMinor : tipMinor // ignore: cast_nullable_to_non_nullable
as int,unassignedCount: null == unassignedCount ? _self.unassignedCount : unassignedCount // ignore: cast_nullable_to_non_nullable
as int,itemsCount: null == itemsCount ? _self.itemsCount : itemsCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
