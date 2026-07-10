// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProductSalesReportRequest {

 String get fromDate; String get toDate; String get branchID; int get fiscalYearID; int get categoryID; int get productID; int get customerID;
/// Create a copy of ProductSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSalesReportRequestCopyWith<ProductSalesReportRequest> get copyWith => _$ProductSalesReportRequestCopyWithImpl<ProductSalesReportRequest>(this as ProductSalesReportRequest, _$identity);

  /// Serializes this ProductSalesReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.customerID, customerID) || other.customerID == customerID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,categoryID,productID,customerID);

@override
String toString() {
  return 'ProductSalesReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, categoryID: $categoryID, productID: $productID, customerID: $customerID)';
}


}

/// @nodoc
abstract mixin class $ProductSalesReportRequestCopyWith<$Res>  {
  factory $ProductSalesReportRequestCopyWith(ProductSalesReportRequest value, $Res Function(ProductSalesReportRequest) _then) = _$ProductSalesReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, int categoryID, int productID, int customerID
});




}
/// @nodoc
class _$ProductSalesReportRequestCopyWithImpl<$Res>
    implements $ProductSalesReportRequestCopyWith<$Res> {
  _$ProductSalesReportRequestCopyWithImpl(this._self, this._then);

  final ProductSalesReportRequest _self;
  final $Res Function(ProductSalesReportRequest) _then;

/// Create a copy of ProductSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? categoryID = null,Object? productID = null,Object? customerID = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSalesReportRequest].
extension ProductSalesReportRequestPatterns on ProductSalesReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSalesReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSalesReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSalesReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int categoryID,  int productID,  int customerID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.categoryID,_that.productID,_that.customerID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int categoryID,  int productID,  int customerID)  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportRequest():
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.categoryID,_that.productID,_that.customerID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int categoryID,  int productID,  int customerID)?  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.categoryID,_that.productID,_that.customerID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSalesReportRequest implements ProductSalesReportRequest {
  const _ProductSalesReportRequest({required this.fromDate, required this.toDate, this.branchID = '3', required this.fiscalYearID, this.categoryID = 0, this.productID = 0, this.customerID = 0});
  factory _ProductSalesReportRequest.fromJson(Map<String, dynamic> json) => _$ProductSalesReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  String branchID;
@override final  int fiscalYearID;
@override@JsonKey() final  int categoryID;
@override@JsonKey() final  int productID;
@override@JsonKey() final  int customerID;

/// Create a copy of ProductSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSalesReportRequestCopyWith<_ProductSalesReportRequest> get copyWith => __$ProductSalesReportRequestCopyWithImpl<_ProductSalesReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSalesReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.customerID, customerID) || other.customerID == customerID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,categoryID,productID,customerID);

@override
String toString() {
  return 'ProductSalesReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, categoryID: $categoryID, productID: $productID, customerID: $customerID)';
}


}

