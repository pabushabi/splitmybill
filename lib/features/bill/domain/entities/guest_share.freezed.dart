// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'guest_share.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GuestShare {

 Guest get guest; int get subtotalMinor; int get tipMinor; List<ShareLine> get lines;
/// Create a copy of GuestShare
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GuestShareCopyWith<GuestShare> get copyWith => _$GuestShareCopyWithImpl<GuestShare>(this as GuestShare, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GuestShare&&(identical(other.guest, guest) || other.guest == guest)&&(identical(other.subtotalMinor, subtotalMinor) || other.subtotalMinor == subtotalMinor)&&(identical(other.tipMinor, tipMinor) || other.tipMinor == tipMinor)&&const DeepCollectionEquality().equals(other.lines, lines));
}


@override
int get hashCode => Object.hash(runtimeType,guest,subtotalMinor,tipMinor,const DeepCollectionEquality().hash(lines));

@override
String toString() {
  return 'GuestShare(guest: $guest, subtotalMinor: $subtotalMinor, tipMinor: $tipMinor, lines: $lines)';
}


}

/// @nodoc
abstract mixin class $GuestShareCopyWith<$Res>  {
  factory $GuestShareCopyWith(GuestShare value, $Res Function(GuestShare) _then) = _$GuestShareCopyWithImpl;
@useResult
$Res call({
 Guest guest, int subtotalMinor, int tipMinor, List<ShareLine> lines
});


$GuestCopyWith<$Res> get guest;

}
/// @nodoc
class _$GuestShareCopyWithImpl<$Res>
    implements $GuestShareCopyWith<$Res> {
  _$GuestShareCopyWithImpl(this._self, this._then);

  final GuestShare _self;
  final $Res Function(GuestShare) _then;

/// Create a copy of GuestShare
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guest = null,Object? subtotalMinor = null,Object? tipMinor = null,Object? lines = null,}) {
  return _then(_self.copyWith(
guest: null == guest ? _self.guest : guest // ignore: cast_nullable_to_non_nullable
as Guest,subtotalMinor: null == subtotalMinor ? _self.subtotalMinor : subtotalMinor // ignore: cast_nullable_to_non_nullable
as int,tipMinor: null == tipMinor ? _self.tipMinor : tipMinor // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<ShareLine>,
  ));
}
/// Create a copy of GuestShare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuestCopyWith<$Res> get guest {
  
  return $GuestCopyWith<$Res>(_self.guest, (value) {
    return _then(_self.copyWith(guest: value));
  });
}
}


/// Adds pattern-matching-related methods to [GuestShare].
extension GuestSharePatterns on GuestShare {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GuestShare value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GuestShare() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GuestShare value)  $default,){
final _that = this;
switch (_that) {
case _GuestShare():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GuestShare value)?  $default,){
final _that = this;
switch (_that) {
case _GuestShare() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Guest guest,  int subtotalMinor,  int tipMinor,  List<ShareLine> lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GuestShare() when $default != null:
return $default(_that.guest,_that.subtotalMinor,_that.tipMinor,_that.lines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Guest guest,  int subtotalMinor,  int tipMinor,  List<ShareLine> lines)  $default,) {final _that = this;
switch (_that) {
case _GuestShare():
return $default(_that.guest,_that.subtotalMinor,_that.tipMinor,_that.lines);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Guest guest,  int subtotalMinor,  int tipMinor,  List<ShareLine> lines)?  $default,) {final _that = this;
switch (_that) {
case _GuestShare() when $default != null:
return $default(_that.guest,_that.subtotalMinor,_that.tipMinor,_that.lines);case _:
  return null;

}
}

}

/// @nodoc


class _GuestShare extends GuestShare {
  const _GuestShare({required this.guest, required this.subtotalMinor, this.tipMinor = 0, final  List<ShareLine> lines = const <ShareLine>[]}): _lines = lines,super._();
  

@override final  Guest guest;
@override final  int subtotalMinor;
@override@JsonKey() final  int tipMinor;
 final  List<ShareLine> _lines;
@override@JsonKey() List<ShareLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}


/// Create a copy of GuestShare
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GuestShareCopyWith<_GuestShare> get copyWith => __$GuestShareCopyWithImpl<_GuestShare>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GuestShare&&(identical(other.guest, guest) || other.guest == guest)&&(identical(other.subtotalMinor, subtotalMinor) || other.subtotalMinor == subtotalMinor)&&(identical(other.tipMinor, tipMinor) || other.tipMinor == tipMinor)&&const DeepCollectionEquality().equals(other._lines, _lines));
}


@override
int get hashCode => Object.hash(runtimeType,guest,subtotalMinor,tipMinor,const DeepCollectionEquality().hash(_lines));

@override
String toString() {
  return 'GuestShare(guest: $guest, subtotalMinor: $subtotalMinor, tipMinor: $tipMinor, lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$GuestShareCopyWith<$Res> implements $GuestShareCopyWith<$Res> {
  factory _$GuestShareCopyWith(_GuestShare value, $Res Function(_GuestShare) _then) = __$GuestShareCopyWithImpl;
@override @useResult
$Res call({
 Guest guest, int subtotalMinor, int tipMinor, List<ShareLine> lines
});


@override $GuestCopyWith<$Res> get guest;

}
/// @nodoc
class __$GuestShareCopyWithImpl<$Res>
    implements _$GuestShareCopyWith<$Res> {
  __$GuestShareCopyWithImpl(this._self, this._then);

  final _GuestShare _self;
  final $Res Function(_GuestShare) _then;

/// Create a copy of GuestShare
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guest = null,Object? subtotalMinor = null,Object? tipMinor = null,Object? lines = null,}) {
  return _then(_GuestShare(
guest: null == guest ? _self.guest : guest // ignore: cast_nullable_to_non_nullable
as Guest,subtotalMinor: null == subtotalMinor ? _self.subtotalMinor : subtotalMinor // ignore: cast_nullable_to_non_nullable
as int,tipMinor: null == tipMinor ? _self.tipMinor : tipMinor // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<ShareLine>,
  ));
}

/// Create a copy of GuestShare
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GuestCopyWith<$Res> get guest {
  
  return $GuestCopyWith<$Res>(_self.guest, (value) {
    return _then(_self.copyWith(guest: value));
  });
}
}

// dart format on
