// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 int get guestCount; List<Guest> get selectedGuests; List<Guest> get party;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&const DeepCollectionEquality().equals(other.selectedGuests, selectedGuests)&&const DeepCollectionEquality().equals(other.party, party));
}


@override
int get hashCode => Object.hash(runtimeType,guestCount,const DeepCollectionEquality().hash(selectedGuests),const DeepCollectionEquality().hash(party));

@override
String toString() {
  return 'HomeState(guestCount: $guestCount, selectedGuests: $selectedGuests, party: $party)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 int guestCount, List<Guest> selectedGuests, List<Guest> party
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? guestCount = null,Object? selectedGuests = null,Object? party = null,}) {
  return _then(_self.copyWith(
guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,selectedGuests: null == selectedGuests ? _self.selectedGuests : selectedGuests // ignore: cast_nullable_to_non_nullable
as List<Guest>,party: null == party ? _self.party : party // ignore: cast_nullable_to_non_nullable
as List<Guest>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int guestCount,  List<Guest> selectedGuests,  List<Guest> party)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.guestCount,_that.selectedGuests,_that.party);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int guestCount,  List<Guest> selectedGuests,  List<Guest> party)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.guestCount,_that.selectedGuests,_that.party);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int guestCount,  List<Guest> selectedGuests,  List<Guest> party)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.guestCount,_that.selectedGuests,_that.party);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState extends HomeState {
  const _HomeState({this.guestCount = 2, final  List<Guest> selectedGuests = const <Guest>[], final  List<Guest> party = const <Guest>[]}): _selectedGuests = selectedGuests,_party = party,super._();
  

@override@JsonKey() final  int guestCount;
 final  List<Guest> _selectedGuests;
@override@JsonKey() List<Guest> get selectedGuests {
  if (_selectedGuests is EqualUnmodifiableListView) return _selectedGuests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedGuests);
}

 final  List<Guest> _party;
@override@JsonKey() List<Guest> get party {
  if (_party is EqualUnmodifiableListView) return _party;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_party);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.guestCount, guestCount) || other.guestCount == guestCount)&&const DeepCollectionEquality().equals(other._selectedGuests, _selectedGuests)&&const DeepCollectionEquality().equals(other._party, _party));
}


@override
int get hashCode => Object.hash(runtimeType,guestCount,const DeepCollectionEquality().hash(_selectedGuests),const DeepCollectionEquality().hash(_party));

@override
String toString() {
  return 'HomeState(guestCount: $guestCount, selectedGuests: $selectedGuests, party: $party)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 int guestCount, List<Guest> selectedGuests, List<Guest> party
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? guestCount = null,Object? selectedGuests = null,Object? party = null,}) {
  return _then(_HomeState(
guestCount: null == guestCount ? _self.guestCount : guestCount // ignore: cast_nullable_to_non_nullable
as int,selectedGuests: null == selectedGuests ? _self._selectedGuests : selectedGuests // ignore: cast_nullable_to_non_nullable
as List<Guest>,party: null == party ? _self._party : party // ignore: cast_nullable_to_non_nullable
as List<Guest>,
  ));
}


}

// dart format on
