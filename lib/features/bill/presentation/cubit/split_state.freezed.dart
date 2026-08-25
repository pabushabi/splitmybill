// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplitState {

 CubitState get status; Bill? get bill; List<GuestShare> get shares;/// Гости, выбранные на главном экране до сканирования чека.
 List<Guest> get preparedGuests;/// Гость, на которого уходят блюда при быстром нажатии по списку.
 String? get selectedGuestId; bool get isSaved; String? get errorMessage;
/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitStateCopyWith<SplitState> get copyWith => _$SplitStateCopyWithImpl<SplitState>(this as SplitState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitState&&(identical(other.status, status) || other.status == status)&&(identical(other.bill, bill) || other.bill == bill)&&const DeepCollectionEquality().equals(other.shares, shares)&&const DeepCollectionEquality().equals(other.preparedGuests, preparedGuests)&&(identical(other.selectedGuestId, selectedGuestId) || other.selectedGuestId == selectedGuestId)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,bill,const DeepCollectionEquality().hash(shares),const DeepCollectionEquality().hash(preparedGuests),selectedGuestId,isSaved,errorMessage);

@override
String toString() {
  return 'SplitState(status: $status, bill: $bill, shares: $shares, preparedGuests: $preparedGuests, selectedGuestId: $selectedGuestId, isSaved: $isSaved, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SplitStateCopyWith<$Res>  {
  factory $SplitStateCopyWith(SplitState value, $Res Function(SplitState) _then) = _$SplitStateCopyWithImpl;
@useResult
$Res call({
 CubitState status, Bill? bill, List<GuestShare> shares, List<Guest> preparedGuests, String? selectedGuestId, bool isSaved, String? errorMessage
});


$BillCopyWith<$Res>? get bill;

}
/// @nodoc
class _$SplitStateCopyWithImpl<$Res>
    implements $SplitStateCopyWith<$Res> {
  _$SplitStateCopyWithImpl(this._self, this._then);

  final SplitState _self;
  final $Res Function(SplitState) _then;

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? bill = freezed,Object? shares = null,Object? preparedGuests = null,Object? selectedGuestId = freezed,Object? isSaved = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,bill: freezed == bill ? _self.bill : bill // ignore: cast_nullable_to_non_nullable
as Bill?,shares: null == shares ? _self.shares : shares // ignore: cast_nullable_to_non_nullable
as List<GuestShare>,preparedGuests: null == preparedGuests ? _self.preparedGuests : preparedGuests // ignore: cast_nullable_to_non_nullable
as List<Guest>,selectedGuestId: freezed == selectedGuestId ? _self.selectedGuestId : selectedGuestId // ignore: cast_nullable_to_non_nullable
as String?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillCopyWith<$Res>? get bill {
    if (_self.bill == null) {
    return null;
  }

  return $BillCopyWith<$Res>(_self.bill!, (value) {
    return _then(_self.copyWith(bill: value));
  });
}
}


