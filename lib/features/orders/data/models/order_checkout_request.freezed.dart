// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_checkout_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderCheckoutRequest {

 int get orderId; int get paymentMethod; double get discount; List<SplitPayment>? get splitPayments;
/// Create a copy of OrderCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderCheckoutRequestCopyWith<OrderCheckoutRequest> get copyWith => _$OrderCheckoutRequestCopyWithImpl<OrderCheckoutRequest>(this as OrderCheckoutRequest, _$identity);

  /// Serializes this OrderCheckoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderCheckoutRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.discount, discount) || other.discount == discount)&&const DeepCollectionEquality().equals(other.splitPayments, splitPayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,paymentMethod,discount,const DeepCollectionEquality().hash(splitPayments));

@override
String toString() {
  return 'OrderCheckoutRequest(orderId: $orderId, paymentMethod: $paymentMethod, discount: $discount, splitPayments: $splitPayments)';
}


}

/// @nodoc
abstract mixin class $OrderCheckoutRequestCopyWith<$Res>  {
  factory $OrderCheckoutRequestCopyWith(OrderCheckoutRequest value, $Res Function(OrderCheckoutRequest) _then) = _$OrderCheckoutRequestCopyWithImpl;
@useResult
$Res call({
 int orderId, int paymentMethod, double discount, List<SplitPayment>? splitPayments
});




}
/// @nodoc
class _$OrderCheckoutRequestCopyWithImpl<$Res>
    implements $OrderCheckoutRequestCopyWith<$Res> {
  _$OrderCheckoutRequestCopyWithImpl(this._self, this._then);

  final OrderCheckoutRequest _self;
  final $Res Function(OrderCheckoutRequest) _then;

/// Create a copy of OrderCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? paymentMethod = null,Object? discount = null,Object? splitPayments = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,splitPayments: freezed == splitPayments ? _self.splitPayments : splitPayments // ignore: cast_nullable_to_non_nullable
as List<SplitPayment>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderCheckoutRequest].
extension OrderCheckoutRequestPatterns on OrderCheckoutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderCheckoutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderCheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderCheckoutRequest value)  $default,){
final _that = this;
switch (_that) {
case _OrderCheckoutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderCheckoutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OrderCheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderId,  int paymentMethod,  double discount,  List<SplitPayment>? splitPayments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderCheckoutRequest() when $default != null:
return $default(_that.orderId,_that.paymentMethod,_that.discount,_that.splitPayments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderId,  int paymentMethod,  double discount,  List<SplitPayment>? splitPayments)  $default,) {final _that = this;
switch (_that) {
case _OrderCheckoutRequest():
return $default(_that.orderId,_that.paymentMethod,_that.discount,_that.splitPayments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderId,  int paymentMethod,  double discount,  List<SplitPayment>? splitPayments)?  $default,) {final _that = this;
switch (_that) {
case _OrderCheckoutRequest() when $default != null:
return $default(_that.orderId,_that.paymentMethod,_that.discount,_that.splitPayments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderCheckoutRequest implements OrderCheckoutRequest {
  const _OrderCheckoutRequest({required this.orderId, required this.paymentMethod, required this.discount, final  List<SplitPayment>? splitPayments}): _splitPayments = splitPayments;
  factory _OrderCheckoutRequest.fromJson(Map<String, dynamic> json) => _$OrderCheckoutRequestFromJson(json);

@override final  int orderId;
@override final  int paymentMethod;
@override final  double discount;
 final  List<SplitPayment>? _splitPayments;
@override List<SplitPayment>? get splitPayments {
  final value = _splitPayments;
  if (value == null) return null;
  if (_splitPayments is EqualUnmodifiableListView) return _splitPayments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OrderCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderCheckoutRequestCopyWith<_OrderCheckoutRequest> get copyWith => __$OrderCheckoutRequestCopyWithImpl<_OrderCheckoutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderCheckoutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderCheckoutRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.discount, discount) || other.discount == discount)&&const DeepCollectionEquality().equals(other._splitPayments, _splitPayments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,paymentMethod,discount,const DeepCollectionEquality().hash(_splitPayments));

@override
String toString() {
  return 'OrderCheckoutRequest(orderId: $orderId, paymentMethod: $paymentMethod, discount: $discount, splitPayments: $splitPayments)';
}


}

/// @nodoc
abstract mixin class _$OrderCheckoutRequestCopyWith<$Res> implements $OrderCheckoutRequestCopyWith<$Res> {
  factory _$OrderCheckoutRequestCopyWith(_OrderCheckoutRequest value, $Res Function(_OrderCheckoutRequest) _then) = __$OrderCheckoutRequestCopyWithImpl;
@override @useResult
$Res call({
 int orderId, int paymentMethod, double discount, List<SplitPayment>? splitPayments
});




}
/// @nodoc
class __$OrderCheckoutRequestCopyWithImpl<$Res>
    implements _$OrderCheckoutRequestCopyWith<$Res> {
  __$OrderCheckoutRequestCopyWithImpl(this._self, this._then);

  final _OrderCheckoutRequest _self;
  final $Res Function(_OrderCheckoutRequest) _then;

/// Create a copy of OrderCheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? paymentMethod = null,Object? discount = null,Object? splitPayments = freezed,}) {
  return _then(_OrderCheckoutRequest(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,splitPayments: freezed == splitPayments ? _self._splitPayments : splitPayments // ignore: cast_nullable_to_non_nullable
as List<SplitPayment>?,
  ));
}


}


/// @nodoc
mixin _$SplitPayment {

 int get paymentMethod; double get amount;
/// Create a copy of SplitPayment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplitPaymentCopyWith<SplitPayment> get copyWith => _$SplitPaymentCopyWithImpl<SplitPayment>(this as SplitPayment, _$identity);

  /// Serializes this SplitPayment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplitPayment&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethod,amount);

@override
String toString() {
  return 'SplitPayment(paymentMethod: $paymentMethod, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $SplitPaymentCopyWith<$Res>  {
  factory $SplitPaymentCopyWith(SplitPayment value, $Res Function(SplitPayment) _then) = _$SplitPaymentCopyWithImpl;
@useResult
$Res call({
 int paymentMethod, double amount
});




}
/// @nodoc
class _$SplitPaymentCopyWithImpl<$Res>
    implements $SplitPaymentCopyWith<$Res> {
  _$SplitPaymentCopyWithImpl(this._self, this._then);

  final SplitPayment _self;
  final $Res Function(SplitPayment) _then;

/// Create a copy of SplitPayment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentMethod = null,Object? amount = null,}) {
  return _then(_self.copyWith(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SplitPayment].
extension SplitPaymentPatterns on SplitPayment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SplitPayment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SplitPayment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SplitPayment value)  $default,){
final _that = this;
switch (_that) {
case _SplitPayment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SplitPayment value)?  $default,){
final _that = this;
switch (_that) {
case _SplitPayment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int paymentMethod,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SplitPayment() when $default != null:
return $default(_that.paymentMethod,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int paymentMethod,  double amount)  $default,) {final _that = this;
switch (_that) {
case _SplitPayment():
return $default(_that.paymentMethod,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int paymentMethod,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _SplitPayment() when $default != null:
return $default(_that.paymentMethod,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SplitPayment implements SplitPayment {
  const _SplitPayment({required this.paymentMethod, required this.amount});
  factory _SplitPayment.fromJson(Map<String, dynamic> json) => _$SplitPaymentFromJson(json);

@override final  int paymentMethod;
@override final  double amount;

/// Create a copy of SplitPayment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SplitPaymentCopyWith<_SplitPayment> get copyWith => __$SplitPaymentCopyWithImpl<_SplitPayment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SplitPaymentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SplitPayment&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentMethod,amount);

@override
String toString() {
  return 'SplitPayment(paymentMethod: $paymentMethod, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$SplitPaymentCopyWith<$Res> implements $SplitPaymentCopyWith<$Res> {
  factory _$SplitPaymentCopyWith(_SplitPayment value, $Res Function(_SplitPayment) _then) = __$SplitPaymentCopyWithImpl;
@override @useResult
$Res call({
 int paymentMethod, double amount
});




}
/// @nodoc
class __$SplitPaymentCopyWithImpl<$Res>
    implements _$SplitPaymentCopyWith<$Res> {
  __$SplitPaymentCopyWithImpl(this._self, this._then);

  final _SplitPayment _self;
  final $Res Function(_SplitPayment) _then;

/// Create a copy of SplitPayment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentMethod = null,Object? amount = null,}) {
  return _then(_SplitPayment(
paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
