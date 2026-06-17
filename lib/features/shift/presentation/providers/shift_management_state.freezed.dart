// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_management_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ShiftManagementState {

 List<ShiftModel> get shifts; ShiftModel? get selectedShift; String? get selectedShiftOpenerName; String? get selectedShiftCloserName; Map<int, String> get userNames; List<GroupedOrder> get shiftOrders; bool get isLoading; bool get isOrdersLoading;// New flag for targeted loading
 String? get errorMessage;
/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftManagementStateCopyWith<ShiftManagementState> get copyWith => _$ShiftManagementStateCopyWithImpl<ShiftManagementState>(this as ShiftManagementState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftManagementState&&const DeepCollectionEquality().equals(other.shifts, shifts)&&(identical(other.selectedShift, selectedShift) || other.selectedShift == selectedShift)&&(identical(other.selectedShiftOpenerName, selectedShiftOpenerName) || other.selectedShiftOpenerName == selectedShiftOpenerName)&&(identical(other.selectedShiftCloserName, selectedShiftCloserName) || other.selectedShiftCloserName == selectedShiftCloserName)&&const DeepCollectionEquality().equals(other.userNames, userNames)&&const DeepCollectionEquality().equals(other.shiftOrders, shiftOrders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOrdersLoading, isOrdersLoading) || other.isOrdersLoading == isOrdersLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(shifts),selectedShift,selectedShiftOpenerName,selectedShiftCloserName,const DeepCollectionEquality().hash(userNames),const DeepCollectionEquality().hash(shiftOrders),isLoading,isOrdersLoading,errorMessage);

@override
String toString() {
  return 'ShiftManagementState(shifts: $shifts, selectedShift: $selectedShift, selectedShiftOpenerName: $selectedShiftOpenerName, selectedShiftCloserName: $selectedShiftCloserName, userNames: $userNames, shiftOrders: $shiftOrders, isLoading: $isLoading, isOrdersLoading: $isOrdersLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ShiftManagementStateCopyWith<$Res>  {
  factory $ShiftManagementStateCopyWith(ShiftManagementState value, $Res Function(ShiftManagementState) _then) = _$ShiftManagementStateCopyWithImpl;
@useResult
$Res call({
 List<ShiftModel> shifts, ShiftModel? selectedShift, String? selectedShiftOpenerName, String? selectedShiftCloserName, Map<int, String> userNames, List<GroupedOrder> shiftOrders, bool isLoading, bool isOrdersLoading, String? errorMessage
});


$ShiftModelCopyWith<$Res>? get selectedShift;

}
/// @nodoc
class _$ShiftManagementStateCopyWithImpl<$Res>
    implements $ShiftManagementStateCopyWith<$Res> {
  _$ShiftManagementStateCopyWithImpl(this._self, this._then);

  final ShiftManagementState _self;
  final $Res Function(ShiftManagementState) _then;

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shifts = null,Object? selectedShift = freezed,Object? selectedShiftOpenerName = freezed,Object? selectedShiftCloserName = freezed,Object? userNames = null,Object? shiftOrders = null,Object? isLoading = null,Object? isOrdersLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
shifts: null == shifts ? _self.shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<ShiftModel>,selectedShift: freezed == selectedShift ? _self.selectedShift : selectedShift // ignore: cast_nullable_to_non_nullable
as ShiftModel?,selectedShiftOpenerName: freezed == selectedShiftOpenerName ? _self.selectedShiftOpenerName : selectedShiftOpenerName // ignore: cast_nullable_to_non_nullable
as String?,selectedShiftCloserName: freezed == selectedShiftCloserName ? _self.selectedShiftCloserName : selectedShiftCloserName // ignore: cast_nullable_to_non_nullable
as String?,userNames: null == userNames ? _self.userNames : userNames // ignore: cast_nullable_to_non_nullable
as Map<int, String>,shiftOrders: null == shiftOrders ? _self.shiftOrders : shiftOrders // ignore: cast_nullable_to_non_nullable
as List<GroupedOrder>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOrdersLoading: null == isOrdersLoading ? _self.isOrdersLoading : isOrdersLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftModelCopyWith<$Res>? get selectedShift {
    if (_self.selectedShift == null) {
    return null;
  }

  return $ShiftModelCopyWith<$Res>(_self.selectedShift!, (value) {
    return _then(_self.copyWith(selectedShift: value));
  });
}
}


