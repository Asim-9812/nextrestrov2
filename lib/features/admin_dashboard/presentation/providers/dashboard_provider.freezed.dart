// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderStats {

 int get currentShiftOrders; int get lastShiftOrders;
/// Create a copy of OrderStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderStatsCopyWith<OrderStats> get copyWith => _$OrderStatsCopyWithImpl<OrderStats>(this as OrderStats, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderStats&&(identical(other.currentShiftOrders, currentShiftOrders) || other.currentShiftOrders == currentShiftOrders)&&(identical(other.lastShiftOrders, lastShiftOrders) || other.lastShiftOrders == lastShiftOrders));
}


@override
int get hashCode => Object.hash(runtimeType,currentShiftOrders,lastShiftOrders);

@override
String toString() {
  return 'OrderStats(currentShiftOrders: $currentShiftOrders, lastShiftOrders: $lastShiftOrders)';
}


}

/// @nodoc
abstract mixin class $OrderStatsCopyWith<$Res>  {
  factory $OrderStatsCopyWith(OrderStats value, $Res Function(OrderStats) _then) = _$OrderStatsCopyWithImpl;
@useResult
$Res call({
 int currentShiftOrders, int lastShiftOrders
});




}
/// @nodoc
class _$OrderStatsCopyWithImpl<$Res>
    implements $OrderStatsCopyWith<$Res> {
  _$OrderStatsCopyWithImpl(this._self, this._then);

  final OrderStats _self;
  final $Res Function(OrderStats) _then;

/// Create a copy of OrderStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currentShiftOrders = null,Object? lastShiftOrders = null,}) {
  return _then(_self.copyWith(
currentShiftOrders: null == currentShiftOrders ? _self.currentShiftOrders : currentShiftOrders // ignore: cast_nullable_to_non_nullable
as int,lastShiftOrders: null == lastShiftOrders ? _self.lastShiftOrders : lastShiftOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderStats].
extension OrderStatsPatterns on OrderStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderStats value)  $default,){
final _that = this;
switch (_that) {
case _OrderStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderStats value)?  $default,){
final _that = this;
switch (_that) {
case _OrderStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int currentShiftOrders,  int lastShiftOrders)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderStats() when $default != null:
return $default(_that.currentShiftOrders,_that.lastShiftOrders);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int currentShiftOrders,  int lastShiftOrders)  $default,) {final _that = this;
switch (_that) {
case _OrderStats():
return $default(_that.currentShiftOrders,_that.lastShiftOrders);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int currentShiftOrders,  int lastShiftOrders)?  $default,) {final _that = this;
switch (_that) {
case _OrderStats() when $default != null:
return $default(_that.currentShiftOrders,_that.lastShiftOrders);case _:
  return null;

}
}

}

/// @nodoc


class _OrderStats implements OrderStats {
  const _OrderStats({this.currentShiftOrders = 0, this.lastShiftOrders = 0});
  

@override@JsonKey() final  int currentShiftOrders;
@override@JsonKey() final  int lastShiftOrders;

/// Create a copy of OrderStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderStatsCopyWith<_OrderStats> get copyWith => __$OrderStatsCopyWithImpl<_OrderStats>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderStats&&(identical(other.currentShiftOrders, currentShiftOrders) || other.currentShiftOrders == currentShiftOrders)&&(identical(other.lastShiftOrders, lastShiftOrders) || other.lastShiftOrders == lastShiftOrders));
}


@override
int get hashCode => Object.hash(runtimeType,currentShiftOrders,lastShiftOrders);

@override
String toString() {
  return 'OrderStats(currentShiftOrders: $currentShiftOrders, lastShiftOrders: $lastShiftOrders)';
}


}

/// @nodoc
abstract mixin class _$OrderStatsCopyWith<$Res> implements $OrderStatsCopyWith<$Res> {
  factory _$OrderStatsCopyWith(_OrderStats value, $Res Function(_OrderStats) _then) = __$OrderStatsCopyWithImpl;
@override @useResult
$Res call({
 int currentShiftOrders, int lastShiftOrders
});




}
/// @nodoc
class __$OrderStatsCopyWithImpl<$Res>
    implements _$OrderStatsCopyWith<$Res> {
  __$OrderStatsCopyWithImpl(this._self, this._then);

  final _OrderStats _self;
  final $Res Function(_OrderStats) _then;

/// Create a copy of OrderStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currentShiftOrders = null,Object? lastShiftOrders = null,}) {
  return _then(_OrderStats(
currentShiftOrders: null == currentShiftOrders ? _self.currentShiftOrders : currentShiftOrders // ignore: cast_nullable_to_non_nullable
as int,lastShiftOrders: null == lastShiftOrders ? _self.lastShiftOrders : lastShiftOrders // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
