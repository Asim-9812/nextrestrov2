// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_preview_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderPreviewResponse {

 List<PreviewItem> get items; OrderSummary get summary;
/// Create a copy of OrderPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderPreviewResponseCopyWith<OrderPreviewResponse> get copyWith => _$OrderPreviewResponseCopyWithImpl<OrderPreviewResponse>(this as OrderPreviewResponse, _$identity);

  /// Serializes this OrderPreviewResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderPreviewResponse&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),summary);

@override
String toString() {
  return 'OrderPreviewResponse(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class $OrderPreviewResponseCopyWith<$Res>  {
  factory $OrderPreviewResponseCopyWith(OrderPreviewResponse value, $Res Function(OrderPreviewResponse) _then) = _$OrderPreviewResponseCopyWithImpl;
@useResult
$Res call({
 List<PreviewItem> items, OrderSummary summary
});


$OrderSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class _$OrderPreviewResponseCopyWithImpl<$Res>
    implements $OrderPreviewResponseCopyWith<$Res> {
  _$OrderPreviewResponseCopyWithImpl(this._self, this._then);

  final OrderPreviewResponse _self;
  final $Res Function(OrderPreviewResponse) _then;

/// Create a copy of OrderPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PreviewItem>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as OrderSummary,
  ));
}
/// Create a copy of OrderPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderSummaryCopyWith<$Res> get summary {
  
  return $OrderSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderPreviewResponse].
