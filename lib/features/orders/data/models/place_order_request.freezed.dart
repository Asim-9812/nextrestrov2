// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceOrderRequest {

 int get customerId; int get tableId; int get waiterId; String get orderType; List<PlaceOrderItem> get items;
/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderRequestCopyWith<PlaceOrderRequest> get copyWith => _$PlaceOrderRequestCopyWithImpl<PlaceOrderRequest>(this as PlaceOrderRequest, _$identity);

  /// Serializes this PlaceOrderRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.waiterId, waiterId) || other.waiterId == waiterId)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,tableId,waiterId,orderType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'PlaceOrderRequest(customerId: $customerId, tableId: $tableId, waiterId: $waiterId, orderType: $orderType, items: $items)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderRequestCopyWith<$Res>  {
  factory $PlaceOrderRequestCopyWith(PlaceOrderRequest value, $Res Function(PlaceOrderRequest) _then) = _$PlaceOrderRequestCopyWithImpl;
@useResult
$Res call({
 int customerId, int tableId, int waiterId, String orderType, List<PlaceOrderItem> items
});




}
/// @nodoc
class _$PlaceOrderRequestCopyWithImpl<$Res>
    implements $PlaceOrderRequestCopyWith<$Res> {
  _$PlaceOrderRequestCopyWithImpl(this._self, this._then);

  final PlaceOrderRequest _self;
  final $Res Function(PlaceOrderRequest) _then;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerId = null,Object? tableId = null,Object? waiterId = null,Object? orderType = null,Object? items = null,}) {
  return _then(_self.copyWith(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as int,waiterId: null == waiterId ? _self.waiterId : waiterId // ignore: cast_nullable_to_non_nullable
as int,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PlaceOrderItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceOrderRequest].
extension PlaceOrderRequestPatterns on PlaceOrderRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderRequest value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int customerId,  int tableId,  int waiterId,  String orderType,  List<PlaceOrderItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
return $default(_that.customerId,_that.tableId,_that.waiterId,_that.orderType,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int customerId,  int tableId,  int waiterId,  String orderType,  List<PlaceOrderItem> items)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequest():
return $default(_that.customerId,_that.tableId,_that.waiterId,_that.orderType,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int customerId,  int tableId,  int waiterId,  String orderType,  List<PlaceOrderItem> items)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderRequest() when $default != null:
return $default(_that.customerId,_that.tableId,_that.waiterId,_that.orderType,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceOrderRequest implements PlaceOrderRequest {
  const _PlaceOrderRequest({required this.customerId, required this.tableId, required this.waiterId, required this.orderType, required final  List<PlaceOrderItem> items}): _items = items;
  factory _PlaceOrderRequest.fromJson(Map<String, dynamic> json) => _$PlaceOrderRequestFromJson(json);

@override final  int customerId;
@override final  int tableId;
@override final  int waiterId;
@override final  String orderType;
 final  List<PlaceOrderItem> _items;
@override List<PlaceOrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderRequestCopyWith<_PlaceOrderRequest> get copyWith => __$PlaceOrderRequestCopyWithImpl<_PlaceOrderRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceOrderRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderRequest&&(identical(other.customerId, customerId) || other.customerId == customerId)&&(identical(other.tableId, tableId) || other.tableId == tableId)&&(identical(other.waiterId, waiterId) || other.waiterId == waiterId)&&(identical(other.orderType, orderType) || other.orderType == orderType)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerId,tableId,waiterId,orderType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'PlaceOrderRequest(customerId: $customerId, tableId: $tableId, waiterId: $waiterId, orderType: $orderType, items: $items)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderRequestCopyWith<$Res> implements $PlaceOrderRequestCopyWith<$Res> {
  factory _$PlaceOrderRequestCopyWith(_PlaceOrderRequest value, $Res Function(_PlaceOrderRequest) _then) = __$PlaceOrderRequestCopyWithImpl;
@override @useResult
$Res call({
 int customerId, int tableId, int waiterId, String orderType, List<PlaceOrderItem> items
});




}
/// @nodoc
class __$PlaceOrderRequestCopyWithImpl<$Res>
    implements _$PlaceOrderRequestCopyWith<$Res> {
  __$PlaceOrderRequestCopyWithImpl(this._self, this._then);

  final _PlaceOrderRequest _self;
  final $Res Function(_PlaceOrderRequest) _then;

/// Create a copy of PlaceOrderRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerId = null,Object? tableId = null,Object? waiterId = null,Object? orderType = null,Object? items = null,}) {
  return _then(_PlaceOrderRequest(
customerId: null == customerId ? _self.customerId : customerId // ignore: cast_nullable_to_non_nullable
as int,tableId: null == tableId ? _self.tableId : tableId // ignore: cast_nullable_to_non_nullable
as int,waiterId: null == waiterId ? _self.waiterId : waiterId // ignore: cast_nullable_to_non_nullable
as int,orderType: null == orderType ? _self.orderType : orderType // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PlaceOrderItem>,
  ));
}


}


/// @nodoc
mixin _$PlaceOrderItem {

 int get productId; String get itemName; int get quantity; double get unitPrice; double get subtotal; String get specialInstructions;
/// Create a copy of PlaceOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderItemCopyWith<PlaceOrderItem> get copyWith => _$PlaceOrderItemCopyWithImpl<PlaceOrderItem>(this as PlaceOrderItem, _$identity);

  /// Serializes this PlaceOrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,itemName,quantity,unitPrice,subtotal,specialInstructions);

@override
String toString() {
  return 'PlaceOrderItem(productId: $productId, itemName: $itemName, quantity: $quantity, unitPrice: $unitPrice, subtotal: $subtotal, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderItemCopyWith<$Res>  {
  factory $PlaceOrderItemCopyWith(PlaceOrderItem value, $Res Function(PlaceOrderItem) _then) = _$PlaceOrderItemCopyWithImpl;
@useResult
$Res call({
 int productId, String itemName, int quantity, double unitPrice, double subtotal, String specialInstructions
});




}
/// @nodoc
class _$PlaceOrderItemCopyWithImpl<$Res>
    implements $PlaceOrderItemCopyWith<$Res> {
  _$PlaceOrderItemCopyWithImpl(this._self, this._then);

  final PlaceOrderItem _self;
  final $Res Function(PlaceOrderItem) _then;

/// Create a copy of PlaceOrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productId = null,Object? itemName = null,Object? quantity = null,Object? unitPrice = null,Object? subtotal = null,Object? specialInstructions = null,}) {
  return _then(_self.copyWith(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,specialInstructions: null == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceOrderItem].
extension PlaceOrderItemPatterns on PlaceOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderItem value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int productId,  String itemName,  int quantity,  double unitPrice,  double subtotal,  String specialInstructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderItem() when $default != null:
return $default(_that.productId,_that.itemName,_that.quantity,_that.unitPrice,_that.subtotal,_that.specialInstructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int productId,  String itemName,  int quantity,  double unitPrice,  double subtotal,  String specialInstructions)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderItem():
return $default(_that.productId,_that.itemName,_that.quantity,_that.unitPrice,_that.subtotal,_that.specialInstructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int productId,  String itemName,  int quantity,  double unitPrice,  double subtotal,  String specialInstructions)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderItem() when $default != null:
return $default(_that.productId,_that.itemName,_that.quantity,_that.unitPrice,_that.subtotal,_that.specialInstructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceOrderItem implements PlaceOrderItem {
  const _PlaceOrderItem({required this.productId, required this.itemName, required this.quantity, required this.unitPrice, required this.subtotal, required this.specialInstructions});
  factory _PlaceOrderItem.fromJson(Map<String, dynamic> json) => _$PlaceOrderItemFromJson(json);

@override final  int productId;
@override final  String itemName;
@override final  int quantity;
@override final  double unitPrice;
@override final  double subtotal;
@override final  String specialInstructions;

/// Create a copy of PlaceOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderItemCopyWith<_PlaceOrderItem> get copyWith => __$PlaceOrderItemCopyWithImpl<_PlaceOrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceOrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,itemName,quantity,unitPrice,subtotal,specialInstructions);

@override
String toString() {
  return 'PlaceOrderItem(productId: $productId, itemName: $itemName, quantity: $quantity, unitPrice: $unitPrice, subtotal: $subtotal, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderItemCopyWith<$Res> implements $PlaceOrderItemCopyWith<$Res> {
  factory _$PlaceOrderItemCopyWith(_PlaceOrderItem value, $Res Function(_PlaceOrderItem) _then) = __$PlaceOrderItemCopyWithImpl;
@override @useResult
$Res call({
 int productId, String itemName, int quantity, double unitPrice, double subtotal, String specialInstructions
});




}
/// @nodoc
class __$PlaceOrderItemCopyWithImpl<$Res>
    implements _$PlaceOrderItemCopyWith<$Res> {
  __$PlaceOrderItemCopyWithImpl(this._self, this._then);

  final _PlaceOrderItem _self;
  final $Res Function(_PlaceOrderItem) _then;

/// Create a copy of PlaceOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? itemName = null,Object? quantity = null,Object? unitPrice = null,Object? subtotal = null,Object? specialInstructions = null,}) {
  return _then(_PlaceOrderItem(
productId: null == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,subtotal: null == subtotal ? _self.subtotal : subtotal // ignore: cast_nullable_to_non_nullable
as double,specialInstructions: null == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