/// Adds pattern-matching-related methods to [ShiftManagementState].
extension ShiftManagementStatePatterns on ShiftManagementState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftManagementState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftManagementState value)  $default,){
final _that = this;
switch (_that) {
case _ShiftManagementState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftManagementState value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ShiftModel> shifts,  ShiftModel? selectedShift,  String? selectedShiftOpenerName,  String? selectedShiftCloserName,  Map<int, String> userNames,  List<GroupedOrder> shiftOrders,  bool isLoading,  bool isOrdersLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
return $default(_that.shifts,_that.selectedShift,_that.selectedShiftOpenerName,_that.selectedShiftCloserName,_that.userNames,_that.shiftOrders,_that.isLoading,_that.isOrdersLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ShiftModel> shifts,  ShiftModel? selectedShift,  String? selectedShiftOpenerName,  String? selectedShiftCloserName,  Map<int, String> userNames,  List<GroupedOrder> shiftOrders,  bool isLoading,  bool isOrdersLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ShiftManagementState():
return $default(_that.shifts,_that.selectedShift,_that.selectedShiftOpenerName,_that.selectedShiftCloserName,_that.userNames,_that.shiftOrders,_that.isLoading,_that.isOrdersLoading,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ShiftModel> shifts,  ShiftModel? selectedShift,  String? selectedShiftOpenerName,  String? selectedShiftCloserName,  Map<int, String> userNames,  List<GroupedOrder> shiftOrders,  bool isLoading,  bool isOrdersLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ShiftManagementState() when $default != null:
return $default(_that.shifts,_that.selectedShift,_that.selectedShiftOpenerName,_that.selectedShiftCloserName,_that.userNames,_that.shiftOrders,_that.isLoading,_that.isOrdersLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ShiftManagementState implements ShiftManagementState {
  const _ShiftManagementState({final  List<ShiftModel> shifts = const [], this.selectedShift, this.selectedShiftOpenerName, this.selectedShiftCloserName, final  Map<int, String> userNames = const {}, final  List<GroupedOrder> shiftOrders = const [], this.isLoading = false, this.isOrdersLoading = false, this.errorMessage}): _shifts = shifts,_userNames = userNames,_shiftOrders = shiftOrders;
  

 final  List<ShiftModel> _shifts;
@override@JsonKey() List<ShiftModel> get shifts {
  if (_shifts is EqualUnmodifiableListView) return _shifts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shifts);
}

@override final  ShiftModel? selectedShift;
@override final  String? selectedShiftOpenerName;
@override final  String? selectedShiftCloserName;
 final  Map<int, String> _userNames;
@override@JsonKey() Map<int, String> get userNames {
  if (_userNames is EqualUnmodifiableMapView) return _userNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_userNames);
}

 final  List<GroupedOrder> _shiftOrders;
@override@JsonKey() List<GroupedOrder> get shiftOrders {
  if (_shiftOrders is EqualUnmodifiableListView) return _shiftOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_shiftOrders);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isOrdersLoading;
// New flag for targeted loading
@override final  String? errorMessage;

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftManagementStateCopyWith<_ShiftManagementState> get copyWith => __$ShiftManagementStateCopyWithImpl<_ShiftManagementState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftManagementState&&const DeepCollectionEquality().equals(other._shifts, _shifts)&&(identical(other.selectedShift, selectedShift) || other.selectedShift == selectedShift)&&(identical(other.selectedShiftOpenerName, selectedShiftOpenerName) || other.selectedShiftOpenerName == selectedShiftOpenerName)&&(identical(other.selectedShiftCloserName, selectedShiftCloserName) || other.selectedShiftCloserName == selectedShiftCloserName)&&const DeepCollectionEquality().equals(other._userNames, _userNames)&&const DeepCollectionEquality().equals(other._shiftOrders, _shiftOrders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isOrdersLoading, isOrdersLoading) || other.isOrdersLoading == isOrdersLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_shifts),selectedShift,selectedShiftOpenerName,selectedShiftCloserName,const DeepCollectionEquality().hash(_userNames),const DeepCollectionEquality().hash(_shiftOrders),isLoading,isOrdersLoading,errorMessage);

@override
String toString() {
  return 'ShiftManagementState(shifts: $shifts, selectedShift: $selectedShift, selectedShiftOpenerName: $selectedShiftOpenerName, selectedShiftCloserName: $selectedShiftCloserName, userNames: $userNames, shiftOrders: $shiftOrders, isLoading: $isLoading, isOrdersLoading: $isOrdersLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ShiftManagementStateCopyWith<$Res> implements $ShiftManagementStateCopyWith<$Res> {
  factory _$ShiftManagementStateCopyWith(_ShiftManagementState value, $Res Function(_ShiftManagementState) _then) = __$ShiftManagementStateCopyWithImpl;
@override @useResult
$Res call({
 List<ShiftModel> shifts, ShiftModel? selectedShift, String? selectedShiftOpenerName, String? selectedShiftCloserName, Map<int, String> userNames, List<GroupedOrder> shiftOrders, bool isLoading, bool isOrdersLoading, String? errorMessage
});


@override $ShiftModelCopyWith<$Res>? get selectedShift;

}
/// @nodoc
class __$ShiftManagementStateCopyWithImpl<$Res>
    implements _$ShiftManagementStateCopyWith<$Res> {
  __$ShiftManagementStateCopyWithImpl(this._self, this._then);

  final _ShiftManagementState _self;
  final $Res Function(_ShiftManagementState) _then;

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shifts = null,Object? selectedShift = freezed,Object? selectedShiftOpenerName = freezed,Object? selectedShiftCloserName = freezed,Object? userNames = null,Object? shiftOrders = null,Object? isLoading = null,Object? isOrdersLoading = null,Object? errorMessage = freezed,}) {
  return _then(_ShiftManagementState(
shifts: null == shifts ? _self._shifts : shifts // ignore: cast_nullable_to_non_nullable
as List<ShiftModel>,selectedShift: freezed == selectedShift ? _self.selectedShift : selectedShift // ignore: cast_nullable_to_non_nullable
as ShiftModel?,selectedShiftOpenerName: freezed == selectedShiftOpenerName ? _self.selectedShiftOpenerName : selectedShiftOpenerName // ignore: cast_nullable_to_non_nullable
as String?,selectedShiftCloserName: freezed == selectedShiftCloserName ? _self.selectedShiftCloserName : selectedShiftCloserName // ignore: cast_nullable_to_non_nullable
as String?,userNames: null == userNames ? _self._userNames : userNames // ignore: cast_nullable_to_non_nullable
as Map<int, String>,shiftOrders: null == shiftOrders ? _self._shiftOrders : shiftOrders // ignore: cast_nullable_to_non_nullable
as List<GroupedOrder>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isOrdersLoading: null == isOrdersLoading ? _self.isOrdersLoading : isOrdersLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of ShiftManagementState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ShiftModelCopyWith<$Res>? get selectedShift {
    if (_self.selectedShift == null) {
    return null;
  }

  return $ShiftModelCopyWith<$Res>(_self.selectedShift!, (value) {
    return _then(_self.copyWith(selectedShift: value));
  });
}
}

// dart format on
