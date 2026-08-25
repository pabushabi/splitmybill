// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParsedReceipt {

 List<ParsedItem> get items; String? get placeName; int? get totalMinor; int? get serviceChargeMinor; int? get discountMinor; String get rawText;
/// Create a copy of ParsedReceipt
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedReceiptCopyWith<ParsedReceipt> get copyWith => _$ParsedReceiptCopyWithImpl<ParsedReceipt>(this as ParsedReceipt, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedReceipt&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor)&&(identical(other.serviceChargeMinor, serviceChargeMinor) || other.serviceChargeMinor == serviceChargeMinor)&&(identical(other.discountMinor, discountMinor) || other.discountMinor == discountMinor)&&(identical(other.rawText, rawText) || other.rawText == rawText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),placeName,totalMinor,serviceChargeMinor,discountMinor,rawText);

@override
String toString() {
  return 'ParsedReceipt(items: $items, placeName: $placeName, totalMinor: $totalMinor, serviceChargeMinor: $serviceChargeMinor, discountMinor: $discountMinor, rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class $ParsedReceiptCopyWith<$Res>  {
  factory $ParsedReceiptCopyWith(ParsedReceipt value, $Res Function(ParsedReceipt) _then) = _$ParsedReceiptCopyWithImpl;
@useResult
$Res call({
 List<ParsedItem> items, String? placeName, int? totalMinor, int? serviceChargeMinor, int? discountMinor, String rawText
});




}
/// @nodoc
class _$ParsedReceiptCopyWithImpl<$Res>
    implements $ParsedReceiptCopyWith<$Res> {
  _$ParsedReceiptCopyWithImpl(this._self, this._then);

  final ParsedReceipt _self;
  final $Res Function(ParsedReceipt) _then;

/// Create a copy of ParsedReceipt
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? placeName = freezed,Object? totalMinor = freezed,Object? serviceChargeMinor = freezed,Object? discountMinor = freezed,Object? rawText = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<ParsedItem>,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,totalMinor: freezed == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int?,serviceChargeMinor: freezed == serviceChargeMinor ? _self.serviceChargeMinor : serviceChargeMinor // ignore: cast_nullable_to_non_nullable
as int?,discountMinor: freezed == discountMinor ? _self.discountMinor : discountMinor // ignore: cast_nullable_to_non_nullable
as int?,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedReceipt].
extension ParsedReceiptPatterns on ParsedReceipt {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedReceipt value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedReceipt() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedReceipt value)  $default,){
final _that = this;
switch (_that) {
case _ParsedReceipt():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedReceipt value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedReceipt() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ParsedItem> items,  String? placeName,  int? totalMinor,  int? serviceChargeMinor,  int? discountMinor,  String rawText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedReceipt() when $default != null:
return $default(_that.items,_that.placeName,_that.totalMinor,_that.serviceChargeMinor,_that.discountMinor,_that.rawText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ParsedItem> items,  String? placeName,  int? totalMinor,  int? serviceChargeMinor,  int? discountMinor,  String rawText)  $default,) {final _that = this;
switch (_that) {
case _ParsedReceipt():
return $default(_that.items,_that.placeName,_that.totalMinor,_that.serviceChargeMinor,_that.discountMinor,_that.rawText);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ParsedItem> items,  String? placeName,  int? totalMinor,  int? serviceChargeMinor,  int? discountMinor,  String rawText)?  $default,) {final _that = this;
switch (_that) {
case _ParsedReceipt() when $default != null:
return $default(_that.items,_that.placeName,_that.totalMinor,_that.serviceChargeMinor,_that.discountMinor,_that.rawText);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedReceipt extends ParsedReceipt {
  const _ParsedReceipt({final  List<ParsedItem> items = const <ParsedItem>[], this.placeName, this.totalMinor, this.serviceChargeMinor, this.discountMinor, this.rawText = ''}): _items = items,super._();
  

 final  List<ParsedItem> _items;
@override@JsonKey() List<ParsedItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  String? placeName;
@override final  int? totalMinor;
@override final  int? serviceChargeMinor;
@override final  int? discountMinor;
@override@JsonKey() final  String rawText;

/// Create a copy of ParsedReceipt
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedReceiptCopyWith<_ParsedReceipt> get copyWith => __$ParsedReceiptCopyWithImpl<_ParsedReceipt>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedReceipt&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.placeName, placeName) || other.placeName == placeName)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor)&&(identical(other.serviceChargeMinor, serviceChargeMinor) || other.serviceChargeMinor == serviceChargeMinor)&&(identical(other.discountMinor, discountMinor) || other.discountMinor == discountMinor)&&(identical(other.rawText, rawText) || other.rawText == rawText));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),placeName,totalMinor,serviceChargeMinor,discountMinor,rawText);

@override
String toString() {
  return 'ParsedReceipt(items: $items, placeName: $placeName, totalMinor: $totalMinor, serviceChargeMinor: $serviceChargeMinor, discountMinor: $discountMinor, rawText: $rawText)';
}


}

/// @nodoc
abstract mixin class _$ParsedReceiptCopyWith<$Res> implements $ParsedReceiptCopyWith<$Res> {
  factory _$ParsedReceiptCopyWith(_ParsedReceipt value, $Res Function(_ParsedReceipt) _then) = __$ParsedReceiptCopyWithImpl;
@override @useResult
$Res call({
 List<ParsedItem> items, String? placeName, int? totalMinor, int? serviceChargeMinor, int? discountMinor, String rawText
});




}
/// @nodoc
class __$ParsedReceiptCopyWithImpl<$Res>
    implements _$ParsedReceiptCopyWith<$Res> {
  __$ParsedReceiptCopyWithImpl(this._self, this._then);

  final _ParsedReceipt _self;
  final $Res Function(_ParsedReceipt) _then;

/// Create a copy of ParsedReceipt
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? placeName = freezed,Object? totalMinor = freezed,Object? serviceChargeMinor = freezed,Object? discountMinor = freezed,Object? rawText = null,}) {
  return _then(_ParsedReceipt(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<ParsedItem>,placeName: freezed == placeName ? _self.placeName : placeName // ignore: cast_nullable_to_non_nullable
as String?,totalMinor: freezed == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int?,serviceChargeMinor: freezed == serviceChargeMinor ? _self.serviceChargeMinor : serviceChargeMinor // ignore: cast_nullable_to_non_nullable
as int?,discountMinor: freezed == discountMinor ? _self.discountMinor : discountMinor // ignore: cast_nullable_to_non_nullable
as int?,rawText: null == rawText ? _self.rawText : rawText // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
