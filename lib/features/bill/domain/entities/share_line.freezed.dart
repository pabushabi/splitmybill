// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'share_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShareLine {

 String get itemId; String get title; int get amountMinor;/// Вес доли гостя и общий вес по позиции — для подписи «1 из 3».
 int get weight; int get totalWeight;
/// Create a copy of ShareLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShareLineCopyWith<ShareLine> get copyWith => _$ShareLineCopyWithImpl<ShareLine>(this as ShareLine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShareLine&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalWeight, totalWeight) || other.totalWeight == totalWeight));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,title,amountMinor,weight,totalWeight);

@override
String toString() {
  return 'ShareLine(itemId: $itemId, title: $title, amountMinor: $amountMinor, weight: $weight, totalWeight: $totalWeight)';
}


}

/// @nodoc
abstract mixin class $ShareLineCopyWith<$Res>  {
  factory $ShareLineCopyWith(ShareLine value, $Res Function(ShareLine) _then) = _$ShareLineCopyWithImpl;
@useResult
$Res call({
 String itemId, String title, int amountMinor, int weight, int totalWeight
});




}
/// @nodoc
class _$ShareLineCopyWithImpl<$Res>
    implements $ShareLineCopyWith<$Res> {
  _$ShareLineCopyWithImpl(this._self, this._then);

  final ShareLine _self;
  final $Res Function(ShareLine) _then;

/// Create a copy of ShareLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? title = null,Object? amountMinor = null,Object? weight = null,Object? totalWeight = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,totalWeight: null == totalWeight ? _self.totalWeight : totalWeight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ShareLine].
extension ShareLinePatterns on ShareLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShareLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShareLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShareLine value)  $default,){
final _that = this;
switch (_that) {
case _ShareLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShareLine value)?  $default,){
final _that = this;
switch (_that) {
case _ShareLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String title,  int amountMinor,  int weight,  int totalWeight)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShareLine() when $default != null:
return $default(_that.itemId,_that.title,_that.amountMinor,_that.weight,_that.totalWeight);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String title,  int amountMinor,  int weight,  int totalWeight)  $default,) {final _that = this;
switch (_that) {
case _ShareLine():
return $default(_that.itemId,_that.title,_that.amountMinor,_that.weight,_that.totalWeight);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String title,  int amountMinor,  int weight,  int totalWeight)?  $default,) {final _that = this;
switch (_that) {
case _ShareLine() when $default != null:
return $default(_that.itemId,_that.title,_that.amountMinor,_that.weight,_that.totalWeight);case _:
  return null;

}
}

}

/// @nodoc


class _ShareLine extends ShareLine {
  const _ShareLine({required this.itemId, required this.title, required this.amountMinor, required this.weight, required this.totalWeight}): super._();
  

@override final  String itemId;
@override final  String title;
@override final  int amountMinor;
/// Вес доли гостя и общий вес по позиции — для подписи «1 из 3».
@override final  int weight;
@override final  int totalWeight;

/// Create a copy of ShareLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShareLineCopyWith<_ShareLine> get copyWith => __$ShareLineCopyWithImpl<_ShareLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShareLine&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.title, title) || other.title == title)&&(identical(other.amountMinor, amountMinor) || other.amountMinor == amountMinor)&&(identical(other.weight, weight) || other.weight == weight)&&(identical(other.totalWeight, totalWeight) || other.totalWeight == totalWeight));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,title,amountMinor,weight,totalWeight);

@override
String toString() {
  return 'ShareLine(itemId: $itemId, title: $title, amountMinor: $amountMinor, weight: $weight, totalWeight: $totalWeight)';
}


}

/// @nodoc
abstract mixin class _$ShareLineCopyWith<$Res> implements $ShareLineCopyWith<$Res> {
  factory _$ShareLineCopyWith(_ShareLine value, $Res Function(_ShareLine) _then) = __$ShareLineCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String title, int amountMinor, int weight, int totalWeight
});




}
/// @nodoc
class __$ShareLineCopyWithImpl<$Res>
    implements _$ShareLineCopyWith<$Res> {
  __$ShareLineCopyWithImpl(this._self, this._then);

  final _ShareLine _self;
  final $Res Function(_ShareLine) _then;

/// Create a copy of ShareLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? title = null,Object? amountMinor = null,Object? weight = null,Object? totalWeight = null,}) {
  return _then(_ShareLine(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,amountMinor: null == amountMinor ? _self.amountMinor : amountMinor // ignore: cast_nullable_to_non_nullable
as int,weight: null == weight ? _self.weight : weight // ignore: cast_nullable_to_non_nullable
as int,totalWeight: null == totalWeight ? _self.totalWeight : totalWeight // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
