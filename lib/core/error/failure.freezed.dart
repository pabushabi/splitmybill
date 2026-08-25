// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {

 String? get details;
/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureCopyWith<Failure> get copyWith => _$FailureCopyWithImpl<Failure>(this as Failure, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'Failure(details: $details)';
}


}

/// @nodoc
abstract mixin class $FailureCopyWith<$Res>  {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) _then) = _$FailureCopyWithImpl;
@useResult
$Res call({
 String? details
});




}
/// @nodoc
class _$FailureCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._self, this._then);

  final Failure _self;
  final $Res Function(Failure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? details = freezed,}) {
  return _then(_self.copyWith(
details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CameraFailure value)?  camera,TResult Function( OcrFailure value)?  ocr,TResult Function( ParsingFailure value)?  parsing,TResult Function( StorageFailure value)?  storage,TResult Function( PermissionDeniedFailure value)?  permissionDenied,TResult Function( UnknownFailure value)?  unknown,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CameraFailure() when camera != null:
return camera(_that);case OcrFailure() when ocr != null:
return ocr(_that);case ParsingFailure() when parsing != null:
return parsing(_that);case StorageFailure() when storage != null:
return storage(_that);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CameraFailure value)  camera,required TResult Function( OcrFailure value)  ocr,required TResult Function( ParsingFailure value)  parsing,required TResult Function( StorageFailure value)  storage,required TResult Function( PermissionDeniedFailure value)  permissionDenied,required TResult Function( UnknownFailure value)  unknown,}){
final _that = this;
switch (_that) {
case CameraFailure():
return camera(_that);case OcrFailure():
return ocr(_that);case ParsingFailure():
return parsing(_that);case StorageFailure():
return storage(_that);case PermissionDeniedFailure():
return permissionDenied(_that);case UnknownFailure():
return unknown(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CameraFailure value)?  camera,TResult? Function( OcrFailure value)?  ocr,TResult? Function( ParsingFailure value)?  parsing,TResult? Function( StorageFailure value)?  storage,TResult? Function( PermissionDeniedFailure value)?  permissionDenied,TResult? Function( UnknownFailure value)?  unknown,}){
final _that = this;
switch (_that) {
case CameraFailure() when camera != null:
return camera(_that);case OcrFailure() when ocr != null:
return ocr(_that);case ParsingFailure() when parsing != null:
return parsing(_that);case StorageFailure() when storage != null:
return storage(_that);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that);case UnknownFailure() when unknown != null:
return unknown(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? details)?  camera,TResult Function( String? details)?  ocr,TResult Function( String? details)?  parsing,TResult Function( String? details)?  storage,TResult Function( bool permanently,  String? details)?  permissionDenied,TResult Function( String? details)?  unknown,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CameraFailure() when camera != null:
return camera(_that.details);case OcrFailure() when ocr != null:
return ocr(_that.details);case ParsingFailure() when parsing != null:
return parsing(_that.details);case StorageFailure() when storage != null:
return storage(_that.details);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that.permanently,_that.details);case UnknownFailure() when unknown != null:
return unknown(_that.details);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? details)  camera,required TResult Function( String? details)  ocr,required TResult Function( String? details)  parsing,required TResult Function( String? details)  storage,required TResult Function( bool permanently,  String? details)  permissionDenied,required TResult Function( String? details)  unknown,}) {final _that = this;
switch (_that) {
case CameraFailure():
return camera(_that.details);case OcrFailure():
return ocr(_that.details);case ParsingFailure():
return parsing(_that.details);case StorageFailure():
return storage(_that.details);case PermissionDeniedFailure():
return permissionDenied(_that.permanently,_that.details);case UnknownFailure():
return unknown(_that.details);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? details)?  camera,TResult? Function( String? details)?  ocr,TResult? Function( String? details)?  parsing,TResult? Function( String? details)?  storage,TResult? Function( bool permanently,  String? details)?  permissionDenied,TResult? Function( String? details)?  unknown,}) {final _that = this;
switch (_that) {
case CameraFailure() when camera != null:
return camera(_that.details);case OcrFailure() when ocr != null:
return ocr(_that.details);case ParsingFailure() when parsing != null:
return parsing(_that.details);case StorageFailure() when storage != null:
return storage(_that.details);case PermissionDeniedFailure() when permissionDenied != null:
return permissionDenied(_that.permanently,_that.details);case UnknownFailure() when unknown != null:
return unknown(_that.details);case _:
  return null;

}
}

}

/// @nodoc


class CameraFailure extends Failure {
  const CameraFailure([this.details]): super._();
  

@override final  String? details;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraFailureCopyWith<CameraFailure> get copyWith => _$CameraFailureCopyWithImpl<CameraFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraFailure&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'Failure.camera(details: $details)';
}


}