/// @nodoc
abstract mixin class _$ProductSalesReportRequestCopyWith<$Res> implements $ProductSalesReportRequestCopyWith<$Res> {
  factory _$ProductSalesReportRequestCopyWith(_ProductSalesReportRequest value, $Res Function(_ProductSalesReportRequest) _then) = __$ProductSalesReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, int categoryID, int productID, int customerID
});




}
/// @nodoc
class __$ProductSalesReportRequestCopyWithImpl<$Res>
    implements _$ProductSalesReportRequestCopyWith<$Res> {
  __$ProductSalesReportRequestCopyWithImpl(this._self, this._then);

  final _ProductSalesReportRequest _self;
  final $Res Function(_ProductSalesReportRequest) _then;

/// Create a copy of ProductSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? categoryID = null,Object? productID = null,Object? customerID = null,}) {
  return _then(_ProductSalesReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductSalesReportResponse {

 bool get succeeded; String? get messages; ProductSalesReportData? get data;
/// Create a copy of ProductSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSalesReportResponseCopyWith<ProductSalesReportResponse> get copyWith => _$ProductSalesReportResponseCopyWithImpl<ProductSalesReportResponse>(this as ProductSalesReportResponse, _$identity);

  /// Serializes this ProductSalesReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'ProductSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $ProductSalesReportResponseCopyWith<$Res>  {
  factory $ProductSalesReportResponseCopyWith(ProductSalesReportResponse value, $Res Function(ProductSalesReportResponse) _then) = _$ProductSalesReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, ProductSalesReportData? data
});


$ProductSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$ProductSalesReportResponseCopyWithImpl<$Res>
    implements $ProductSalesReportResponseCopyWith<$Res> {
  _$ProductSalesReportResponseCopyWithImpl(this._self, this._then);

  final ProductSalesReportResponse _self;
  final $Res Function(ProductSalesReportResponse) _then;

/// Create a copy of ProductSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductSalesReportData?,
  ));
}
/// Create a copy of ProductSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProductSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductSalesReportResponse].
extension ProductSalesReportResponsePatterns on ProductSalesReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSalesReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSalesReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSalesReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  ProductSalesReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSalesReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  ProductSalesReportData? data)  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportResponse():
return $default(_that.succeeded,_that.messages,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  ProductSalesReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSalesReportResponse implements ProductSalesReportResponse {
  const _ProductSalesReportResponse({this.succeeded = false, this.messages, this.data});
  factory _ProductSalesReportResponse.fromJson(Map<String, dynamic> json) => _$ProductSalesReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  ProductSalesReportData? data;

/// Create a copy of ProductSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSalesReportResponseCopyWith<_ProductSalesReportResponse> get copyWith => __$ProductSalesReportResponseCopyWithImpl<_ProductSalesReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSalesReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'ProductSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProductSalesReportResponseCopyWith<$Res> implements $ProductSalesReportResponseCopyWith<$Res> {
  factory _$ProductSalesReportResponseCopyWith(_ProductSalesReportResponse value, $Res Function(_ProductSalesReportResponse) _then) = __$ProductSalesReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, ProductSalesReportData? data
});


@override $ProductSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$ProductSalesReportResponseCopyWithImpl<$Res>
    implements _$ProductSalesReportResponseCopyWith<$Res> {
  __$ProductSalesReportResponseCopyWithImpl(this._self, this._then);

  final _ProductSalesReportResponse _self;
  final $Res Function(_ProductSalesReportResponse) _then;

/// Create a copy of ProductSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_ProductSalesReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ProductSalesReportData?,
  ));
}

/// Create a copy of ProductSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ProductSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ProductSalesReportData {

 ProductSalesReportSummary? get summary; List<ProductSalesData> get data;
/// Create a copy of ProductSalesReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSalesReportDataCopyWith<ProductSalesReportData> get copyWith => _$ProductSalesReportDataCopyWithImpl<ProductSalesReportData>(this as ProductSalesReportData, _$identity);

  /// Serializes this ProductSalesReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ProductSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $ProductSalesReportDataCopyWith<$Res>  {
  factory $ProductSalesReportDataCopyWith(ProductSalesReportData value, $Res Function(ProductSalesReportData) _then) = _$ProductSalesReportDataCopyWithImpl;
@useResult
$Res call({
 ProductSalesReportSummary? summary, List<ProductSalesData> data
});


$ProductSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$ProductSalesReportDataCopyWithImpl<$Res>
    implements $ProductSalesReportDataCopyWith<$Res> {
  _$ProductSalesReportDataCopyWithImpl(this._self, this._then);

  final ProductSalesReportData _self;
  final $Res Function(ProductSalesReportData) _then;

/// Create a copy of ProductSalesReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ProductSalesReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ProductSalesData>,
  ));
}
/// Create a copy of ProductSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $ProductSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductSalesReportData].
extension ProductSalesReportDataPatterns on ProductSalesReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSalesReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSalesReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSalesReportData value)  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSalesReportData value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProductSalesReportSummary? summary,  List<ProductSalesData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSalesReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProductSalesReportSummary? summary,  List<ProductSalesData> data)  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportData():
return $default(_that.summary,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProductSalesReportSummary? summary,  List<ProductSalesData> data)?  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSalesReportData implements ProductSalesReportData {
  const _ProductSalesReportData({this.summary, final  List<ProductSalesData> data = const []}): _data = data;
  factory _ProductSalesReportData.fromJson(Map<String, dynamic> json) => _$ProductSalesReportDataFromJson(json);

@override final  ProductSalesReportSummary? summary;
 final  List<ProductSalesData> _data;
@override@JsonKey() List<ProductSalesData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of ProductSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSalesReportDataCopyWith<_ProductSalesReportData> get copyWith => __$ProductSalesReportDataCopyWithImpl<_ProductSalesReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSalesReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ProductSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ProductSalesReportDataCopyWith<$Res> implements $ProductSalesReportDataCopyWith<$Res> {
  factory _$ProductSalesReportDataCopyWith(_ProductSalesReportData value, $Res Function(_ProductSalesReportData) _then) = __$ProductSalesReportDataCopyWithImpl;
@override @useResult
$Res call({
 ProductSalesReportSummary? summary, List<ProductSalesData> data
});


@override $ProductSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$ProductSalesReportDataCopyWithImpl<$Res>
    implements _$ProductSalesReportDataCopyWith<$Res> {
  __$ProductSalesReportDataCopyWithImpl(this._self, this._then);

  final _ProductSalesReportData _self;
  final $Res Function(_ProductSalesReportData) _then;

/// Create a copy of ProductSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_ProductSalesReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as ProductSalesReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ProductSalesData>,
  ));
}