extension OrderPreviewResponsePatterns on OrderPreviewResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderPreviewResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderPreviewResponse value)  $default,){
final _that = this;
switch (_that) {
case _OrderPreviewResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderPreviewResponse value)?  $default,){
final _that = this;
switch (_that) {
case _OrderPreviewResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PreviewItem> items,  OrderSummary summary)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderPreviewResponse() when $default != null:
return $default(_that.items,_that.summary);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PreviewItem> items,  OrderSummary summary)  $default,) {final _that = this;
switch (_that) {
case _OrderPreviewResponse():
return $default(_that.items,_that.summary);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PreviewItem> items,  OrderSummary summary)?  $default,) {final _that = this;
switch (_that) {
case _OrderPreviewResponse() when $default != null:
return $default(_that.items,_that.summary);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderPreviewResponse implements OrderPreviewResponse {
  const _OrderPreviewResponse({required final  List<PreviewItem> items, required this.summary}): _items = items;
  factory _OrderPreviewResponse.fromJson(Map<String, dynamic> json) => _$OrderPreviewResponseFromJson(json);

 final  List<PreviewItem> _items;
@override List<PreviewItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  OrderSummary summary;

/// Create a copy of OrderPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderPreviewResponseCopyWith<_OrderPreviewResponse> get copyWith => __$OrderPreviewResponseCopyWithImpl<_OrderPreviewResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderPreviewResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderPreviewResponse&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.summary, summary) || other.summary == summary));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),summary);

@override
String toString() {
  return 'OrderPreviewResponse(items: $items, summary: $summary)';
}


}

/// @nodoc
abstract mixin class _$OrderPreviewResponseCopyWith<$Res> implements $OrderPreviewResponseCopyWith<$Res> {
  factory _$OrderPreviewResponseCopyWith(_OrderPreviewResponse value, $Res Function(_OrderPreviewResponse) _then) = __$OrderPreviewResponseCopyWithImpl;
@override @useResult
$Res call({
 List<PreviewItem> items, OrderSummary summary
});


@override $OrderSummaryCopyWith<$Res> get summary;

}
/// @nodoc
class __$OrderPreviewResponseCopyWithImpl<$Res>
    implements _$OrderPreviewResponseCopyWith<$Res> {
  __$OrderPreviewResponseCopyWithImpl(this._self, this._then);

  final _OrderPreviewResponse _self;
  final $Res Function(_OrderPreviewResponse) _then;

/// Create a copy of OrderPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? summary = null,}) {
  return _then(_OrderPreviewResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PreviewItem>,summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as OrderSummary,
  ));
}

/// Create a copy of OrderPreviewResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OrderSummaryCopyWith<$Res> get summary {
  
  return $OrderSummaryCopyWith<$Res>(_self.summary, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$PreviewItem {

 int get productId; String get itemName; int get quantity; double get unitPrice; double get subtotal; String get specialInstructions;
/// Create a copy of PreviewItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PreviewItemCopyWith<PreviewItem> get copyWith => _$PreviewItemCopyWithImpl<PreviewItem>(this as PreviewItem, _$identity);

  /// Serializes this PreviewItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PreviewItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,itemName,quantity,unitPrice,subtotal,specialInstructions);

@override
String toString() {
  return 'PreviewItem(productId: $productId, itemName: $itemName, quantity: $quantity, unitPrice: $unitPrice, subtotal: $subtotal, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class $PreviewItemCopyWith<$Res>  {
  factory $PreviewItemCopyWith(PreviewItem value, $Res Function(PreviewItem) _then) = _$PreviewItemCopyWithImpl;
@useResult
$Res call({
 int productId, String itemName, int quantity, double unitPrice, double subtotal, String specialInstructions
});




}
/// @nodoc
class _$PreviewItemCopyWithImpl<$Res>
    implements $PreviewItemCopyWith<$Res> {
  _$PreviewItemCopyWithImpl(this._self, this._then);

  final PreviewItem _self;
  final $Res Function(PreviewItem) _then;

/// Create a copy of PreviewItem
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


/// Adds pattern-matching-related methods to [PreviewItem].
extension PreviewItemPatterns on PreviewItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PreviewItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PreviewItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PreviewItem value)  $default,){
final _that = this;
switch (_that) {
case _PreviewItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PreviewItem value)?  $default,){
final _that = this;
switch (_that) {
case _PreviewItem() when $default != null:
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
case _PreviewItem() when $default != null:
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
case _PreviewItem():
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
case _PreviewItem() when $default != null:
return $default(_that.productId,_that.itemName,_that.quantity,_that.unitPrice,_that.subtotal,_that.specialInstructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PreviewItem implements PreviewItem {
  const _PreviewItem({required this.productId, required this.itemName, required this.quantity, required this.unitPrice, required this.subtotal, required this.specialInstructions});
  factory _PreviewItem.fromJson(Map<String, dynamic> json) => _$PreviewItemFromJson(json);

@override final  int productId;
@override final  String itemName;
@override final  int quantity;
@override final  double unitPrice;
@override final  double subtotal;
@override final  String specialInstructions;

/// Create a copy of PreviewItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PreviewItemCopyWith<_PreviewItem> get copyWith => __$PreviewItemCopyWithImpl<_PreviewItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PreviewItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PreviewItem&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subtotal, subtotal) || other.subtotal == subtotal)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productId,itemName,quantity,unitPrice,subtotal,specialInstructions);

@override
String toString() {
  return 'PreviewItem(productId: $productId, itemName: $itemName, quantity: $quantity, unitPrice: $unitPrice, subtotal: $subtotal, specialInstructions: $specialInstructions)';
}


}

/// @nodoc
abstract mixin class _$PreviewItemCopyWith<$Res> implements $PreviewItemCopyWith<$Res> {
  factory _$PreviewItemCopyWith(_PreviewItem value, $Res Function(_PreviewItem) _then) = __$PreviewItemCopyWithImpl;
@override @useResult
$Res call({
 int productId, String itemName, int quantity, double unitPrice, double subtotal, String specialInstructions
});




}
/// @nodoc
class __$PreviewItemCopyWithImpl<$Res>
    implements _$PreviewItemCopyWith<$Res> {
  __$PreviewItemCopyWithImpl(this._self, this._then);

  final _PreviewItem _self;
  final $Res Function(_PreviewItem) _then;

/// Create a copy of PreviewItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productId = null,Object? itemName = null,Object? quantity = null,Object? unitPrice = null,Object? subtotal = null,Object? specialInstructions = null,}) {
  return _then(_PreviewItem(
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


/// @nodoc
mixin _$OrderSummary {

 int get orderID; int get tableID; String? get invoiceNo; String get tableNumber; String? get customerName; double get subTotal; double get tax; double get discount; double get totalAmount; String? get paymentMode;
/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderSummaryCopyWith<OrderSummary> get copyWith => _$OrderSummaryCopyWithImpl<OrderSummary>(this as OrderSummary, _$identity);

  /// Serializes this OrderSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderSummary&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,tableID,invoiceNo,tableNumber,customerName,subTotal,tax,discount,totalAmount,paymentMode);

@override
String toString() {
  return 'OrderSummary(orderID: $orderID, tableID: $tableID, invoiceNo: $invoiceNo, tableNumber: $tableNumber, customerName: $customerName, subTotal: $subTotal, tax: $tax, discount: $discount, totalAmount: $totalAmount, paymentMode: $paymentMode)';
}


}

/// @nodoc
abstract mixin class $OrderSummaryCopyWith<$Res>  {
  factory $OrderSummaryCopyWith(OrderSummary value, $Res Function(OrderSummary) _then) = _$OrderSummaryCopyWithImpl;
@useResult
$Res call({
 int orderID, int tableID, String? invoiceNo, String tableNumber, String? customerName, double subTotal, double tax, double discount, double totalAmount, String? paymentMode
});




}
/// @nodoc
class _$OrderSummaryCopyWithImpl<$Res>
    implements $OrderSummaryCopyWith<$Res> {
  _$OrderSummaryCopyWithImpl(this._self, this._then);

  final OrderSummary _self;
  final $Res Function(OrderSummary) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderID = null,Object? tableID = null,Object? invoiceNo = freezed,Object? tableNumber = null,Object? customerName = freezed,Object? subTotal = null,Object? tax = null,Object? discount = null,Object? totalAmount = null,Object? paymentMode = freezed,}) {
  return _then(_self.copyWith(
orderID: null == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int,tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderSummary].
extension OrderSummaryPatterns on OrderSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderSummary value)  $default,){
final _that = this;
switch (_that) {
case _OrderSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderSummary value)?  $default,){
final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int orderID,  int tableID,  String? invoiceNo,  String tableNumber,  String? customerName,  double subTotal,  double tax,  double discount,  double totalAmount,  String? paymentMode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
return $default(_that.orderID,_that.tableID,_that.invoiceNo,_that.tableNumber,_that.customerName,_that.subTotal,_that.tax,_that.discount,_that.totalAmount,_that.paymentMode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int orderID,  int tableID,  String? invoiceNo,  String tableNumber,  String? customerName,  double subTotal,  double tax,  double discount,  double totalAmount,  String? paymentMode)  $default,) {final _that = this;
switch (_that) {
case _OrderSummary():
return $default(_that.orderID,_that.tableID,_that.invoiceNo,_that.tableNumber,_that.customerName,_that.subTotal,_that.tax,_that.discount,_that.totalAmount,_that.paymentMode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int orderID,  int tableID,  String? invoiceNo,  String tableNumber,  String? customerName,  double subTotal,  double tax,  double discount,  double totalAmount,  String? paymentMode)?  $default,) {final _that = this;
switch (_that) {
case _OrderSummary() when $default != null:
return $default(_that.orderID,_that.tableID,_that.invoiceNo,_that.tableNumber,_that.customerName,_that.subTotal,_that.tax,_that.discount,_that.totalAmount,_that.paymentMode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderSummary implements OrderSummary {
  const _OrderSummary({required this.orderID, required this.tableID, this.invoiceNo, required this.tableNumber, this.customerName, required this.subTotal, required this.tax, required this.discount, required this.totalAmount, this.paymentMode});
  factory _OrderSummary.fromJson(Map<String, dynamic> json) => _$OrderSummaryFromJson(json);

@override final  int orderID;
@override final  int tableID;
@override final  String? invoiceNo;
@override final  String tableNumber;
@override final  String? customerName;
@override final  double subTotal;
@override final  double tax;
@override final  double discount;
@override final  double totalAmount;
@override final  String? paymentMode;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderSummaryCopyWith<_OrderSummary> get copyWith => __$OrderSummaryCopyWithImpl<_OrderSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderSummary&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paymentMode, paymentMode) || other.paymentMode == paymentMode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,tableID,invoiceNo,tableNumber,customerName,subTotal,tax,discount,totalAmount,paymentMode);

@override
String toString() {
  return 'OrderSummary(orderID: $orderID, tableID: $tableID, invoiceNo: $invoiceNo, tableNumber: $tableNumber, customerName: $customerName, subTotal: $subTotal, tax: $tax, discount: $discount, totalAmount: $totalAmount, paymentMode: $paymentMode)';
}


}

/// @nodoc
abstract mixin class _$OrderSummaryCopyWith<$Res> implements $OrderSummaryCopyWith<$Res> {
  factory _$OrderSummaryCopyWith(_OrderSummary value, $Res Function(_OrderSummary) _then) = __$OrderSummaryCopyWithImpl;
@override @useResult
$Res call({
 int orderID, int tableID, String? invoiceNo, String tableNumber, String? customerName, double subTotal, double tax, double discount, double totalAmount, String? paymentMode
});




}
/// @nodoc
class __$OrderSummaryCopyWithImpl<$Res>
    implements _$OrderSummaryCopyWith<$Res> {
  __$OrderSummaryCopyWithImpl(this._self, this._then);

  final _OrderSummary _self;
  final $Res Function(_OrderSummary) _then;

/// Create a copy of OrderSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderID = null,Object? tableID = null,Object? invoiceNo = freezed,Object? tableNumber = null,Object? customerName = freezed,Object? subTotal = null,Object? tax = null,Object? discount = null,Object? totalAmount = null,Object? paymentMode = freezed,}) {
  return _then(_OrderSummary(
orderID: null == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int,tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,paymentMode: freezed == paymentMode ? _self.paymentMode : paymentMode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
