// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerSalesReportRequest {

 String get fromDate; String get toDate; String get branchID; int get fiscalYearID; int get customerID;
/// Create a copy of CustomerSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSalesReportRequestCopyWith<CustomerSalesReportRequest> get copyWith => _$CustomerSalesReportRequestCopyWithImpl<CustomerSalesReportRequest>(this as CustomerSalesReportRequest, _$identity);

  /// Serializes this CustomerSalesReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.customerID, customerID) || other.customerID == customerID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,customerID);

@override
String toString() {
  return 'CustomerSalesReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, customerID: $customerID)';
}


}

/// @nodoc
abstract mixin class $CustomerSalesReportRequestCopyWith<$Res>  {
  factory $CustomerSalesReportRequestCopyWith(CustomerSalesReportRequest value, $Res Function(CustomerSalesReportRequest) _then) = _$CustomerSalesReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, int customerID
});




}
/// @nodoc
class _$CustomerSalesReportRequestCopyWithImpl<$Res>
    implements $CustomerSalesReportRequestCopyWith<$Res> {
  _$CustomerSalesReportRequestCopyWithImpl(this._self, this._then);

  final CustomerSalesReportRequest _self;
  final $Res Function(CustomerSalesReportRequest) _then;

/// Create a copy of CustomerSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? customerID = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerSalesReportRequest].
extension CustomerSalesReportRequestPatterns on CustomerSalesReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSalesReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSalesReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSalesReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int customerID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.customerID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int customerID)  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportRequest():
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.customerID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int customerID)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.customerID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSalesReportRequest implements CustomerSalesReportRequest {
  const _CustomerSalesReportRequest({required this.fromDate, required this.toDate, this.branchID = '3', required this.fiscalYearID, this.customerID = 0});
  factory _CustomerSalesReportRequest.fromJson(Map<String, dynamic> json) => _$CustomerSalesReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  String branchID;
@override final  int fiscalYearID;
@override@JsonKey() final  int customerID;

/// Create a copy of CustomerSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSalesReportRequestCopyWith<_CustomerSalesReportRequest> get copyWith => __$CustomerSalesReportRequestCopyWithImpl<_CustomerSalesReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSalesReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.customerID, customerID) || other.customerID == customerID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,customerID);

@override
String toString() {
  return 'CustomerSalesReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, customerID: $customerID)';
}


}

