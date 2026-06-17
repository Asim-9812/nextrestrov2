// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderDetailModel {

 int? get orderID; String? get tableNumber; String? get customerName; String? get floorName; String? get productName; int? get quantity; int? get productId; String? get orderStatus; String? get itemStatus; String? get specialInstructions; String? get orderDate;
/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderDetailModelCopyWith<OrderDetailModel> get copyWith => _$OrderDetailModelCopyWithImpl<OrderDetailModel>(this as OrderDetailModel, _$identity);

  /// Serializes this OrderDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderDetailModel&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.itemStatus, itemStatus) || other.itemStatus == itemStatus)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,tableNumber,customerName,floorName,productName,quantity,productId,orderStatus,itemStatus,specialInstructions,orderDate);

@override
String toString() {
  return 'OrderDetailModel(orderID: $orderID, tableNumber: $tableNumber, customerName: $customerName, floorName: $floorName, productName: $productName, quantity: $quantity, productId: $productId, orderStatus: $orderStatus, itemStatus: $itemStatus, specialInstructions: $specialInstructions, orderDate: $orderDate)';
}


}

/// @nodoc
abstract mixin class $OrderDetailModelCopyWith<$Res>  {
  factory $OrderDetailModelCopyWith(OrderDetailModel value, $Res Function(OrderDetailModel) _then) = _$OrderDetailModelCopyWithImpl;
@useResult
$Res call({
 int? orderID, String? tableNumber, String? customerName, String? floorName, String? productName, int? quantity, int? productId, String? orderStatus, String? itemStatus, String? specialInstructions, String? orderDate
});




}
/// @nodoc
class _$OrderDetailModelCopyWithImpl<$Res>
    implements $OrderDetailModelCopyWith<$Res> {
  _$OrderDetailModelCopyWithImpl(this._self, this._then);

  final OrderDetailModel _self;
  final $Res Function(OrderDetailModel) _then;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderID = freezed,Object? tableNumber = freezed,Object? customerName = freezed,Object? floorName = freezed,Object? productName = freezed,Object? quantity = freezed,Object? productId = freezed,Object? orderStatus = freezed,Object? itemStatus = freezed,Object? specialInstructions = freezed,Object? orderDate = freezed,}) {
  return _then(_self.copyWith(
orderID: freezed == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int?,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,floorName: freezed == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,itemStatus: freezed == itemStatus ? _self.itemStatus : itemStatus // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,orderDate: freezed == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderDetailModel].
extension OrderDetailModelPatterns on OrderDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? orderID,  String? tableNumber,  String? customerName,  String? floorName,  String? productName,  int? quantity,  int? productId,  String? orderStatus,  String? itemStatus,  String? specialInstructions,  String? orderDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
return $default(_that.orderID,_that.tableNumber,_that.customerName,_that.floorName,_that.productName,_that.quantity,_that.productId,_that.orderStatus,_that.itemStatus,_that.specialInstructions,_that.orderDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? orderID,  String? tableNumber,  String? customerName,  String? floorName,  String? productName,  int? quantity,  int? productId,  String? orderStatus,  String? itemStatus,  String? specialInstructions,  String? orderDate)  $default,) {final _that = this;
switch (_that) {
case _OrderDetailModel():
return $default(_that.orderID,_that.tableNumber,_that.customerName,_that.floorName,_that.productName,_that.quantity,_that.productId,_that.orderStatus,_that.itemStatus,_that.specialInstructions,_that.orderDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? orderID,  String? tableNumber,  String? customerName,  String? floorName,  String? productName,  int? quantity,  int? productId,  String? orderStatus,  String? itemStatus,  String? specialInstructions,  String? orderDate)?  $default,) {final _that = this;
switch (_that) {
case _OrderDetailModel() when $default != null:
return $default(_that.orderID,_that.tableNumber,_that.customerName,_that.floorName,_that.productName,_that.quantity,_that.productId,_that.orderStatus,_that.itemStatus,_that.specialInstructions,_that.orderDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderDetailModel implements OrderDetailModel {
  const _OrderDetailModel({this.orderID, this.tableNumber, this.customerName, this.floorName, this.productName, this.quantity, this.productId, this.orderStatus, this.itemStatus, this.specialInstructions, this.orderDate});
  factory _OrderDetailModel.fromJson(Map<String, dynamic> json) => _$OrderDetailModelFromJson(json);

@override final  int? orderID;
@override final  String? tableNumber;
@override final  String? customerName;
@override final  String? floorName;
@override final  String? productName;
@override final  int? quantity;
@override final  int? productId;
@override final  String? orderStatus;
@override final  String? itemStatus;
@override final  String? specialInstructions;
@override final  String? orderDate;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderDetailModelCopyWith<_OrderDetailModel> get copyWith => __$OrderDetailModelCopyWithImpl<_OrderDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderDetailModel&&(identical(other.orderID, orderID) || other.orderID == orderID)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.orderStatus, orderStatus) || other.orderStatus == orderStatus)&&(identical(other.itemStatus, itemStatus) || other.itemStatus == itemStatus)&&(identical(other.specialInstructions, specialInstructions) || other.specialInstructions == specialInstructions)&&(identical(other.orderDate, orderDate) || other.orderDate == orderDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderID,tableNumber,customerName,floorName,productName,quantity,productId,orderStatus,itemStatus,specialInstructions,orderDate);

@override
String toString() {
  return 'OrderDetailModel(orderID: $orderID, tableNumber: $tableNumber, customerName: $customerName, floorName: $floorName, productName: $productName, quantity: $quantity, productId: $productId, orderStatus: $orderStatus, itemStatus: $itemStatus, specialInstructions: $specialInstructions, orderDate: $orderDate)';
}


}

/// @nodoc
abstract mixin class _$OrderDetailModelCopyWith<$Res> implements $OrderDetailModelCopyWith<$Res> {
  factory _$OrderDetailModelCopyWith(_OrderDetailModel value, $Res Function(_OrderDetailModel) _then) = __$OrderDetailModelCopyWithImpl;
@override @useResult
$Res call({
 int? orderID, String? tableNumber, String? customerName, String? floorName, String? productName, int? quantity, int? productId, String? orderStatus, String? itemStatus, String? specialInstructions, String? orderDate
});




}
/// @nodoc
class __$OrderDetailModelCopyWithImpl<$Res>
    implements _$OrderDetailModelCopyWith<$Res> {
  __$OrderDetailModelCopyWithImpl(this._self, this._then);

  final _OrderDetailModel _self;
  final $Res Function(_OrderDetailModel) _then;

/// Create a copy of OrderDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderID = freezed,Object? tableNumber = freezed,Object? customerName = freezed,Object? floorName = freezed,Object? productName = freezed,Object? quantity = freezed,Object? productId = freezed,Object? orderStatus = freezed,Object? itemStatus = freezed,Object? specialInstructions = freezed,Object? orderDate = freezed,}) {
  return _then(_OrderDetailModel(
orderID: freezed == orderID ? _self.orderID : orderID // ignore: cast_nullable_to_non_nullable
as int?,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,floorName: freezed == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as int?,orderStatus: freezed == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String?,itemStatus: freezed == itemStatus ? _self.itemStatus : itemStatus // ignore: cast_nullable_to_non_nullable
as String?,specialInstructions: freezed == specialInstructions ? _self.specialInstructions : specialInstructions // ignore: cast_nullable_to_non_nullable
as String?,orderDate: freezed == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
