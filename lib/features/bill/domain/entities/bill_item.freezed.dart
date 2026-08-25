// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bill_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BillItem {

 String get id; String get title; int get quantity; int get unitPriceMinor; int get totalMinor;
/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillItemCopyWith<BillItem> get copyWith => _$BillItemCopyWithImpl<BillItem>(this as BillItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceMinor, unitPriceMinor) || other.unitPriceMinor == unitPriceMinor)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,quantity,unitPriceMinor,totalMinor);

@override
String toString() {
  return 'BillItem(id: $id, title: $title, quantity: $quantity, unitPriceMinor: $unitPriceMinor, totalMinor: $totalMinor)';
}


}

/// @nodoc
abstract mixin class $BillItemCopyWith<$Res>  {
  factory $BillItemCopyWith(BillItem value, $Res Function(BillItem) _then) = _$BillItemCopyWithImpl;
@useResult
$Res call({
 String id, String title, int quantity, int unitPriceMinor, int totalMinor
});




}
/// @nodoc
class _$BillItemCopyWithImpl<$Res>
    implements $BillItemCopyWith<$Res> {
  _$BillItemCopyWithImpl(this._self, this._then);

  final BillItem _self;
  final $Res Function(BillItem) _then;

/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? quantity = null,Object? unitPriceMinor = null,Object? totalMinor = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceMinor: null == unitPriceMinor ? _self.unitPriceMinor : unitPriceMinor // ignore: cast_nullable_to_non_nullable
as int,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BillItem].
extension BillItemPatterns on BillItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BillItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BillItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BillItem value)  $default,){
final _that = this;
switch (_that) {
case _BillItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BillItem value)?  $default,){
final _that = this;
switch (_that) {
case _BillItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  int quantity,  int unitPriceMinor,  int totalMinor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BillItem() when $default != null:
return $default(_that.id,_that.title,_that.quantity,_that.unitPriceMinor,_that.totalMinor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  int quantity,  int unitPriceMinor,  int totalMinor)  $default,) {final _that = this;
switch (_that) {
case _BillItem():
return $default(_that.id,_that.title,_that.quantity,_that.unitPriceMinor,_that.totalMinor);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  int quantity,  int unitPriceMinor,  int totalMinor)?  $default,) {final _that = this;
switch (_that) {
case _BillItem() when $default != null:
return $default(_that.id,_that.title,_that.quantity,_that.unitPriceMinor,_that.totalMinor);case _:
  return null;

}
}

}

/// @nodoc


class _BillItem extends BillItem {
  const _BillItem({required this.id, required this.title, this.quantity = 1, required this.unitPriceMinor, required this.totalMinor}): super._();
  

@override final  String id;
@override final  String title;
@override@JsonKey() final  int quantity;
@override final  int unitPriceMinor;
@override final  int totalMinor;

/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BillItemCopyWith<_BillItem> get copyWith => __$BillItemCopyWithImpl<_BillItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BillItem&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceMinor, unitPriceMinor) || other.unitPriceMinor == unitPriceMinor)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,quantity,unitPriceMinor,totalMinor);

@override
String toString() {
  return 'BillItem(id: $id, title: $title, quantity: $quantity, unitPriceMinor: $unitPriceMinor, totalMinor: $totalMinor)';
}


}

/// @nodoc
abstract mixin class _$BillItemCopyWith<$Res> implements $BillItemCopyWith<$Res> {
  factory _$BillItemCopyWith(_BillItem value, $Res Function(_BillItem) _then) = __$BillItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, int quantity, int unitPriceMinor, int totalMinor
});




}
/// @nodoc
class __$BillItemCopyWithImpl<$Res>
    implements _$BillItemCopyWith<$Res> {
  __$BillItemCopyWithImpl(this._self, this._then);

  final _BillItem _self;
  final $Res Function(_BillItem) _then;

/// Create a copy of BillItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? quantity = null,Object? unitPriceMinor = null,Object? totalMinor = null,}) {
  return _then(_BillItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceMinor: null == unitPriceMinor ? _self.unitPriceMinor : unitPriceMinor // ignore: cast_nullable_to_non_nullable
as int,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