/// Adds pattern-matching-related methods to [SplitState].
extension SplitStatePatterns on SplitState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplitState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplitState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplitState value)  $default,){
final _that = this;
switch (_that) {
case _SplitState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplitState value)?  $default,){
final _that = this;
switch (_that) {
case _SplitState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CubitState status,  Bill? bill,  List<GuestShare> shares,  List<Guest> preparedGuests,  String? selectedGuestId,  bool isSaved,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplitState() when $default != null:
return $default(_that.status,_that.bill,_that.shares,_that.preparedGuests,_that.selectedGuestId,_that.isSaved,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CubitState status,  Bill? bill,  List<GuestShare> shares,  List<Guest> preparedGuests,  String? selectedGuestId,  bool isSaved,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SplitState():
return $default(_that.status,_that.bill,_that.shares,_that.preparedGuests,_that.selectedGuestId,_that.isSaved,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CubitState status,  Bill? bill,  List<GuestShare> shares,  List<Guest> preparedGuests,  String? selectedGuestId,  bool isSaved,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SplitState() when $default != null:
return $default(_that.status,_that.bill,_that.shares,_that.preparedGuests,_that.selectedGuestId,_that.isSaved,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SplitState extends SplitState {
  const _SplitState({this.status = CubitState.initial, this.bill, final  List<GuestShare> shares = const <GuestShare>[], final  List<Guest> preparedGuests = const <Guest>[], this.selectedGuestId, this.isSaved = false, this.errorMessage}): _shares = shares,_preparedGuests = preparedGuests,super._();
  

@override@JsonKey() final  CubitState status;
@override final  Bill? bill;
 final  List<GuestShare> _shares;
@override@JsonKey() List<GuestShare> get shares {
  if (_shares is EqualUnmodifiableListView) return _shares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shares);
}

/// Гости, выбранные на главном экране до сканирования чека.
 final  List<Guest> _preparedGuests;
/// Гости, выбранные на главном экране до сканирования чека.
@override@JsonKey() List<Guest> get preparedGuests {
  if (_preparedGuests is EqualUnmodifiableListView) return _preparedGuests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_preparedGuests);
}

/// Гость, на которого уходят блюда при быстром нажатии по списку.
@override final  String? selectedGuestId;
@override@JsonKey() final  bool isSaved;
@override final  String? errorMessage;

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplitStateCopyWith<_SplitState> get copyWith => __$SplitStateCopyWithImpl<_SplitState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplitState&&(identical(other.status, status) || other.status == status)&&(identical(other.bill, bill) || other.bill == bill)&&const DeepCollectionEquality().equals(other._shares, _shares)&&const DeepCollectionEquality().equals(other._preparedGuests, _preparedGuests)&&(identical(other.selectedGuestId, selectedGuestId) || other.selectedGuestId == selectedGuestId)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,bill,const DeepCollectionEquality().hash(_shares),const DeepCollectionEquality().hash(_preparedGuests),selectedGuestId,isSaved,errorMessage);

@override
String toString() {
  return 'SplitState(status: $status, bill: $bill, shares: $shares, preparedGuests: $preparedGuests, selectedGuestId: $selectedGuestId, isSaved: $isSaved, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SplitStateCopyWith<$Res> implements $SplitStateCopyWith<$Res> {
  factory _$SplitStateCopyWith(_SplitState value, $Res Function(_SplitState) _then) = __$SplitStateCopyWithImpl;
@override @useResult
$Res call({
 CubitState status, Bill? bill, List<GuestShare> shares, List<Guest> preparedGuests, String? selectedGuestId, bool isSaved, String? errorMessage
});


@override $BillCopyWith<$Res>? get bill;

}
/// @nodoc
class __$SplitStateCopyWithImpl<$Res>
    implements _$SplitStateCopyWith<$Res> {
  __$SplitStateCopyWithImpl(this._self, this._then);

  final _SplitState _self;
  final $Res Function(_SplitState) _then;

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? bill = freezed,Object? shares = null,Object? preparedGuests = null,Object? selectedGuestId = freezed,Object? isSaved = null,Object? errorMessage = freezed,}) {
  return _then(_SplitState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,bill: freezed == bill ? _self.bill : bill // ignore: cast_nullable_to_non_nullable
as Bill?,shares: null == shares ? _self._shares : shares // ignore: cast_nullable_to_non_nullable
as List<GuestShare>,preparedGuests: null == preparedGuests ? _self._preparedGuests : preparedGuests // ignore: cast_nullable_to_non_nullable
as List<Guest>,selectedGuestId: freezed == selectedGuestId ? _self.selectedGuestId : selectedGuestId // ignore: cast_nullable_to_non_nullable
as String?,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of SplitState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillCopyWith<$Res>? get bill {
    if (_self.bill == null) {
    return null;
  }

  return $BillCopyWith<$Res>(_self.bill!, (value) {
    return _then(_self.copyWith(bill: value));
  });
}
}

// dart format on