/// @nodoc
abstract mixin class _$CustomerSalesReportRequestCopyWith<$Res> implements $CustomerSalesReportRequestCopyWith<$Res> {
  factory _$CustomerSalesReportRequestCopyWith(_CustomerSalesReportRequest value, $Res Function(_CustomerSalesReportRequest) _then) = __$CustomerSalesReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, int customerID
});




}
/// @nodoc
class __$CustomerSalesReportRequestCopyWithImpl<$Res>
    implements _$CustomerSalesReportRequestCopyWith<$Res> {
  __$CustomerSalesReportRequestCopyWithImpl(this._self, this._then);

  final _CustomerSalesReportRequest _self;
  final $Res Function(_CustomerSalesReportRequest) _then;

/// Create a copy of CustomerSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? customerID = null,}) {
  return _then(_CustomerSalesReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CustomerSalesReportResponse {

 bool get succeeded; String? get messages; CustomerSalesReportData? get data;
/// Create a copy of CustomerSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSalesReportResponseCopyWith<CustomerSalesReportResponse> get copyWith => _$CustomerSalesReportResponseCopyWithImpl<CustomerSalesReportResponse>(this as CustomerSalesReportResponse, _$identity);

  /// Serializes this CustomerSalesReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'CustomerSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $CustomerSalesReportResponseCopyWith<$Res>  {
  factory $CustomerSalesReportResponseCopyWith(CustomerSalesReportResponse value, $Res Function(CustomerSalesReportResponse) _then) = _$CustomerSalesReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, CustomerSalesReportData? data
});


$CustomerSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$CustomerSalesReportResponseCopyWithImpl<$Res>
    implements $CustomerSalesReportResponseCopyWith<$Res> {
  _$CustomerSalesReportResponseCopyWithImpl(this._self, this._then);

  final CustomerSalesReportResponse _self;
  final $Res Function(CustomerSalesReportResponse) _then;

/// Create a copy of CustomerSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CustomerSalesReportData?,
  ));
}
/// Create a copy of CustomerSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CustomerSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomerSalesReportResponse].
extension CustomerSalesReportResponsePatterns on CustomerSalesReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSalesReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSalesReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSalesReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  CustomerSalesReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  CustomerSalesReportData? data)  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  CustomerSalesReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSalesReportResponse implements CustomerSalesReportResponse {
  const _CustomerSalesReportResponse({this.succeeded = false, this.messages, this.data});
  factory _CustomerSalesReportResponse.fromJson(Map<String, dynamic> json) => _$CustomerSalesReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  CustomerSalesReportData? data;

/// Create a copy of CustomerSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSalesReportResponseCopyWith<_CustomerSalesReportResponse> get copyWith => __$CustomerSalesReportResponseCopyWithImpl<_CustomerSalesReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSalesReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'CustomerSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CustomerSalesReportResponseCopyWith<$Res> implements $CustomerSalesReportResponseCopyWith<$Res> {
  factory _$CustomerSalesReportResponseCopyWith(_CustomerSalesReportResponse value, $Res Function(_CustomerSalesReportResponse) _then) = __$CustomerSalesReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, CustomerSalesReportData? data
});


@override $CustomerSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$CustomerSalesReportResponseCopyWithImpl<$Res>
    implements _$CustomerSalesReportResponseCopyWith<$Res> {
  __$CustomerSalesReportResponseCopyWithImpl(this._self, this._then);

  final _CustomerSalesReportResponse _self;
  final $Res Function(_CustomerSalesReportResponse) _then;

/// Create a copy of CustomerSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_CustomerSalesReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as CustomerSalesReportData?,
  ));
}

/// Create a copy of CustomerSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $CustomerSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$CustomerSalesReportData {

 CustomerSalesReportSummary? get summary; List<CustomerSalesData> get data;
/// Create a copy of CustomerSalesReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSalesReportDataCopyWith<CustomerSalesReportData> get copyWith => _$CustomerSalesReportDataCopyWithImpl<CustomerSalesReportData>(this as CustomerSalesReportData, _$identity);

  /// Serializes this CustomerSalesReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'CustomerSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $CustomerSalesReportDataCopyWith<$Res>  {
  factory $CustomerSalesReportDataCopyWith(CustomerSalesReportData value, $Res Function(CustomerSalesReportData) _then) = _$CustomerSalesReportDataCopyWithImpl;
@useResult
$Res call({
 CustomerSalesReportSummary? summary, List<CustomerSalesData> data
});


$CustomerSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$CustomerSalesReportDataCopyWithImpl<$Res>
    implements $CustomerSalesReportDataCopyWith<$Res> {
  _$CustomerSalesReportDataCopyWithImpl(this._self, this._then);

  final CustomerSalesReportData _self;
  final $Res Function(CustomerSalesReportData) _then;

/// Create a copy of CustomerSalesReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CustomerSalesReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CustomerSalesData>,
  ));
}
/// Create a copy of CustomerSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $CustomerSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CustomerSalesReportData].
extension CustomerSalesReportDataPatterns on CustomerSalesReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSalesReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSalesReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSalesReportData value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSalesReportData value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CustomerSalesReportSummary? summary,  List<CustomerSalesData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSalesReportData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CustomerSalesReportSummary? summary,  List<CustomerSalesData> data)  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CustomerSalesReportSummary? summary,  List<CustomerSalesData> data)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSalesReportData implements CustomerSalesReportData {
  const _CustomerSalesReportData({this.summary, final  List<CustomerSalesData> data = const []}): _data = data;
  factory _CustomerSalesReportData.fromJson(Map<String, dynamic> json) => _$CustomerSalesReportDataFromJson(json);

@override final  CustomerSalesReportSummary? summary;
 final  List<CustomerSalesData> _data;
@override@JsonKey() List<CustomerSalesData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of CustomerSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSalesReportDataCopyWith<_CustomerSalesReportData> get copyWith => __$CustomerSalesReportDataCopyWithImpl<_CustomerSalesReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSalesReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'CustomerSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$CustomerSalesReportDataCopyWith<$Res> implements $CustomerSalesReportDataCopyWith<$Res> {
  factory _$CustomerSalesReportDataCopyWith(_CustomerSalesReportData value, $Res Function(_CustomerSalesReportData) _then) = __$CustomerSalesReportDataCopyWithImpl;
@override @useResult
$Res call({
 CustomerSalesReportSummary? summary, List<CustomerSalesData> data
});


@override $CustomerSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$CustomerSalesReportDataCopyWithImpl<$Res>
    implements _$CustomerSalesReportDataCopyWith<$Res> {
  __$CustomerSalesReportDataCopyWithImpl(this._self, this._then);

  final _CustomerSalesReportData _self;
  final $Res Function(_CustomerSalesReportData) _then;

/// Create a copy of CustomerSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_CustomerSalesReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as CustomerSalesReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CustomerSalesData>,
  ));
}

