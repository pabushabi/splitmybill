// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capture_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CaptureState {

 CubitState get status; bool get isPermissionGranted; bool get isPermissionPermanentlyDenied; bool get isRecognizing;/// Снимок, выбранный из галереи и требующий перехода к обрезке.
 String? get pickedImagePath; ParsedReceipt? get receipt; String? get errorMessage;
/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaptureStateCopyWith<CaptureState> get copyWith => _$CaptureStateCopyWithImpl<CaptureState>(this as CaptureState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaptureState&&(identical(other.status, status) || other.status == status)&&(identical(other.isPermissionGranted, isPermissionGranted) || other.isPermissionGranted == isPermissionGranted)&&(identical(other.isPermissionPermanentlyDenied, isPermissionPermanentlyDenied) || other.isPermissionPermanentlyDenied == isPermissionPermanentlyDenied)&&(identical(other.isRecognizing, isRecognizing) || other.isRecognizing == isRecognizing)&&(identical(other.pickedImagePath, pickedImagePath) || other.pickedImagePath == pickedImagePath)&&(identical(other.receipt, receipt) || other.receipt == receipt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isPermissionGranted,isPermissionPermanentlyDenied,isRecognizing,pickedImagePath,receipt,errorMessage);

@override
String toString() {
  return 'CaptureState(status: $status, isPermissionGranted: $isPermissionGranted, isPermissionPermanentlyDenied: $isPermissionPermanentlyDenied, isRecognizing: $isRecognizing, pickedImagePath: $pickedImagePath, receipt: $receipt, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CaptureStateCopyWith<$Res>  {
  factory $CaptureStateCopyWith(CaptureState value, $Res Function(CaptureState) _then) = _$CaptureStateCopyWithImpl;
@useResult
$Res call({
 CubitState status, bool isPermissionGranted, bool isPermissionPermanentlyDenied, bool isRecognizing, String? pickedImagePath, ParsedReceipt? receipt, String? errorMessage
});


$ParsedReceiptCopyWith<$Res>? get receipt;

}
/// @nodoc
class _$CaptureStateCopyWithImpl<$Res>
    implements $CaptureStateCopyWith<$Res> {
  _$CaptureStateCopyWithImpl(this._self, this._then);

  final CaptureState _self;
  final $Res Function(CaptureState) _then;

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? isPermissionGranted = null,Object? isPermissionPermanentlyDenied = null,Object? isRecognizing = null,Object? pickedImagePath = freezed,Object? receipt = freezed,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,isPermissionGranted: null == isPermissionGranted ? _self.isPermissionGranted : isPermissionGranted // ignore: cast_nullable_to_non_nullable
as bool,isPermissionPermanentlyDenied: null == isPermissionPermanentlyDenied ? _self.isPermissionPermanentlyDenied : isPermissionPermanentlyDenied // ignore: cast_nullable_to_non_nullable
as bool,isRecognizing: null == isRecognizing ? _self.isRecognizing : isRecognizing // ignore: cast_nullable_to_non_nullable
as bool,pickedImagePath: freezed == pickedImagePath ? _self.pickedImagePath : pickedImagePath // ignore: cast_nullable_to_non_nullable
as String?,receipt: freezed == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as ParsedReceipt?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedReceiptCopyWith<$Res>? get receipt {
    if (_self.receipt == null) {
    return null;
  }

  return $ParsedReceiptCopyWith<$Res>(_self.receipt!, (value) {
    return _then(_self.copyWith(receipt: value));
  });
}
}


/// Adds pattern-matching-related methods to [CaptureState].
extension CaptureStatePatterns on CaptureState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaptureState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaptureState value)  $default,){
final _that = this;
switch (_that) {
case _CaptureState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaptureState value)?  $default,){
final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CubitState status,  bool isPermissionGranted,  bool isPermissionPermanentlyDenied,  bool isRecognizing,  String? pickedImagePath,  ParsedReceipt? receipt,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
return $default(_that.status,_that.isPermissionGranted,_that.isPermissionPermanentlyDenied,_that.isRecognizing,_that.pickedImagePath,_that.receipt,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CubitState status,  bool isPermissionGranted,  bool isPermissionPermanentlyDenied,  bool isRecognizing,  String? pickedImagePath,  ParsedReceipt? receipt,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CaptureState():
return $default(_that.status,_that.isPermissionGranted,_that.isPermissionPermanentlyDenied,_that.isRecognizing,_that.pickedImagePath,_that.receipt,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CubitState status,  bool isPermissionGranted,  bool isPermissionPermanentlyDenied,  bool isRecognizing,  String? pickedImagePath,  ParsedReceipt? receipt,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CaptureState() when $default != null:
return $default(_that.status,_that.isPermissionGranted,_that.isPermissionPermanentlyDenied,_that.isRecognizing,_that.pickedImagePath,_that.receipt,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CaptureState extends CaptureState {
  const _CaptureState({this.status = CubitState.initial, this.isPermissionGranted = false, this.isPermissionPermanentlyDenied = false, this.isRecognizing = false, this.pickedImagePath, this.receipt, this.errorMessage}): super._();
  

@override@JsonKey() final  CubitState status;
@override@JsonKey() final  bool isPermissionGranted;
@override@JsonKey() final  bool isPermissionPermanentlyDenied;
@override@JsonKey() final  bool isRecognizing;
/// Снимок, выбранный из галереи и требующий перехода к обрезке.
@override final  String? pickedImagePath;
@override final  ParsedReceipt? receipt;
@override final  String? errorMessage;

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaptureStateCopyWith<_CaptureState> get copyWith => __$CaptureStateCopyWithImpl<_CaptureState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaptureState&&(identical(other.status, status) || other.status == status)&&(identical(other.isPermissionGranted, isPermissionGranted) || other.isPermissionGranted == isPermissionGranted)&&(identical(other.isPermissionPermanentlyDenied, isPermissionPermanentlyDenied) || other.isPermissionPermanentlyDenied == isPermissionPermanentlyDenied)&&(identical(other.isRecognizing, isRecognizing) || other.isRecognizing == isRecognizing)&&(identical(other.pickedImagePath, pickedImagePath) || other.pickedImagePath == pickedImagePath)&&(identical(other.receipt, receipt) || other.receipt == receipt)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,isPermissionGranted,isPermissionPermanentlyDenied,isRecognizing,pickedImagePath,receipt,errorMessage);

@override
String toString() {
  return 'CaptureState(status: $status, isPermissionGranted: $isPermissionGranted, isPermissionPermanentlyDenied: $isPermissionPermanentlyDenied, isRecognizing: $isRecognizing, pickedImagePath: $pickedImagePath, receipt: $receipt, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CaptureStateCopyWith<$Res> implements $CaptureStateCopyWith<$Res> {
  factory _$CaptureStateCopyWith(_CaptureState value, $Res Function(_CaptureState) _then) = __$CaptureStateCopyWithImpl;
@override @useResult
$Res call({
 CubitState status, bool isPermissionGranted, bool isPermissionPermanentlyDenied, bool isRecognizing, String? pickedImagePath, ParsedReceipt? receipt, String? errorMessage
});


@override $ParsedReceiptCopyWith<$Res>? get receipt;

}
/// @nodoc
class __$CaptureStateCopyWithImpl<$Res>
    implements _$CaptureStateCopyWith<$Res> {
  __$CaptureStateCopyWithImpl(this._self, this._then);

  final _CaptureState _self;
  final $Res Function(_CaptureState) _then;

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? isPermissionGranted = null,Object? isPermissionPermanentlyDenied = null,Object? isRecognizing = null,Object? pickedImagePath = freezed,Object? receipt = freezed,Object? errorMessage = freezed,}) {
  return _then(_CaptureState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,isPermissionGranted: null == isPermissionGranted ? _self.isPermissionGranted : isPermissionGranted // ignore: cast_nullable_to_non_nullable
as bool,isPermissionPermanentlyDenied: null == isPermissionPermanentlyDenied ? _self.isPermissionPermanentlyDenied : isPermissionPermanentlyDenied // ignore: cast_nullable_to_non_nullable
as bool,isRecognizing: null == isRecognizing ? _self.isRecognizing : isRecognizing // ignore: cast_nullable_to_non_nullable
as bool,pickedImagePath: freezed == pickedImagePath ? _self.pickedImagePath : pickedImagePath // ignore: cast_nullable_to_non_nullable
as String?,receipt: freezed == receipt ? _self.receipt : receipt // ignore: cast_nullable_to_non_nullable
as ParsedReceipt?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CaptureState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ParsedReceiptCopyWith<$Res>? get receipt {
    if (_self.receipt == null) {
    return null;
  }

  return $ParsedReceiptCopyWith<$Res>(_self.receipt!, (value) {
    return _then(_self.copyWith(receipt: value));
  });
}
}

// dart format on
