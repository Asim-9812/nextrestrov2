// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderDashboardState {

 List<OrderDetailModel> get completedOrders; List<OrderDetailModel> get pendingOrders; List<OrderDetailModel> get confirmedOrders; List<OrderDetailModel> get readyOrders; List<OrderDetailModel> get cancelledOrders; bool get isLoading; String? get errorMessage;
/// Create a copy of OrderDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDashboardStateCopyWith<OrderDashboardState> get copyWith => _$OrderDashboardStateCopyWithImpl<OrderDashboardState>(this as OrderDashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDashboardState&&const DeepCollectionEquality().equals(other.completedOrders, completedOrders)&&const DeepCollectionEquality().equals(other.pendingOrders, pendingOrders)&&const DeepCollectionEquality().equals(other.confirmedOrders, confirmedOrders)&&const DeepCollectionEquality().equals(other.readyOrders, readyOrders)&&const DeepCollectionEquality().equals(other.cancelledOrders, cancelledOrders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(completedOrders),const DeepCollectionEquality().hash(pendingOrders),const DeepCollectionEquality().hash(confirmedOrders),const DeepCollectionEquality().hash(readyOrders),const DeepCollectionEquality().hash(cancelledOrders),isLoading,errorMessage);

@override
String toString() {
  return 'OrderDashboardState(completedOrders: $completedOrders, pendingOrders: $pendingOrders, confirmedOrders: $confirmedOrders, readyOrders: $readyOrders, cancelledOrders: $cancelledOrders, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $OrderDashboardStateCopyWith<$Res>  {
  factory $OrderDashboardStateCopyWith(OrderDashboardState value, $Res Function(OrderDashboardState) _then) = _$OrderDashboardStateCopyWithImpl;
@useResult
$Res call({
 List<OrderDetailModel> completedOrders, List<OrderDetailModel> pendingOrders, List<OrderDetailModel> confirmedOrders, List<OrderDetailModel> readyOrders, List<OrderDetailModel> cancelledOrders, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$OrderDashboardStateCopyWithImpl<$Res>
    implements $OrderDashboardStateCopyWith<$Res> {
  _$OrderDashboardStateCopyWithImpl(this._self, this._then);

  final OrderDashboardState _self;
  final $Res Function(OrderDashboardState) _then;

/// Create a copy of OrderDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completedOrders = null,Object? pendingOrders = null,Object? confirmedOrders = null,Object? readyOrders = null,Object? cancelledOrders = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
completedOrders: null == completedOrders ? _self.completedOrders : completedOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,pendingOrders: null == pendingOrders ? _self.pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,confirmedOrders: null == confirmedOrders ? _self.confirmedOrders : confirmedOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,readyOrders: null == readyOrders ? _self.readyOrders : readyOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,cancelledOrders: null == cancelledOrders ? _self.cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDashboardState].
extension OrderDashboardStatePatterns on OrderDashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDashboardState value)  $default,){
final _that = this;
switch (_that) {
case _OrderDashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<OrderDetailModel> completedOrders,  List<OrderDetailModel> pendingOrders,  List<OrderDetailModel> confirmedOrders,  List<OrderDetailModel> readyOrders,  List<OrderDetailModel> cancelledOrders,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDashboardState() when $default != null:
return $default(_that.completedOrders,_that.pendingOrders,_that.confirmedOrders,_that.readyOrders,_that.cancelledOrders,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<OrderDetailModel> completedOrders,  List<OrderDetailModel> pendingOrders,  List<OrderDetailModel> confirmedOrders,  List<OrderDetailModel> readyOrders,  List<OrderDetailModel> cancelledOrders,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _OrderDashboardState():
return $default(_that.completedOrders,_that.pendingOrders,_that.confirmedOrders,_that.readyOrders,_that.cancelledOrders,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<OrderDetailModel> completedOrders,  List<OrderDetailModel> pendingOrders,  List<OrderDetailModel> confirmedOrders,  List<OrderDetailModel> readyOrders,  List<OrderDetailModel> cancelledOrders,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _OrderDashboardState() when $default != null:
return $default(_that.completedOrders,_that.pendingOrders,_that.confirmedOrders,_that.readyOrders,_that.cancelledOrders,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _OrderDashboardState implements OrderDashboardState {
  const _OrderDashboardState({final  List<OrderDetailModel> completedOrders = const [], final  List<OrderDetailModel> pendingOrders = const [], final  List<OrderDetailModel> confirmedOrders = const [], final  List<OrderDetailModel> readyOrders = const [], final  List<OrderDetailModel> cancelledOrders = const [], this.isLoading = false, this.errorMessage}): _completedOrders = completedOrders,_pendingOrders = pendingOrders,_confirmedOrders = confirmedOrders,_readyOrders = readyOrders,_cancelledOrders = cancelledOrders;
  

 final  List<OrderDetailModel> _completedOrders;
@override@JsonKey() List<OrderDetailModel> get completedOrders {
  if (_completedOrders is EqualUnmodifiableListView) return _completedOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_completedOrders);
}

 final  List<OrderDetailModel> _pendingOrders;
@override@JsonKey() List<OrderDetailModel> get pendingOrders {
  if (_pendingOrders is EqualUnmodifiableListView) return _pendingOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingOrders);
}

 final  List<OrderDetailModel> _confirmedOrders;
@override@JsonKey() List<OrderDetailModel> get confirmedOrders {
  if (_confirmedOrders is EqualUnmodifiableListView) return _confirmedOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_confirmedOrders);
}

 final  List<OrderDetailModel> _readyOrders;
@override@JsonKey() List<OrderDetailModel> get readyOrders {
  if (_readyOrders is EqualUnmodifiableListView) return _readyOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_readyOrders);
}

 final  List<OrderDetailModel> _cancelledOrders;
@override@JsonKey() List<OrderDetailModel> get cancelledOrders {
  if (_cancelledOrders is EqualUnmodifiableListView) return _cancelledOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cancelledOrders);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of OrderDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDashboardStateCopyWith<_OrderDashboardState> get copyWith => __$OrderDashboardStateCopyWithImpl<_OrderDashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDashboardState&&const DeepCollectionEquality().equals(other._completedOrders, _completedOrders)&&const DeepCollectionEquality().equals(other._pendingOrders, _pendingOrders)&&const DeepCollectionEquality().equals(other._confirmedOrders, _confirmedOrders)&&const DeepCollectionEquality().equals(other._readyOrders, _readyOrders)&&const DeepCollectionEquality().equals(other._cancelledOrders, _cancelledOrders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_completedOrders),const DeepCollectionEquality().hash(_pendingOrders),const DeepCollectionEquality().hash(_confirmedOrders),const DeepCollectionEquality().hash(_readyOrders),const DeepCollectionEquality().hash(_cancelledOrders),isLoading,errorMessage);

@override
String toString() {
  return 'OrderDashboardState(completedOrders: $completedOrders, pendingOrders: $pendingOrders, confirmedOrders: $confirmedOrders, readyOrders: $readyOrders, cancelledOrders: $cancelledOrders, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$OrderDashboardStateCopyWith<$Res> implements $OrderDashboardStateCopyWith<$Res> {
  factory _$OrderDashboardStateCopyWith(_OrderDashboardState value, $Res Function(_OrderDashboardState) _then) = __$OrderDashboardStateCopyWithImpl;
@override @useResult
$Res call({
 List<OrderDetailModel> completedOrders, List<OrderDetailModel> pendingOrders, List<OrderDetailModel> confirmedOrders, List<OrderDetailModel> readyOrders, List<OrderDetailModel> cancelledOrders, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$OrderDashboardStateCopyWithImpl<$Res>
    implements _$OrderDashboardStateCopyWith<$Res> {
  __$OrderDashboardStateCopyWithImpl(this._self, this._then);

  final _OrderDashboardState _self;
  final $Res Function(_OrderDashboardState) _then;

/// Create a copy of OrderDashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completedOrders = null,Object? pendingOrders = null,Object? confirmedOrders = null,Object? readyOrders = null,Object? cancelledOrders = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_OrderDashboardState(
completedOrders: null == completedOrders ? _self._completedOrders : completedOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,pendingOrders: null == pendingOrders ? _self._pendingOrders : pendingOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,confirmedOrders: null == confirmedOrders ? _self._confirmedOrders : confirmedOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,readyOrders: null == readyOrders ? _self._readyOrders : readyOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,cancelledOrders: null == cancelledOrders ? _self._cancelledOrders : cancelledOrders // ignore: cast_nullable_to_non_nullable
as List<OrderDetailModel>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