/// Create a copy of ProductSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProductSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $ProductSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$ProductSalesReportSummary {

 int get totalBills; double get totalQuantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of ProductSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSalesReportSummaryCopyWith<ProductSalesReportSummary> get copyWith => _$ProductSalesReportSummaryCopyWithImpl<ProductSalesReportSummary>(this as ProductSalesReportSummary, _$identity);

  /// Serializes this ProductSalesReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'ProductSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $ProductSalesReportSummaryCopyWith<$Res>  {
  factory $ProductSalesReportSummaryCopyWith(ProductSalesReportSummary value, $Res Function(ProductSalesReportSummary) _then) = _$ProductSalesReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, double totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$ProductSalesReportSummaryCopyWithImpl<$Res>
    implements $ProductSalesReportSummaryCopyWith<$Res> {
  _$ProductSalesReportSummaryCopyWithImpl(this._self, this._then);

  final ProductSalesReportSummary _self;
  final $Res Function(ProductSalesReportSummary) _then;

/// Create a copy of ProductSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_self.copyWith(
totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as double,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSalesReportSummary].
extension ProductSalesReportSummaryPatterns on ProductSalesReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSalesReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSalesReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSalesReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalBills,  double totalQuantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalBills,  double totalQuantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportSummary():
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalBills,  double totalQuantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,) {final _that = this;
switch (_that) {
case _ProductSalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSalesReportSummary implements ProductSalesReportSummary {
  const _ProductSalesReportSummary({this.totalBills = 0, this.totalQuantity = 0.0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _ProductSalesReportSummary.fromJson(Map<String, dynamic> json) => _$ProductSalesReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  double totalQuantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of ProductSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSalesReportSummaryCopyWith<_ProductSalesReportSummary> get copyWith => __$ProductSalesReportSummaryCopyWithImpl<_ProductSalesReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSalesReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'ProductSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$ProductSalesReportSummaryCopyWith<$Res> implements $ProductSalesReportSummaryCopyWith<$Res> {
  factory _$ProductSalesReportSummaryCopyWith(_ProductSalesReportSummary value, $Res Function(_ProductSalesReportSummary) _then) = __$ProductSalesReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, double totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$ProductSalesReportSummaryCopyWithImpl<$Res>
    implements _$ProductSalesReportSummaryCopyWith<$Res> {
  __$ProductSalesReportSummaryCopyWithImpl(this._self, this._then);

  final _ProductSalesReportSummary _self;
  final $Res Function(_ProductSalesReportSummary) _then;

/// Create a copy of ProductSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_ProductSalesReportSummary(
totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as double,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ProductSalesData {

 int? get sn; String? get billingDate; String? get invoiceNo; int? get branchID; String? get branchName; int? get categoryID;@JsonKey(name: 'catrgoryName') String? get categoryName; int? get productID; String? get productName; double get quantity; double get unitPrice; double get subTotal; double get billDiscountAmount; double get tax; double get total; int? get customerID; String? get customerName;
/// Create a copy of ProductSalesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSalesDataCopyWith<ProductSalesData> get copyWith => _$ProductSalesDataCopyWithImpl<ProductSalesData>(this as ProductSalesData, _$identity);

  /// Serializes this ProductSalesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.billingDate, billingDate) || other.billingDate == billingDate)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.billDiscountAmount, billDiscountAmount) || other.billDiscountAmount == billDiscountAmount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.customerName, customerName) || other.customerName == customerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,billingDate,invoiceNo,branchID,branchName,categoryID,categoryName,productID,productName,quantity,unitPrice,subTotal,billDiscountAmount,tax,total,customerID,customerName);

@override
String toString() {
  return 'ProductSalesData(sn: $sn, billingDate: $billingDate, invoiceNo: $invoiceNo, branchID: $branchID, branchName: $branchName, categoryID: $categoryID, categoryName: $categoryName, productID: $productID, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, subTotal: $subTotal, billDiscountAmount: $billDiscountAmount, tax: $tax, total: $total, customerID: $customerID, customerName: $customerName)';
}


}

/// @nodoc
abstract mixin class $ProductSalesDataCopyWith<$Res>  {
  factory $ProductSalesDataCopyWith(ProductSalesData value, $Res Function(ProductSalesData) _then) = _$ProductSalesDataCopyWithImpl;
@useResult
$Res call({
 int? sn, String? billingDate, String? invoiceNo, int? branchID, String? branchName, int? categoryID,@JsonKey(name: 'catrgoryName') String? categoryName, int? productID, String? productName, double quantity, double unitPrice, double subTotal, double billDiscountAmount, double tax, double total, int? customerID, String? customerName
});




}
/// @nodoc
class _$ProductSalesDataCopyWithImpl<$Res>
    implements $ProductSalesDataCopyWith<$Res> {
  _$ProductSalesDataCopyWithImpl(this._self, this._then);

  final ProductSalesData _self;
  final $Res Function(ProductSalesData) _then;

/// Create a copy of ProductSalesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sn = freezed,Object? billingDate = freezed,Object? invoiceNo = freezed,Object? branchID = freezed,Object? branchName = freezed,Object? categoryID = freezed,Object? categoryName = freezed,Object? productID = freezed,Object? productName = freezed,Object? quantity = null,Object? unitPrice = null,Object? subTotal = null,Object? billDiscountAmount = null,Object? tax = null,Object? total = null,Object? customerID = freezed,Object? customerName = freezed,}) {
  return _then(_self.copyWith(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,billingDate: freezed == billingDate ? _self.billingDate : billingDate // ignore: cast_nullable_to_non_nullable
as String?,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,branchID: freezed == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as int?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,billDiscountAmount: null == billDiscountAmount ? _self.billDiscountAmount : billDiscountAmount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,customerID: freezed == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSalesData].
extension ProductSalesDataPatterns on ProductSalesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSalesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSalesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSalesData value)  $default,){
final _that = this;
switch (_that) {
case _ProductSalesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSalesData value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSalesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sn,  String? billingDate,  String? invoiceNo,  int? branchID,  String? branchName,  int? categoryID, @JsonKey(name: 'catrgoryName')  String? categoryName,  int? productID,  String? productName,  double quantity,  double unitPrice,  double subTotal,  double billDiscountAmount,  double tax,  double total,  int? customerID,  String? customerName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSalesData() when $default != null:
return $default(_that.sn,_that.billingDate,_that.invoiceNo,_that.branchID,_that.branchName,_that.categoryID,_that.categoryName,_that.productID,_that.productName,_that.quantity,_that.unitPrice,_that.subTotal,_that.billDiscountAmount,_that.tax,_that.total,_that.customerID,_that.customerName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sn,  String? billingDate,  String? invoiceNo,  int? branchID,  String? branchName,  int? categoryID, @JsonKey(name: 'catrgoryName')  String? categoryName,  int? productID,  String? productName,  double quantity,  double unitPrice,  double subTotal,  double billDiscountAmount,  double tax,  double total,  int? customerID,  String? customerName)  $default,) {final _that = this;
switch (_that) {
case _ProductSalesData():
return $default(_that.sn,_that.billingDate,_that.invoiceNo,_that.branchID,_that.branchName,_that.categoryID,_that.categoryName,_that.productID,_that.productName,_that.quantity,_that.unitPrice,_that.subTotal,_that.billDiscountAmount,_that.tax,_that.total,_that.customerID,_that.customerName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sn,  String? billingDate,  String? invoiceNo,  int? branchID,  String? branchName,  int? categoryID, @JsonKey(name: 'catrgoryName')  String? categoryName,  int? productID,  String? productName,  double quantity,  double unitPrice,  double subTotal,  double billDiscountAmount,  double tax,  double total,  int? customerID,  String? customerName)?  $default,) {final _that = this;
switch (_that) {
case _ProductSalesData() when $default != null:
return $default(_that.sn,_that.billingDate,_that.invoiceNo,_that.branchID,_that.branchName,_that.categoryID,_that.categoryName,_that.productID,_that.productName,_that.quantity,_that.unitPrice,_that.subTotal,_that.billDiscountAmount,_that.tax,_that.total,_that.customerID,_that.customerName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSalesData implements ProductSalesData {
  const _ProductSalesData({this.sn, this.billingDate, this.invoiceNo, this.branchID, this.branchName, this.categoryID, @JsonKey(name: 'catrgoryName') this.categoryName, this.productID, this.productName, this.quantity = 0.0, this.unitPrice = 0.0, this.subTotal = 0.0, this.billDiscountAmount = 0.0, this.tax = 0.0, this.total = 0.0, this.customerID, this.customerName});
  factory _ProductSalesData.fromJson(Map<String, dynamic> json) => _$ProductSalesDataFromJson(json);

@override final  int? sn;
@override final  String? billingDate;
@override final  String? invoiceNo;
@override final  int? branchID;
@override final  String? branchName;
@override final  int? categoryID;
@override@JsonKey(name: 'catrgoryName') final  String? categoryName;
@override final  int? productID;
@override final  String? productName;
@override@JsonKey() final  double quantity;
@override@JsonKey() final  double unitPrice;
@override@JsonKey() final  double subTotal;
@override@JsonKey() final  double billDiscountAmount;
@override@JsonKey() final  double tax;
@override@JsonKey() final  double total;
@override final  int? customerID;
@override final  String? customerName;

/// Create a copy of ProductSalesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSalesDataCopyWith<_ProductSalesData> get copyWith => __$ProductSalesDataCopyWithImpl<_ProductSalesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSalesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.billingDate, billingDate) || other.billingDate == billingDate)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.unitPrice, unitPrice) || other.unitPrice == unitPrice)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.billDiscountAmount, billDiscountAmount) || other.billDiscountAmount == billDiscountAmount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.total, total) || other.total == total)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.customerName, customerName) || other.customerName == customerName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,billingDate,invoiceNo,branchID,branchName,categoryID,categoryName,productID,productName,quantity,unitPrice,subTotal,billDiscountAmount,tax,total,customerID,customerName);

@override
String toString() {
  return 'ProductSalesData(sn: $sn, billingDate: $billingDate, invoiceNo: $invoiceNo, branchID: $branchID, branchName: $branchName, categoryID: $categoryID, categoryName: $categoryName, productID: $productID, productName: $productName, quantity: $quantity, unitPrice: $unitPrice, subTotal: $subTotal, billDiscountAmount: $billDiscountAmount, tax: $tax, total: $total, customerID: $customerID, customerName: $customerName)';
}


}

/// @nodoc
abstract mixin class _$ProductSalesDataCopyWith<$Res> implements $ProductSalesDataCopyWith<$Res> {
  factory _$ProductSalesDataCopyWith(_ProductSalesData value, $Res Function(_ProductSalesData) _then) = __$ProductSalesDataCopyWithImpl;
@override @useResult
$Res call({
 int? sn, String? billingDate, String? invoiceNo, int? branchID, String? branchName, int? categoryID,@JsonKey(name: 'catrgoryName') String? categoryName, int? productID, String? productName, double quantity, double unitPrice, double subTotal, double billDiscountAmount, double tax, double total, int? customerID, String? customerName
});




}
/// @nodoc
class __$ProductSalesDataCopyWithImpl<$Res>
    implements _$ProductSalesDataCopyWith<$Res> {
  __$ProductSalesDataCopyWithImpl(this._self, this._then);

  final _ProductSalesData _self;
  final $Res Function(_ProductSalesData) _then;

/// Create a copy of ProductSalesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sn = freezed,Object? billingDate = freezed,Object? invoiceNo = freezed,Object? branchID = freezed,Object? branchName = freezed,Object? categoryID = freezed,Object? categoryName = freezed,Object? productID = freezed,Object? productName = freezed,Object? quantity = null,Object? unitPrice = null,Object? subTotal = null,Object? billDiscountAmount = null,Object? tax = null,Object? total = null,Object? customerID = freezed,Object? customerName = freezed,}) {
  return _then(_ProductSalesData(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,billingDate: freezed == billingDate ? _self.billingDate : billingDate // ignore: cast_nullable_to_non_nullable
as String?,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,branchID: freezed == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as int?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
as String?,categoryID: freezed == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,unitPrice: null == unitPrice ? _self.unitPrice : unitPrice // ignore: cast_nullable_to_non_nullable
as double,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,billDiscountAmount: null == billDiscountAmount ? _self.billDiscountAmount : billDiscountAmount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as double,customerID: freezed == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