/// Create a copy of CustomerSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $CustomerSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$CustomerSalesReportSummary {

 int get totalBills; int get totalQuantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of CustomerSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSalesReportSummaryCopyWith<CustomerSalesReportSummary> get copyWith => _$CustomerSalesReportSummaryCopyWithImpl<CustomerSalesReportSummary>(this as CustomerSalesReportSummary, _$identity);

  /// Serializes this CustomerSalesReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'CustomerSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $CustomerSalesReportSummaryCopyWith<$Res>  {
  factory $CustomerSalesReportSummaryCopyWith(CustomerSalesReportSummary value, $Res Function(CustomerSalesReportSummary) _then) = _$CustomerSalesReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$CustomerSalesReportSummaryCopyWithImpl<$Res>
    implements $CustomerSalesReportSummaryCopyWith<$Res> {
  _$CustomerSalesReportSummaryCopyWithImpl(this._self, this._then);

  final CustomerSalesReportSummary _self;
  final $Res Function(CustomerSalesReportSummary) _then;

/// Create a copy of CustomerSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_self.copyWith(
totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerSalesReportSummary].
extension CustomerSalesReportSummaryPatterns on CustomerSalesReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSalesReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSalesReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSalesReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalBills,  int totalQuantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalBills,  int totalQuantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportSummary():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalBills,  int totalQuantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSalesReportSummary implements CustomerSalesReportSummary {
  const _CustomerSalesReportSummary({this.totalBills = 0, this.totalQuantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _CustomerSalesReportSummary.fromJson(Map<String, dynamic> json) => _$CustomerSalesReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int totalQuantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of CustomerSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSalesReportSummaryCopyWith<_CustomerSalesReportSummary> get copyWith => __$CustomerSalesReportSummaryCopyWithImpl<_CustomerSalesReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSalesReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'CustomerSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$CustomerSalesReportSummaryCopyWith<$Res> implements $CustomerSalesReportSummaryCopyWith<$Res> {
  factory _$CustomerSalesReportSummaryCopyWith(_CustomerSalesReportSummary value, $Res Function(_CustomerSalesReportSummary) _then) = __$CustomerSalesReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$CustomerSalesReportSummaryCopyWithImpl<$Res>
    implements _$CustomerSalesReportSummaryCopyWith<$Res> {
  __$CustomerSalesReportSummaryCopyWithImpl(this._self, this._then);

  final _CustomerSalesReportSummary _self;
  final $Res Function(_CustomerSalesReportSummary) _then;

/// Create a copy of CustomerSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_CustomerSalesReportSummary(
totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,totalQuantity: null == totalQuantity ? _self.totalQuantity : totalQuantity // ignore: cast_nullable_to_non_nullable
as int,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CustomerSalesData {

 int? get sn; int? get customerID; String? get customerName; int? get totalBills; int? get quantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of CustomerSalesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerSalesDataCopyWith<CustomerSalesData> get copyWith => _$CustomerSalesDataCopyWithImpl<CustomerSalesData>(this as CustomerSalesData, _$identity);

  /// Serializes this CustomerSalesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,customerID,customerName,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'CustomerSalesData(sn: $sn, customerID: $customerID, customerName: $customerName, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $CustomerSalesDataCopyWith<$Res>  {
  factory $CustomerSalesDataCopyWith(CustomerSalesData value, $Res Function(CustomerSalesData) _then) = _$CustomerSalesDataCopyWithImpl;
@useResult
$Res call({
 int? sn, int? customerID, String? customerName, int? totalBills, int? quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$CustomerSalesDataCopyWithImpl<$Res>
    implements $CustomerSalesDataCopyWith<$Res> {
  _$CustomerSalesDataCopyWithImpl(this._self, this._then);

  final CustomerSalesData _self;
  final $Res Function(CustomerSalesData) _then;

/// Create a copy of CustomerSalesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sn = freezed,Object? customerID = freezed,Object? customerName = freezed,Object? totalBills = freezed,Object? quantity = freezed,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_self.copyWith(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,customerID: freezed == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,totalBills: freezed == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerSalesData].
extension CustomerSalesDataPatterns on CustomerSalesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerSalesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerSalesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerSalesData value)  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerSalesData value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerSalesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sn,  int? customerID,  String? customerName,  int? totalBills,  int? quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerSalesData() when $default != null:
return $default(_that.sn,_that.customerID,_that.customerName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sn,  int? customerID,  String? customerName,  int? totalBills,  int? quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesData():
return $default(_that.sn,_that.customerID,_that.customerName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sn,  int? customerID,  String? customerName,  int? totalBills,  int? quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,) {final _that = this;
switch (_that) {
case _CustomerSalesData() when $default != null:
return $default(_that.sn,_that.customerID,_that.customerName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerSalesData implements CustomerSalesData {
  const _CustomerSalesData({this.sn, this.customerID, this.customerName, this.totalBills, this.quantity, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _CustomerSalesData.fromJson(Map<String, dynamic> json) => _$CustomerSalesDataFromJson(json);

@override final  int? sn;
@override final  int? customerID;
@override final  String? customerName;
@override final  int? totalBills;
@override final  int? quantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of CustomerSalesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerSalesDataCopyWith<_CustomerSalesData> get copyWith => __$CustomerSalesDataCopyWithImpl<_CustomerSalesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerSalesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,customerID,customerName,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'CustomerSalesData(sn: $sn, customerID: $customerID, customerName: $customerName, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$CustomerSalesDataCopyWith<$Res> implements $CustomerSalesDataCopyWith<$Res> {
  factory _$CustomerSalesDataCopyWith(_CustomerSalesData value, $Res Function(_CustomerSalesData) _then) = __$CustomerSalesDataCopyWithImpl;
@override @useResult
$Res call({
 int? sn, int? customerID, String? customerName, int? totalBills, int? quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$CustomerSalesDataCopyWithImpl<$Res>
    implements _$CustomerSalesDataCopyWith<$Res> {
  __$CustomerSalesDataCopyWithImpl(this._self, this._then);

  final _CustomerSalesData _self;
  final $Res Function(_CustomerSalesData) _then;

/// Create a copy of CustomerSalesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sn = freezed,Object? customerID = freezed,Object? customerName = freezed,Object? totalBills = freezed,Object? quantity = freezed,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_CustomerSalesData(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,customerID: freezed == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,totalBills: freezed == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
