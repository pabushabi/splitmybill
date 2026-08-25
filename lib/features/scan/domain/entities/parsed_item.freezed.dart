// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parsed_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ParsedItem {

 String get title; int get quantity; int get unitPriceMinor; int get totalMinor;/// Исходная строка чека — показывается пользователю при правке.
 String get sourceLine;/// Название не удалось прочитать, его нужно ввести вручную.
 bool get hasSuspiciousTitle;
/// Create a copy of ParsedItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsedItemCopyWith<ParsedItem> get copyWith => _$ParsedItemCopyWithImpl<ParsedItem>(this as ParsedItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsedItem&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceMinor, unitPriceMinor) || other.unitPriceMinor == unitPriceMinor)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor)&&(identical(other.sourceLine, sourceLine) || other.sourceLine == sourceLine)&&(identical(other.hasSuspiciousTitle, hasSuspiciousTitle) || other.hasSuspiciousTitle == hasSuspiciousTitle));
}


@override
int get hashCode => Object.hash(runtimeType,title,quantity,unitPriceMinor,totalMinor,sourceLine,hasSuspiciousTitle);

@override
String toString() {
  return 'ParsedItem(title: $title, quantity: $quantity, unitPriceMinor: $unitPriceMinor, totalMinor: $totalMinor, sourceLine: $sourceLine, hasSuspiciousTitle: $hasSuspiciousTitle)';
}


}

/// @nodoc
abstract mixin class $ParsedItemCopyWith<$Res>  {
  factory $ParsedItemCopyWith(ParsedItem value, $Res Function(ParsedItem) _then) = _$ParsedItemCopyWithImpl;
@useResult
$Res call({
 String title, int quantity, int unitPriceMinor, int totalMinor, String sourceLine, bool hasSuspiciousTitle
});




}
/// @nodoc
class _$ParsedItemCopyWithImpl<$Res>
    implements $ParsedItemCopyWith<$Res> {
  _$ParsedItemCopyWithImpl(this._self, this._then);

  final ParsedItem _self;
  final $Res Function(ParsedItem) _then;

/// Create a copy of ParsedItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? quantity = null,Object? unitPriceMinor = null,Object? totalMinor = null,Object? sourceLine = null,Object? hasSuspiciousTitle = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceMinor: null == unitPriceMinor ? _self.unitPriceMinor : unitPriceMinor // ignore: cast_nullable_to_non_nullable
as int,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,sourceLine: null == sourceLine ? _self.sourceLine : sourceLine // ignore: cast_nullable_to_non_nullable
as String,hasSuspiciousTitle: null == hasSuspiciousTitle ? _self.hasSuspiciousTitle : hasSuspiciousTitle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ParsedItem].
extension ParsedItemPatterns on ParsedItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ParsedItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ParsedItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ParsedItem value)  $default,){
final _that = this;
switch (_that) {
case _ParsedItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ParsedItem value)?  $default,){
final _that = this;
switch (_that) {
case _ParsedItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  int quantity,  int unitPriceMinor,  int totalMinor,  String sourceLine,  bool hasSuspiciousTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ParsedItem() when $default != null:
return $default(_that.title,_that.quantity,_that.unitPriceMinor,_that.totalMinor,_that.sourceLine,_that.hasSuspiciousTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  int quantity,  int unitPriceMinor,  int totalMinor,  String sourceLine,  bool hasSuspiciousTitle)  $default,) {final _that = this;
switch (_that) {
case _ParsedItem():
return $default(_that.title,_that.quantity,_that.unitPriceMinor,_that.totalMinor,_that.sourceLine,_that.hasSuspiciousTitle);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  int quantity,  int unitPriceMinor,  int totalMinor,  String sourceLine,  bool hasSuspiciousTitle)?  $default,) {final _that = this;
switch (_that) {
case _ParsedItem() when $default != null:
return $default(_that.title,_that.quantity,_that.unitPriceMinor,_that.totalMinor,_that.sourceLine,_that.hasSuspiciousTitle);case _:
  return null;

}
}

}

/// @nodoc


class _ParsedItem extends ParsedItem {
  const _ParsedItem({required this.title, this.quantity = 1, required this.unitPriceMinor, required this.totalMinor, required this.sourceLine, this.hasSuspiciousTitle = false}): super._();
  

@override final  String title;
@override@JsonKey() final  int quantity;
@override final  int unitPriceMinor;
@override final  int totalMinor;
/// Исходная строка чека — показывается пользователю при правке.
@override final  String sourceLine;
/// Название не удалось прочитать, его нужно ввести вручную.
@override@JsonKey() final  bool hasSuspiciousTitle;

/// Create a copy of ParsedItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParsedItemCopyWith<_ParsedItem> get copyWith => __$ParsedItemCopyWithImpl<_ParsedItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParsedItem&&(identical(other.title, title) || other.title == title)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPriceMinor, unitPriceMinor) || other.unitPriceMinor == unitPriceMinor)&&(identical(other.totalMinor, totalMinor) || other.totalMinor == totalMinor)&&(identical(other.sourceLine, sourceLine) || other.sourceLine == sourceLine)&&(identical(other.hasSuspiciousTitle, hasSuspiciousTitle) || other.hasSuspiciousTitle == hasSuspiciousTitle));
}


@override
int get hashCode => Object.hash(runtimeType,title,quantity,unitPriceMinor,totalMinor,sourceLine,hasSuspiciousTitle);

@override
String toString() {
  return 'ParsedItem(title: $title, quantity: $quantity, unitPriceMinor: $unitPriceMinor, totalMinor: $totalMinor, sourceLine: $sourceLine, hasSuspiciousTitle: $hasSuspiciousTitle)';
}


}

/// @nodoc
abstract mixin class _$ParsedItemCopyWith<$Res> implements $ParsedItemCopyWith<$Res> {
  factory _$ParsedItemCopyWith(_ParsedItem value, $Res Function(_ParsedItem) _then) = __$ParsedItemCopyWithImpl;
@override @useResult
$Res call({
 String title, int quantity, int unitPriceMinor, int totalMinor, String sourceLine, bool hasSuspiciousTitle
});




}
/// @nodoc
class __$ParsedItemCopyWithImpl<$Res>
    implements _$ParsedItemCopyWith<$Res> {
  __$ParsedItemCopyWithImpl(this._self, this._then);

  final _ParsedItem _self;
  final $Res Function(_ParsedItem) _then;

/// Create a copy of ParsedItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? quantity = null,Object? unitPriceMinor = null,Object? totalMinor = null,Object? sourceLine = null,Object? hasSuspiciousTitle = null,}) {
  return _then(_ParsedItem(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPriceMinor: null == unitPriceMinor ? _self.unitPriceMinor : unitPriceMinor // ignore: cast_nullable_to_non_nullable
as int,totalMinor: null == totalMinor ? _self.totalMinor : totalMinor // ignore: cast_nullable_to_non_nullable
as int,sourceLine: null == sourceLine ? _self.sourceLine : sourceLine // ignore: cast_nullable_to_non_nullable
as String,hasSuspiciousTitle: null == hasSuspiciousTitle ? _self.hasSuspiciousTitle : hasSuspiciousTitle // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
