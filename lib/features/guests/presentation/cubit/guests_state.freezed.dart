// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guests_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuestsState {

 CubitState get status; List<Guest> get guests; String? get errorMessage;
/// Create a copy of GuestsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestsStateCopyWith<GuestsState> get copyWith => _$GuestsStateCopyWithImpl<GuestsState>(this as GuestsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.guests, guests)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(guests),errorMessage);

@override
String toString() {
  return 'GuestsState(status: $status, guests: $guests, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $GuestsStateCopyWith<$Res>  {
  factory $GuestsStateCopyWith(GuestsState value, $Res Function(GuestsState) _then) = _$GuestsStateCopyWithImpl;
@useResult
$Res call({
 CubitState status, List<Guest> guests, String? errorMessage
});




}
/// @nodoc
class _$GuestsStateCopyWithImpl<$Res>
    implements $GuestsStateCopyWith<$Res> {
  _$GuestsStateCopyWithImpl(this._self, this._then);

  final GuestsState _self;
  final $Res Function(GuestsState) _then;

/// Create a copy of GuestsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? guests = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,guests: null == guests ? _self.guests : guests // ignore: cast_nullable_to_non_nullable
as List<Guest>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [GuestsState].
extension GuestsStatePatterns on GuestsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestsState value)  $default,){
final _that = this;
switch (_that) {
case _GuestsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestsState value)?  $default,){
final _that = this;
switch (_that) {
case _GuestsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CubitState status,  List<Guest> guests,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestsState() when $default != null:
return $default(_that.status,_that.guests,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CubitState status,  List<Guest> guests,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _GuestsState():
return $default(_that.status,_that.guests,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CubitState status,  List<Guest> guests,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _GuestsState() when $default != null:
return $default(_that.status,_that.guests,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _GuestsState extends GuestsState {
  const _GuestsState({this.status = CubitState.initial, final  List<Guest> guests = const <Guest>[], this.errorMessage}): _guests = guests,super._();
  

@override@JsonKey() final  CubitState status;
 final  List<Guest> _guests;
@override@JsonKey() List<Guest> get guests {
  if (_guests is EqualUnmodifiableListView) return _guests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_guests);
}

@override final  String? errorMessage;

/// Create a copy of GuestsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestsStateCopyWith<_GuestsState> get copyWith => __$GuestsStateCopyWithImpl<_GuestsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._guests, _guests)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_guests),errorMessage);

@override
String toString() {
  return 'GuestsState(status: $status, guests: $guests, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$GuestsStateCopyWith<$Res> implements $GuestsStateCopyWith<$Res> {
  factory _$GuestsStateCopyWith(_GuestsState value, $Res Function(_GuestsState) _then) = __$GuestsStateCopyWithImpl;
@override @useResult
$Res call({
 CubitState status, List<Guest> guests, String? errorMessage
});




}
/// @nodoc
class __$GuestsStateCopyWithImpl<$Res>
    implements _$GuestsStateCopyWith<$Res> {
  __$GuestsStateCopyWithImpl(this._self, this._then);

  final _GuestsState _self;
  final $Res Function(_GuestsState) _then;

/// Create a copy of GuestsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? guests = null,Object? errorMessage = freezed,}) {
  return _then(_GuestsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,guests: null == guests ? _self._guests : guests // ignore: cast_nullable_to_non_nullable
as List<Guest>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
