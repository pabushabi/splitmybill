// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_assignment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ItemAssignment {

 String get itemId; Map<String, int> get shares;
/// Create a copy of ItemAssignment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ItemAssignmentCopyWith<ItemAssignment> get copyWith => _$ItemAssignmentCopyWithImpl<ItemAssignment>(this as ItemAssignment, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ItemAssignment&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other.shares, shares));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(shares));

@override
String toString() {
  return 'ItemAssignment(itemId: $itemId, shares: $shares)';
}


}

/// @nodoc
abstract mixin class $ItemAssignmentCopyWith<$Res>  {
  factory $ItemAssignmentCopyWith(ItemAssignment value, $Res Function(ItemAssignment) _then) = _$ItemAssignmentCopyWithImpl;
@useResult
$Res call({
 String itemId, Map<String, int> shares
});




}
/// @nodoc
class _$ItemAssignmentCopyWithImpl<$Res>
    implements $ItemAssignmentCopyWith<$Res> {
  _$ItemAssignmentCopyWithImpl(this._self, this._then);

  final ItemAssignment _self;
  final $Res Function(ItemAssignment) _then;

/// Create a copy of ItemAssignment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? shares = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ItemAssignment].
extension ItemAssignmentPatterns on ItemAssignment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ItemAssignment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ItemAssignment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ItemAssignment value)  $default,){
final _that = this;
switch (_that) {
case _ItemAssignment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ItemAssignment value)?  $default,){
final _that = this;
switch (_that) {
case _ItemAssignment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  Map<String, int> shares)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ItemAssignment() when $default != null:
return $default(_that.itemId,_that.shares);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  Map<String, int> shares)  $default,) {final _that = this;
switch (_that) {
case _ItemAssignment():
return $default(_that.itemId,_that.shares);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  Map<String, int> shares)?  $default,) {final _that = this;
switch (_that) {
case _ItemAssignment() when $default != null:
return $default(_that.itemId,_that.shares);case _:
  return null;

}
}

}

/// @nodoc


class _ItemAssignment extends ItemAssignment {
  const _ItemAssignment({required this.itemId, final  Map<String, int> shares = const <String, int>{}}): _shares = shares,super._();
  

@override final  String itemId;
 final  Map<String, int> _shares;
@override@JsonKey() Map<String, int> get shares {
  if (_shares is EqualUnmodifiableMapView) return _shares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_shares);
}


/// Create a copy of ItemAssignment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ItemAssignmentCopyWith<_ItemAssignment> get copyWith => __$ItemAssignmentCopyWithImpl<_ItemAssignment>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ItemAssignment&&(identical(other.itemId, itemId) || other.itemId == itemId)&&const DeepCollectionEquality().equals(other._shares, _shares));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,const DeepCollectionEquality().hash(_shares));

@override
String toString() {
  return 'ItemAssignment(itemId: $itemId, shares: $shares)';
}


}

/// @nodoc
abstract mixin class _$ItemAssignmentCopyWith<$Res> implements $ItemAssignmentCopyWith<$Res> {
  factory _$ItemAssignmentCopyWith(_ItemAssignment value, $Res Function(_ItemAssignment) _then) = __$ItemAssignmentCopyWithImpl;
@override @useResult
$Res call({
 String itemId, Map<String, int> shares
});




}
/// @nodoc
class __$ItemAssignmentCopyWithImpl<$Res>
    implements _$ItemAssignmentCopyWith<$Res> {
  __$ItemAssignmentCopyWithImpl(this._self, this._then);

  final _ItemAssignment _self;
  final $Res Function(_ItemAssignment) _then;

/// Create a copy of ItemAssignment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? shares = null,}) {
  return _then(_ItemAssignment(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,shares: null == shares ? _self._shares : shares // ignore: cast_nullable_to_non_nullable
as Map<String, int>,
  ));
}


}

// dart format on
