// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ocr_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OcrLine {

 String get text;/// Координаты строки на изображении. Tesseract в текстовом режиме их
/// не отдаёт, поэтому парсер обязан работать и без них.
 double? get left; double? get top; double? get right; double? get bottom;
/// Create a copy of OcrLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OcrLineCopyWith<OcrLine> get copyWith => _$OcrLineCopyWithImpl<OcrLine>(this as OcrLine, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OcrLine&&(identical(other.text, text) || other.text == text)&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}


@override
int get hashCode => Object.hash(runtimeType,text,left,top,right,bottom);

@override
String toString() {
  return 'OcrLine(text: $text, left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class $OcrLineCopyWith<$Res>  {
  factory $OcrLineCopyWith(OcrLine value, $Res Function(OcrLine) _then) = _$OcrLineCopyWithImpl;
@useResult
$Res call({
 String text, double? left, double? top, double? right, double? bottom
});




}
/// @nodoc
class _$OcrLineCopyWithImpl<$Res>
    implements $OcrLineCopyWith<$Res> {
  _$OcrLineCopyWithImpl(this._self, this._then);

  final OcrLine _self;
  final $Res Function(OcrLine) _then;

/// Create a copy of OcrLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? left = freezed,Object? top = freezed,Object? right = freezed,Object? bottom = freezed,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,left: freezed == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double?,top: freezed == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double?,right: freezed == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double?,bottom: freezed == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [OcrLine].
extension OcrLinePatterns on OcrLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OcrLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OcrLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OcrLine value)  $default,){
final _that = this;
switch (_that) {
case _OcrLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OcrLine value)?  $default,){
final _that = this;
switch (_that) {
case _OcrLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  double? left,  double? top,  double? right,  double? bottom)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OcrLine() when $default != null:
return $default(_that.text,_that.left,_that.top,_that.right,_that.bottom);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  double? left,  double? top,  double? right,  double? bottom)  $default,) {final _that = this;
switch (_that) {
case _OcrLine():
return $default(_that.text,_that.left,_that.top,_that.right,_that.bottom);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  double? left,  double? top,  double? right,  double? bottom)?  $default,) {final _that = this;
switch (_that) {
case _OcrLine() when $default != null:
return $default(_that.text,_that.left,_that.top,_that.right,_that.bottom);case _:
  return null;

}
}

}

/// @nodoc


class _OcrLine extends OcrLine {
  const _OcrLine({required this.text, this.left, this.top, this.right, this.bottom}): super._();
  

@override final  String text;
/// Координаты строки на изображении. Tesseract в текстовом режиме их
/// не отдаёт, поэтому парсер обязан работать и без них.
@override final  double? left;
@override final  double? top;
@override final  double? right;
@override final  double? bottom;

/// Create a copy of OcrLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OcrLineCopyWith<_OcrLine> get copyWith => __$OcrLineCopyWithImpl<_OcrLine>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OcrLine&&(identical(other.text, text) || other.text == text)&&(identical(other.left, left) || other.left == left)&&(identical(other.top, top) || other.top == top)&&(identical(other.right, right) || other.right == right)&&(identical(other.bottom, bottom) || other.bottom == bottom));
}


@override
int get hashCode => Object.hash(runtimeType,text,left,top,right,bottom);

@override
String toString() {
  return 'OcrLine(text: $text, left: $left, top: $top, right: $right, bottom: $bottom)';
}


}

/// @nodoc
abstract mixin class _$OcrLineCopyWith<$Res> implements $OcrLineCopyWith<$Res> {
  factory _$OcrLineCopyWith(_OcrLine value, $Res Function(_OcrLine) _then) = __$OcrLineCopyWithImpl;
@override @useResult
$Res call({
 String text, double? left, double? top, double? right, double? bottom
});




}
/// @nodoc
class __$OcrLineCopyWithImpl<$Res>
    implements _$OcrLineCopyWith<$Res> {
  __$OcrLineCopyWithImpl(this._self, this._then);

  final _OcrLine _self;
  final $Res Function(_OcrLine) _then;

/// Create a copy of OcrLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? left = freezed,Object? top = freezed,Object? right = freezed,Object? bottom = freezed,}) {
  return _then(_OcrLine(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,left: freezed == left ? _self.left : left // ignore: cast_nullable_to_non_nullable
as double?,top: freezed == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as double?,right: freezed == right ? _self.right : right // ignore: cast_nullable_to_non_nullable
as double?,bottom: freezed == bottom ? _self.bottom : bottom // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
