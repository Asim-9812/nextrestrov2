// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceOrderResponse {

 String get message; OrderIdResult get orderId;
/// Create a copy of PlaceOrderResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderResponseCopyWith<PlaceOrderResponse> get copyWith => _$PlaceOrderResponseCopyWithImpl<PlaceOrderResponse>(this as PlaceOrderResponse, _$identity);

  /// Serializes this PlaceOrderResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,orderId);

@override
String toString() {
  return 'PlaceOrderResponse(message: $message, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderResponseCopyWith<$Res>  {
  factory $PlaceOrderResponseCopyWith(PlaceOrderResponse value, $Res Function(PlaceOrderResponse) _then) = _$PlaceOrderResponseCopyWithImpl;
@useResult
$Res call({
 String message, OrderIdResult orderId
});


$OrderIdResultCopyWith<$Res> get orderId;

}
/// @nodoc
class _$PlaceOrderResponseCopyWithImpl<$Res>
    implements $PlaceOrderResponseCopyWith<$Res> {
  _$PlaceOrderResponseCopyWithImpl(this._self, this._then);

  final PlaceOrderResponse _self;
  final $Res Function(PlaceOrderResponse) _then;

/// Create a copy of PlaceOrderResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,Object? orderId = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as OrderIdResult,
  ));
}
/// Create a copy of PlaceOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderIdResultCopyWith<$Res> get orderId {
  
  return $OrderIdResultCopyWith<$Res>(_self.orderId, (value) {
    return _then(_self.copyWith(orderId: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaceOrderResponse].
extension PlaceOrderResponsePatterns on PlaceOrderResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderResponse value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message,  OrderIdResult orderId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderResponse() when $default != null:
return $default(_that.message,_that.orderId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message,  OrderIdResult orderId)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderResponse():
return $default(_that.message,_that.orderId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message,  OrderIdResult orderId)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderResponse() when $default != null:
return $default(_that.message,_that.orderId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceOrderResponse implements PlaceOrderResponse {
  const _PlaceOrderResponse({required this.message, required this.orderId});
  factory _PlaceOrderResponse.fromJson(Map<String, dynamic> json) => _$PlaceOrderResponseFromJson(json);

@override final  String message;
@override final  OrderIdResult orderId;

/// Create a copy of PlaceOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderResponseCopyWith<_PlaceOrderResponse> get copyWith => __$PlaceOrderResponseCopyWithImpl<_PlaceOrderResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceOrderResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderResponse&&(identical(other.message, message) || other.message == message)&&(identical(other.orderId, orderId) || other.orderId == orderId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message,orderId);

@override
String toString() {
  return 'PlaceOrderResponse(message: $message, orderId: $orderId)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderResponseCopyWith<$Res> implements $PlaceOrderResponseCopyWith<$Res> {
  factory _$PlaceOrderResponseCopyWith(_PlaceOrderResponse value, $Res Function(_PlaceOrderResponse) _then) = __$PlaceOrderResponseCopyWithImpl;
@override @useResult
$Res call({
 String message, OrderIdResult orderId
});


@override $OrderIdResultCopyWith<$Res> get orderId;

}
/// @nodoc
class __$PlaceOrderResponseCopyWithImpl<$Res>
    implements _$PlaceOrderResponseCopyWith<$Res> {
  __$PlaceOrderResponseCopyWithImpl(this._self, this._then);

  final _PlaceOrderResponse _self;
  final $Res Function(_PlaceOrderResponse) _then;

/// Create a copy of PlaceOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,Object? orderId = null,}) {
  return _then(_PlaceOrderResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as OrderIdResult,
  ));
}

/// Create a copy of PlaceOrderResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderIdResultCopyWith<$Res> get orderId {
  
  return $OrderIdResultCopyWith<$Res>(_self.orderId, (value) {
    return _then(_self.copyWith(orderId: value));
  });
}
}


/// @nodoc
mixin _$OrderIdResult {

 int get result; int get id; String? get exception; int get status; bool get isCanceled; bool get isCompleted; bool get isCompletedSuccessfully; int get creationOptions; String? get asyncState; bool get isFaulted;
/// Create a copy of OrderIdResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderIdResultCopyWith<OrderIdResult> get copyWith => _$OrderIdResultCopyWithImpl<OrderIdResult>(this as OrderIdResult, _$identity);

  /// Serializes this OrderIdResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderIdResult&&(identical(other.result, result) || other.result == result)&&(identical(other.id, id) || other.id == id)&&(identical(other.exception, exception) || other.exception == exception)&&(identical(other.status, status) || other.status == status)&&(identical(other.isCanceled, isCanceled) || other.isCanceled == isCanceled)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isCompletedSuccessfully, isCompletedSuccessfully) || other.isCompletedSuccessfully == isCompletedSuccessfully)&&(identical(other.creationOptions, creationOptions) || other.creationOptions == creationOptions)&&(identical(other.asyncState, asyncState) || other.asyncState == asyncState)&&(identical(other.isFaulted, isFaulted) || other.isFaulted == isFaulted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,id,exception,status,isCanceled,isCompleted,isCompletedSuccessfully,creationOptions,asyncState,isFaulted);

@override
String toString() {
  return 'OrderIdResult(result: $result, id: $id, exception: $exception, status: $status, isCanceled: $isCanceled, isCompleted: $isCompleted, isCompletedSuccessfully: $isCompletedSuccessfully, creationOptions: $creationOptions, asyncState: $asyncState, isFaulted: $isFaulted)';
}


}

/// @nodoc
abstract mixin class $OrderIdResultCopyWith<$Res>  {
  factory $OrderIdResultCopyWith(OrderIdResult value, $Res Function(OrderIdResult) _then) = _$OrderIdResultCopyWithImpl;
@useResult
$Res call({
 int result, int id, String? exception, int status, bool isCanceled, bool isCompleted, bool isCompletedSuccessfully, int creationOptions, String? asyncState, bool isFaulted
});




}
/// @nodoc
class _$OrderIdResultCopyWithImpl<$Res>
    implements $OrderIdResultCopyWith<$Res> {
  _$OrderIdResultCopyWithImpl(this._self, this._then);

  final OrderIdResult _self;
  final $Res Function(OrderIdResult) _then;

/// Create a copy of OrderIdResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? id = null,Object? exception = freezed,Object? status = null,Object? isCanceled = null,Object? isCompleted = null,Object? isCompletedSuccessfully = null,Object? creationOptions = null,Object? asyncState = freezed,Object? isFaulted = null,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,isCanceled: null == isCanceled ? _self.isCanceled : isCanceled // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isCompletedSuccessfully: null == isCompletedSuccessfully ? _self.isCompletedSuccessfully : isCompletedSuccessfully // ignore: cast_nullable_to_non_nullable
as bool,creationOptions: null == creationOptions ? _self.creationOptions : creationOptions // ignore: cast_nullable_to_non_nullable
as int,asyncState: freezed == asyncState ? _self.asyncState : asyncState // ignore: cast_nullable_to_non_nullable
as String?,isFaulted: null == isFaulted ? _self.isFaulted : isFaulted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderIdResult].
extension OrderIdResultPatterns on OrderIdResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderIdResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderIdResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderIdResult value)  $default,){
final _that = this;
switch (_that) {
case _OrderIdResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderIdResult value)?  $default,){
final _that = this;
switch (_that) {
case _OrderIdResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int result,  int id,  String? exception,  int status,  bool isCanceled,  bool isCompleted,  bool isCompletedSuccessfully,  int creationOptions,  String? asyncState,  bool isFaulted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderIdResult() when $default != null:
return $default(_that.result,_that.id,_that.exception,_that.status,_that.isCanceled,_that.isCompleted,_that.isCompletedSuccessfully,_that.creationOptions,_that.asyncState,_that.isFaulted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int result,  int id,  String? exception,  int status,  bool isCanceled,  bool isCompleted,  bool isCompletedSuccessfully,  int creationOptions,  String? asyncState,  bool isFaulted)  $default,) {final _that = this;
switch (_that) {
case _OrderIdResult():
return $default(_that.result,_that.id,_that.exception,_that.status,_that.isCanceled,_that.isCompleted,_that.isCompletedSuccessfully,_that.creationOptions,_that.asyncState,_that.isFaulted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int result,  int id,  String? exception,  int status,  bool isCanceled,  bool isCompleted,  bool isCompletedSuccessfully,  int creationOptions,  String? asyncState,  bool isFaulted)?  $default,) {final _that = this;
switch (_that) {
case _OrderIdResult() when $default != null:
return $default(_that.result,_that.id,_that.exception,_that.status,_that.isCanceled,_that.isCompleted,_that.isCompletedSuccessfully,_that.creationOptions,_that.asyncState,_that.isFaulted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderIdResult implements OrderIdResult {
  const _OrderIdResult({required this.result, required this.id, this.exception, required this.status, required this.isCanceled, required this.isCompleted, required this.isCompletedSuccessfully, required this.creationOptions, this.asyncState, required this.isFaulted});
  factory _OrderIdResult.fromJson(Map<String, dynamic> json) => _$OrderIdResultFromJson(json);

@override final  int result;
@override final  int id;
@override final  String? exception;
@override final  int status;
@override final  bool isCanceled;
@override final  bool isCompleted;
@override final  bool isCompletedSuccessfully;
@override final  int creationOptions;
@override final  String? asyncState;
@override final  bool isFaulted;

/// Create a copy of OrderIdResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderIdResultCopyWith<_OrderIdResult> get copyWith => __$OrderIdResultCopyWithImpl<_OrderIdResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderIdResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderIdResult&&(identical(other.result, result) || other.result == result)&&(identical(other.id, id) || other.id == id)&&(identical(other.exception, exception) || other.exception == exception)&&(identical(other.status, status) || other.status == status)&&(identical(other.isCanceled, isCanceled) || other.isCanceled == isCanceled)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.isCompletedSuccessfully, isCompletedSuccessfully) || other.isCompletedSuccessfully == isCompletedSuccessfully)&&(identical(other.creationOptions, creationOptions) || other.creationOptions == creationOptions)&&(identical(other.asyncState, asyncState) || other.asyncState == asyncState)&&(identical(other.isFaulted, isFaulted) || other.isFaulted == isFaulted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,id,exception,status,isCanceled,isCompleted,isCompletedSuccessfully,creationOptions,asyncState,isFaulted);

@override
String toString() {
  return 'OrderIdResult(result: $result, id: $id, exception: $exception, status: $status, isCanceled: $isCanceled, isCompleted: $isCompleted, isCompletedSuccessfully: $isCompletedSuccessfully, creationOptions: $creationOptions, asyncState: $asyncState, isFaulted: $isFaulted)';
}


}

/// @nodoc
abstract mixin class _$OrderIdResultCopyWith<$Res> implements $OrderIdResultCopyWith<$Res> {
  factory _$OrderIdResultCopyWith(_OrderIdResult value, $Res Function(_OrderIdResult) _then) = __$OrderIdResultCopyWithImpl;
@override @useResult
$Res call({
 int result, int id, String? exception, int status, bool isCanceled, bool isCompleted, bool isCompletedSuccessfully, int creationOptions, String? asyncState, bool isFaulted
});




}
/// @nodoc
class __$OrderIdResultCopyWithImpl<$Res>
    implements _$OrderIdResultCopyWith<$Res> {
  __$OrderIdResultCopyWithImpl(this._self, this._then);

  final _OrderIdResult _self;
  final $Res Function(_OrderIdResult) _then;

/// Create a copy of OrderIdResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? id = null,Object? exception = freezed,Object? status = null,Object? isCanceled = null,Object? isCompleted = null,Object? isCompletedSuccessfully = null,Object? creationOptions = null,Object? asyncState = freezed,Object? isFaulted = null,}) {
  return _then(_OrderIdResult(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,exception: freezed == exception ? _self.exception : exception // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int,isCanceled: null == isCanceled ? _self.isCanceled : isCanceled // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,isCompletedSuccessfully: null == isCompletedSuccessfully ? _self.isCompletedSuccessfully : isCompletedSuccessfully // ignore: cast_nullable_to_non_nullable
as bool,creationOptions: null == creationOptions ? _self.creationOptions : creationOptions // ignore: cast_nullable_to_non_nullable
as int,asyncState: freezed == asyncState ? _self.asyncState : asyncState // ignore: cast_nullable_to_non_nullable
as String?,isFaulted: null == isFaulted ? _self.isFaulted : isFaulted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
