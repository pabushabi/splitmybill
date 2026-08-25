// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryState {

 CubitState get status; List<Bill> get bills; Bill? get selected; List<GuestShare> get selectedShares; String? get errorMessage;
/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryStateCopyWith<HistoryState> get copyWith => _$HistoryStateCopyWithImpl<HistoryState>(this as HistoryState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.bills, bills)&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other.selectedShares, selectedShares)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(bills),selected,const DeepCollectionEquality().hash(selectedShares),errorMessage);

@override
String toString() {
  return 'HistoryState(status: $status, bills: $bills, selected: $selected, selectedShares: $selectedShares, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HistoryStateCopyWith<$Res>  {
  factory $HistoryStateCopyWith(HistoryState value, $Res Function(HistoryState) _then) = _$HistoryStateCopyWithImpl;
@useResult
$Res call({
 CubitState status, List<Bill> bills, Bill? selected, List<GuestShare> selectedShares, String? errorMessage
});


$BillCopyWith<$Res>? get selected;

}
/// @nodoc
class _$HistoryStateCopyWithImpl<$Res>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._self, this._then);

  final HistoryState _self;
  final $Res Function(HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? bills = null,Object? selected = freezed,Object? selectedShares = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as List<Bill>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Bill?,selectedShares: null == selectedShares ? _self.selectedShares : selectedShares // ignore: cast_nullable_to_non_nullable
as List<GuestShare>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $BillCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}


/// Adds pattern-matching-related methods to [HistoryState].
extension HistoryStatePatterns on HistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryState value)  $default,){
final _that = this;
switch (_that) {
case _HistoryState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryState value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CubitState status,  List<Bill> bills,  Bill? selected,  List<GuestShare> selectedShares,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.status,_that.bills,_that.selected,_that.selectedShares,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CubitState status,  List<Bill> bills,  Bill? selected,  List<GuestShare> selectedShares,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HistoryState():
return $default(_that.status,_that.bills,_that.selected,_that.selectedShares,_that.errorMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CubitState status,  List<Bill> bills,  Bill? selected,  List<GuestShare> selectedShares,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HistoryState() when $default != null:
return $default(_that.status,_that.bills,_that.selected,_that.selectedShares,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryState extends HistoryState {
  const _HistoryState({this.status = CubitState.initial, final  List<Bill> bills = const <Bill>[], this.selected, final  List<GuestShare> selectedShares = const <GuestShare>[], this.errorMessage}): _bills = bills,_selectedShares = selectedShares,super._();
  

@override@JsonKey() final  CubitState status;
 final  List<Bill> _bills;
@override@JsonKey() List<Bill> get bills {
  if (_bills is EqualUnmodifiableListView) return _bills;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bills);
}

@override final  Bill? selected;
 final  List<GuestShare> _selectedShares;
@override@JsonKey() List<GuestShare> get selectedShares {
  if (_selectedShares is EqualUnmodifiableListView) return _selectedShares;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedShares);
}

@override final  String? errorMessage;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryStateCopyWith<_HistoryState> get copyWith => __$HistoryStateCopyWithImpl<_HistoryState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._bills, _bills)&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other._selectedShares, _selectedShares)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_bills),selected,const DeepCollectionEquality().hash(_selectedShares),errorMessage);

@override
String toString() {
  return 'HistoryState(status: $status, bills: $bills, selected: $selected, selectedShares: $selectedShares, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HistoryStateCopyWith<$Res> implements $HistoryStateCopyWith<$Res> {
  factory _$HistoryStateCopyWith(_HistoryState value, $Res Function(_HistoryState) _then) = __$HistoryStateCopyWithImpl;
@override @useResult
$Res call({
 CubitState status, List<Bill> bills, Bill? selected, List<GuestShare> selectedShares, String? errorMessage
});


@override $BillCopyWith<$Res>? get selected;

}
/// @nodoc
class __$HistoryStateCopyWithImpl<$Res>
    implements _$HistoryStateCopyWith<$Res> {
  __$HistoryStateCopyWithImpl(this._self, this._then);

  final _HistoryState _self;
  final $Res Function(_HistoryState) _then;

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? bills = null,Object? selected = freezed,Object? selectedShares = null,Object? errorMessage = freezed,}) {
  return _then(_HistoryState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as CubitState,bills: null == bills ? _self._bills : bills // ignore: cast_nullable_to_non_nullable
as List<Bill>,selected: freezed == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as Bill?,selectedShares: null == selectedShares ? _self._selectedShares : selectedShares // ignore: cast_nullable_to_non_nullable
as List<GuestShare>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of HistoryState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BillCopyWith<$Res>? get selected {
    if (_self.selected == null) {
    return null;
  }

  return $BillCopyWith<$Res>(_self.selected!, (value) {
    return _then(_self.copyWith(selected: value));
  });
}
}

// dart format on