/// @nodoc
abstract mixin class $CameraFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $CameraFailureCopyWith(CameraFailure value, $Res Function(CameraFailure) _then) = _$CameraFailureCopyWithImpl;
@override @useResult
$Res call({
 String? details
});




}
/// @nodoc
class _$CameraFailureCopyWithImpl<$Res>
    implements $CameraFailureCopyWith<$Res> {
  _$CameraFailureCopyWithImpl(this._self, this._then);

  final CameraFailure _self;
  final $Res Function(CameraFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = freezed,}) {
  return _then(CameraFailure(
freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class OcrFailure extends Failure {
  const OcrFailure([this.details]): super._();
  

@override final  String? details;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OcrFailureCopyWith<OcrFailure> get copyWith => _$OcrFailureCopyWithImpl<OcrFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OcrFailure&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'Failure.ocr(details: $details)';
}


}

/// @nodoc
abstract mixin class $OcrFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $OcrFailureCopyWith(OcrFailure value, $Res Function(OcrFailure) _then) = _$OcrFailureCopyWithImpl;
@override @useResult
$Res call({
 String? details
});




}
/// @nodoc
class _$OcrFailureCopyWithImpl<$Res>
    implements $OcrFailureCopyWith<$Res> {
  _$OcrFailureCopyWithImpl(this._self, this._then);

  final OcrFailure _self;
  final $Res Function(OcrFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = freezed,}) {
  return _then(OcrFailure(
freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ParsingFailure extends Failure {
  const ParsingFailure([this.details]): super._();
  

@override final  String? details;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParsingFailureCopyWith<ParsingFailure> get copyWith => _$ParsingFailureCopyWithImpl<ParsingFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParsingFailure&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'Failure.parsing(details: $details)';
}


}

/// @nodoc
abstract mixin class $ParsingFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ParsingFailureCopyWith(ParsingFailure value, $Res Function(ParsingFailure) _then) = _$ParsingFailureCopyWithImpl;
@override @useResult
$Res call({
 String? details
});




}
/// @nodoc
class _$ParsingFailureCopyWithImpl<$Res>
    implements $ParsingFailureCopyWith<$Res> {
  _$ParsingFailureCopyWithImpl(this._self, this._then);

  final ParsingFailure _self;
  final $Res Function(ParsingFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = freezed,}) {
  return _then(ParsingFailure(
freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class StorageFailure extends Failure {
  const StorageFailure([this.details]): super._();
  

@override final  String? details;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StorageFailureCopyWith<StorageFailure> get copyWith => _$StorageFailureCopyWithImpl<StorageFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StorageFailure&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'Failure.storage(details: $details)';
}


}

/// @nodoc
abstract mixin class $StorageFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $StorageFailureCopyWith(StorageFailure value, $Res Function(StorageFailure) _then) = _$StorageFailureCopyWithImpl;
@override @useResult
$Res call({
 String? details
});




}
/// @nodoc
class _$StorageFailureCopyWithImpl<$Res>
    implements $StorageFailureCopyWith<$Res> {
  _$StorageFailureCopyWithImpl(this._self, this._then);

  final StorageFailure _self;
  final $Res Function(StorageFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = freezed,}) {
  return _then(StorageFailure(
freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class PermissionDeniedFailure extends Failure {
  const PermissionDeniedFailure({this.permanently = false, this.details}): super._();
  

@JsonKey() final  bool permanently;
@override final  String? details;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PermissionDeniedFailureCopyWith<PermissionDeniedFailure> get copyWith => _$PermissionDeniedFailureCopyWithImpl<PermissionDeniedFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PermissionDeniedFailure&&(identical(other.permanently, permanently) || other.permanently == permanently)&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,permanently,details);

@override
String toString() {
  return 'Failure.permissionDenied(permanently: $permanently, details: $details)';
}


}

/// @nodoc
abstract mixin class $PermissionDeniedFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $PermissionDeniedFailureCopyWith(PermissionDeniedFailure value, $Res Function(PermissionDeniedFailure) _then) = _$PermissionDeniedFailureCopyWithImpl;
@override @useResult
$Res call({
 bool permanently, String? details
});




}
/// @nodoc
class _$PermissionDeniedFailureCopyWithImpl<$Res>
    implements $PermissionDeniedFailureCopyWith<$Res> {
  _$PermissionDeniedFailureCopyWithImpl(this._self, this._then);

  final PermissionDeniedFailure _self;
  final $Res Function(PermissionDeniedFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? permanently = null,Object? details = freezed,}) {
  return _then(PermissionDeniedFailure(
permanently: null == permanently ? _self.permanently : permanently // ignore: cast_nullable_to_non_nullable
as bool,details: freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnknownFailure extends Failure {
  const UnknownFailure([this.details]): super._();
  

@override final  String? details;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnknownFailureCopyWith<UnknownFailure> get copyWith => _$UnknownFailureCopyWithImpl<UnknownFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnknownFailure&&(identical(other.details, details) || other.details == details));
}


@override
int get hashCode => Object.hash(runtimeType,details);

@override
String toString() {
  return 'Failure.unknown(details: $details)';
}


}

/// @nodoc
abstract mixin class $UnknownFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $UnknownFailureCopyWith(UnknownFailure value, $Res Function(UnknownFailure) _then) = _$UnknownFailureCopyWithImpl;
@override @useResult
$Res call({
 String? details
});




}
/// @nodoc
class _$UnknownFailureCopyWithImpl<$Res>
    implements $UnknownFailureCopyWith<$Res> {
  _$UnknownFailureCopyWithImpl(this._self, this._then);

  final UnknownFailure _self;
  final $Res Function(UnknownFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? details = freezed,}) {
  return _then(UnknownFailure(
freezed == details ? _self.details : details // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
