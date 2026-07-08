// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SalesReportRequest {

 String get fromDate; String get toDate; int get customerID; int get tableID; int get paymentMethod; String get invoiceNo; int get branchID; int get fiscalYearID;
/// Create a copy of SalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesReportRequestCopyWith<SalesReportRequest> get copyWith => _$SalesReportRequestCopyWithImpl<SalesReportRequest>(this as SalesReportRequest, _$identity);

  /// Serializes this SalesReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,customerID,tableID,paymentMethod,invoiceNo,branchID,fiscalYearID);

@override
String toString() {
  return 'SalesReportRequest(fromDate: $fromDate, toDate: $toDate, customerID: $customerID, tableID: $tableID, paymentMethod: $paymentMethod, invoiceNo: $invoiceNo, branchID: $branchID, fiscalYearID: $fiscalYearID)';
}


}

/// @nodoc
abstract mixin class $SalesReportRequestCopyWith<$Res>  {
  factory $SalesReportRequestCopyWith(SalesReportRequest value, $Res Function(SalesReportRequest) _then) = _$SalesReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, int customerID, int tableID, int paymentMethod, String invoiceNo, int branchID, int fiscalYearID
});




}
/// @nodoc
class _$SalesReportRequestCopyWithImpl<$Res>
    implements $SalesReportRequestCopyWith<$Res> {
  _$SalesReportRequestCopyWithImpl(this._self, this._then);

  final SalesReportRequest _self;
  final $Res Function(SalesReportRequest) _then;

/// Create a copy of SalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? customerID = null,Object? tableID = null,Object? paymentMethod = null,Object? invoiceNo = null,Object? branchID = null,Object? fiscalYearID = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int,invoiceNo: null == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as int,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesReportRequest].
extension SalesReportRequestPatterns on SalesReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _SalesReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  int customerID,  int tableID,  int paymentMethod,  String invoiceNo,  int branchID,  int fiscalYearID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.customerID,_that.tableID,_that.paymentMethod,_that.invoiceNo,_that.branchID,_that.fiscalYearID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  int customerID,  int tableID,  int paymentMethod,  String invoiceNo,  int branchID,  int fiscalYearID)  $default,) {final _that = this;
switch (_that) {
case _SalesReportRequest():
return $default(_that.fromDate,_that.toDate,_that.customerID,_that.tableID,_that.paymentMethod,_that.invoiceNo,_that.branchID,_that.fiscalYearID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  int customerID,  int tableID,  int paymentMethod,  String invoiceNo,  int branchID,  int fiscalYearID)?  $default,) {final _that = this;
switch (_that) {
case _SalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.customerID,_that.tableID,_that.paymentMethod,_that.invoiceNo,_that.branchID,_that.fiscalYearID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesReportRequest implements SalesReportRequest {
  const _SalesReportRequest({required this.fromDate, required this.toDate, this.customerID = 0, this.tableID = 0, this.paymentMethod = 0, this.invoiceNo = '', this.branchID = 0, required this.fiscalYearID});
  factory _SalesReportRequest.fromJson(Map<String, dynamic> json) => _$SalesReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  int customerID;
@override@JsonKey() final  int tableID;
@override@JsonKey() final  int paymentMethod;
@override@JsonKey() final  String invoiceNo;
@override@JsonKey() final  int branchID;
@override final  int fiscalYearID;

/// Create a copy of SalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesReportRequestCopyWith<_SalesReportRequest> get copyWith => __$SalesReportRequestCopyWithImpl<_SalesReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,customerID,tableID,paymentMethod,invoiceNo,branchID,fiscalYearID);

@override
String toString() {
  return 'SalesReportRequest(fromDate: $fromDate, toDate: $toDate, customerID: $customerID, tableID: $tableID, paymentMethod: $paymentMethod, invoiceNo: $invoiceNo, branchID: $branchID, fiscalYearID: $fiscalYearID)';
}


}

/// @nodoc
abstract mixin class _$SalesReportRequestCopyWith<$Res> implements $SalesReportRequestCopyWith<$Res> {
  factory _$SalesReportRequestCopyWith(_SalesReportRequest value, $Res Function(_SalesReportRequest) _then) = __$SalesReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, int customerID, int tableID, int paymentMethod, String invoiceNo, int branchID, int fiscalYearID
});




}
/// @nodoc
class __$SalesReportRequestCopyWithImpl<$Res>
    implements _$SalesReportRequestCopyWith<$Res> {
  __$SalesReportRequestCopyWithImpl(this._self, this._then);

  final _SalesReportRequest _self;
  final $Res Function(_SalesReportRequest) _then;

/// Create a copy of SalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? customerID = null,Object? tableID = null,Object? paymentMethod = null,Object? invoiceNo = null,Object? branchID = null,Object? fiscalYearID = null,}) {
  return _then(_SalesReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as int,invoiceNo: null == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as int,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SalesReportResponse {

 bool get succeeded; String? get messages; SalesReportData? get data;
/// Create a copy of SalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesReportResponseCopyWith<SalesReportResponse> get copyWith => _$SalesReportResponseCopyWithImpl<SalesReportResponse>(this as SalesReportResponse, _$identity);

  /// Serializes this SalesReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'SalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $SalesReportResponseCopyWith<$Res>  {
  factory $SalesReportResponseCopyWith(SalesReportResponse value, $Res Function(SalesReportResponse) _then) = _$SalesReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, SalesReportData? data
});


$SalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$SalesReportResponseCopyWithImpl<$Res>
    implements $SalesReportResponseCopyWith<$Res> {
  _$SalesReportResponseCopyWithImpl(this._self, this._then);

  final SalesReportResponse _self;
  final $Res Function(SalesReportResponse) _then;

/// Create a copy of SalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SalesReportData?,
  ));
}
/// Create a copy of SalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesReportResponse].
extension SalesReportResponsePatterns on SalesReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _SalesReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  SalesReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  SalesReportData? data)  $default,) {final _that = this;
switch (_that) {
case _SalesReportResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  SalesReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _SalesReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesReportResponse implements SalesReportResponse {
  const _SalesReportResponse({this.succeeded = false, this.messages, this.data});
  factory _SalesReportResponse.fromJson(Map<String, dynamic> json) => _$SalesReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  SalesReportData? data;

/// Create a copy of SalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesReportResponseCopyWith<_SalesReportResponse> get copyWith => __$SalesReportResponseCopyWithImpl<_SalesReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'SalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SalesReportResponseCopyWith<$Res> implements $SalesReportResponseCopyWith<$Res> {
  factory _$SalesReportResponseCopyWith(_SalesReportResponse value, $Res Function(_SalesReportResponse) _then) = __$SalesReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, SalesReportData? data
});


@override $SalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$SalesReportResponseCopyWithImpl<$Res>
    implements _$SalesReportResponseCopyWith<$Res> {
  __$SalesReportResponseCopyWithImpl(this._self, this._then);

  final _SalesReportResponse _self;
  final $Res Function(_SalesReportResponse) _then;

/// Create a copy of SalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_SalesReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as SalesReportData?,
  ));
}

/// Create a copy of SalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $SalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$SalesReportData {

 SalesReportSummary? get summary; List<SalesInvoiceData> get data;
/// Create a copy of SalesReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesReportDataCopyWith<SalesReportData> get copyWith => _$SalesReportDataCopyWithImpl<SalesReportData>(this as SalesReportData, _$identity);

  /// Serializes this SalesReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $SalesReportDataCopyWith<$Res>  {
  factory $SalesReportDataCopyWith(SalesReportData value, $Res Function(SalesReportData) _then) = _$SalesReportDataCopyWithImpl;
@useResult
$Res call({
 SalesReportSummary? summary, List<SalesInvoiceData> data
});


$SalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$SalesReportDataCopyWithImpl<$Res>
    implements $SalesReportDataCopyWith<$Res> {
  _$SalesReportDataCopyWithImpl(this._self, this._then);

  final SalesReportData _self;
  final $Res Function(SalesReportData) _then;

/// Create a copy of SalesReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SalesReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SalesInvoiceData>,
  ));
}
/// Create a copy of SalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesReportData].
extension SalesReportDataPatterns on SalesReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesReportData value)  $default,){
final _that = this;
switch (_that) {
case _SalesReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesReportData value)?  $default,){
final _that = this;
switch (_that) {
case _SalesReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SalesReportSummary? summary,  List<SalesInvoiceData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesReportData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SalesReportSummary? summary,  List<SalesInvoiceData> data)  $default,) {final _that = this;
switch (_that) {
case _SalesReportData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SalesReportSummary? summary,  List<SalesInvoiceData> data)?  $default,) {final _that = this;
switch (_that) {
case _SalesReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesReportData implements SalesReportData {
  const _SalesReportData({this.summary, final  List<SalesInvoiceData> data = const []}): _data = data;
  factory _SalesReportData.fromJson(Map<String, dynamic> json) => _$SalesReportDataFromJson(json);

@override final  SalesReportSummary? summary;
 final  List<SalesInvoiceData> _data;
@override@JsonKey() List<SalesInvoiceData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesReportDataCopyWith<_SalesReportData> get copyWith => __$SalesReportDataCopyWithImpl<_SalesReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SalesReportDataCopyWith<$Res> implements $SalesReportDataCopyWith<$Res> {
  factory _$SalesReportDataCopyWith(_SalesReportData value, $Res Function(_SalesReportData) _then) = __$SalesReportDataCopyWithImpl;
@override @useResult
$Res call({
 SalesReportSummary? summary, List<SalesInvoiceData> data
});


@override $SalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$SalesReportDataCopyWithImpl<$Res>
    implements _$SalesReportDataCopyWith<$Res> {
  __$SalesReportDataCopyWithImpl(this._self, this._then);

  final _SalesReportData _self;
  final $Res Function(_SalesReportData) _then;

/// Create a copy of SalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_SalesReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as SalesReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SalesInvoiceData>,
  ));
}

/// Create a copy of SalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $SalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$SalesReportSummary {

 int get totalBills; double get subTotal; double get discount; double get tax; double get grandTotal; int get totalItems;
/// Create a copy of SalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesReportSummaryCopyWith<SalesReportSummary> get copyWith => _$SalesReportSummaryCopyWithImpl<SalesReportSummary>(this as SalesReportSummary, _$identity);

  /// Serializes this SalesReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,subTotal,discount,tax,grandTotal,totalItems);

@override
String toString() {
  return 'SalesReportSummary(totalBills: $totalBills, subTotal: $subTotal, discount: $discount, tax: $tax, grandTotal: $grandTotal, totalItems: $totalItems)';
}


}

/// @nodoc
abstract mixin class $SalesReportSummaryCopyWith<$Res>  {
  factory $SalesReportSummaryCopyWith(SalesReportSummary value, $Res Function(SalesReportSummary) _then) = _$SalesReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, double subTotal, double discount, double tax, double grandTotal, int totalItems
});




}
/// @nodoc
class _$SalesReportSummaryCopyWithImpl<$Res>
    implements $SalesReportSummaryCopyWith<$Res> {
  _$SalesReportSummaryCopyWithImpl(this._self, this._then);

  final SalesReportSummary _self;
  final $Res Function(SalesReportSummary) _then;

/// Create a copy of SalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalBills = null,Object? subTotal = null,Object? discount = null,Object? tax = null,Object? grandTotal = null,Object? totalItems = null,}) {
  return _then(_self.copyWith(
totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesReportSummary].
extension SalesReportSummaryPatterns on SalesReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _SalesReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _SalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalBills,  double subTotal,  double discount,  double tax,  double grandTotal,  int totalItems)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.subTotal,_that.discount,_that.tax,_that.grandTotal,_that.totalItems);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalBills,  double subTotal,  double discount,  double tax,  double grandTotal,  int totalItems)  $default,) {final _that = this;
switch (_that) {
case _SalesReportSummary():
return $default(_that.totalBills,_that.subTotal,_that.discount,_that.tax,_that.grandTotal,_that.totalItems);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalBills,  double subTotal,  double discount,  double tax,  double grandTotal,  int totalItems)?  $default,) {final _that = this;
switch (_that) {
case _SalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.subTotal,_that.discount,_that.tax,_that.grandTotal,_that.totalItems);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesReportSummary implements SalesReportSummary {
  const _SalesReportSummary({this.totalBills = 0, this.subTotal = 0.0, this.discount = 0.0, this.tax = 0.0, this.grandTotal = 0.0, this.totalItems = 0});
  factory _SalesReportSummary.fromJson(Map<String, dynamic> json) => _$SalesReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  double subTotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double tax;
@override@JsonKey() final  double grandTotal;
@override@JsonKey() final  int totalItems;

/// Create a copy of SalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesReportSummaryCopyWith<_SalesReportSummary> get copyWith => __$SalesReportSummaryCopyWithImpl<_SalesReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal)&&(identical(other.totalItems, totalItems) || other.totalItems == totalItems));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,subTotal,discount,tax,grandTotal,totalItems);

@override
String toString() {
  return 'SalesReportSummary(totalBills: $totalBills, subTotal: $subTotal, discount: $discount, tax: $tax, grandTotal: $grandTotal, totalItems: $totalItems)';
}


}

/// @nodoc
abstract mixin class _$SalesReportSummaryCopyWith<$Res> implements $SalesReportSummaryCopyWith<$Res> {
  factory _$SalesReportSummaryCopyWith(_SalesReportSummary value, $Res Function(_SalesReportSummary) _then) = __$SalesReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, double subTotal, double discount, double tax, double grandTotal, int totalItems
});




}
/// @nodoc
class __$SalesReportSummaryCopyWithImpl<$Res>
    implements _$SalesReportSummaryCopyWith<$Res> {
  __$SalesReportSummaryCopyWithImpl(this._self, this._then);

  final _SalesReportSummary _self;
  final $Res Function(_SalesReportSummary) _then;

/// Create a copy of SalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? subTotal = null,Object? discount = null,Object? tax = null,Object? grandTotal = null,Object? totalItems = null,}) {
  return _then(_SalesReportSummary(
totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,totalItems: null == totalItems ? _self.totalItems : totalItems // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SalesInvoiceData {

 int? get billingMasterID; String? get invoiceNo; String? get billingDate; String? get customerName; String? get tableNumber; String? get paymentMethodName; double get subTotal; double get discount; double get tax; double get grandTotal;
/// Create a copy of SalesInvoiceData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesInvoiceDataCopyWith<SalesInvoiceData> get copyWith => _$SalesInvoiceDataCopyWithImpl<SalesInvoiceData>(this as SalesInvoiceData, _$identity);

  /// Serializes this SalesInvoiceData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesInvoiceData&&(identical(other.billingMasterID, billingMasterID) || other.billingMasterID == billingMasterID)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.billingDate, billingDate) || other.billingDate == billingDate)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.paymentMethodName, paymentMethodName) || other.paymentMethodName == paymentMethodName)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,billingMasterID,invoiceNo,billingDate,customerName,tableNumber,paymentMethodName,subTotal,discount,tax,grandTotal);

@override
String toString() {
  return 'SalesInvoiceData(billingMasterID: $billingMasterID, invoiceNo: $invoiceNo, billingDate: $billingDate, customerName: $customerName, tableNumber: $tableNumber, paymentMethodName: $paymentMethodName, subTotal: $subTotal, discount: $discount, tax: $tax, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class $SalesInvoiceDataCopyWith<$Res>  {
  factory $SalesInvoiceDataCopyWith(SalesInvoiceData value, $Res Function(SalesInvoiceData) _then) = _$SalesInvoiceDataCopyWithImpl;
@useResult
$Res call({
 int? billingMasterID, String? invoiceNo, String? billingDate, String? customerName, String? tableNumber, String? paymentMethodName, double subTotal, double discount, double tax, double grandTotal
});




}
/// @nodoc
class _$SalesInvoiceDataCopyWithImpl<$Res>
    implements $SalesInvoiceDataCopyWith<$Res> {
  _$SalesInvoiceDataCopyWithImpl(this._self, this._then);

  final SalesInvoiceData _self;
  final $Res Function(SalesInvoiceData) _then;

/// Create a copy of SalesInvoiceData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? billingMasterID = freezed,Object? invoiceNo = freezed,Object? billingDate = freezed,Object? customerName = freezed,Object? tableNumber = freezed,Object? paymentMethodName = freezed,Object? subTotal = null,Object? discount = null,Object? tax = null,Object? grandTotal = null,}) {
  return _then(_self.copyWith(
billingMasterID: freezed == billingMasterID ? _self.billingMasterID : billingMasterID // ignore: cast_nullable_to_non_nullable
as int?,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,billingDate: freezed == billingDate ? _self.billingDate : billingDate // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,paymentMethodName: freezed == paymentMethodName ? _self.paymentMethodName : paymentMethodName // ignore: cast_nullable_to_non_nullable
as String?,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesInvoiceData].
extension SalesInvoiceDataPatterns on SalesInvoiceData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesInvoiceData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesInvoiceData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesInvoiceData value)  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesInvoiceData value)?  $default,){
final _that = this;
switch (_that) {
case _SalesInvoiceData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? billingMasterID,  String? invoiceNo,  String? billingDate,  String? customerName,  String? tableNumber,  String? paymentMethodName,  double subTotal,  double discount,  double tax,  double grandTotal)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesInvoiceData() when $default != null:
return $default(_that.billingMasterID,_that.invoiceNo,_that.billingDate,_that.customerName,_that.tableNumber,_that.paymentMethodName,_that.subTotal,_that.discount,_that.tax,_that.grandTotal);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? billingMasterID,  String? invoiceNo,  String? billingDate,  String? customerName,  String? tableNumber,  String? paymentMethodName,  double subTotal,  double discount,  double tax,  double grandTotal)  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceData():
return $default(_that.billingMasterID,_that.invoiceNo,_that.billingDate,_that.customerName,_that.tableNumber,_that.paymentMethodName,_that.subTotal,_that.discount,_that.tax,_that.grandTotal);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? billingMasterID,  String? invoiceNo,  String? billingDate,  String? customerName,  String? tableNumber,  String? paymentMethodName,  double subTotal,  double discount,  double tax,  double grandTotal)?  $default,) {final _that = this;
switch (_that) {
case _SalesInvoiceData() when $default != null:
return $default(_that.billingMasterID,_that.invoiceNo,_that.billingDate,_that.customerName,_that.tableNumber,_that.paymentMethodName,_that.subTotal,_that.discount,_that.tax,_that.grandTotal);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesInvoiceData implements SalesInvoiceData {
  const _SalesInvoiceData({this.billingMasterID, this.invoiceNo, this.billingDate, this.customerName, this.tableNumber, this.paymentMethodName, this.subTotal = 0.0, this.discount = 0.0, this.tax = 0.0, this.grandTotal = 0.0});
  factory _SalesInvoiceData.fromJson(Map<String, dynamic> json) => _$SalesInvoiceDataFromJson(json);

@override final  int? billingMasterID;
@override final  String? invoiceNo;
@override final  String? billingDate;
@override final  String? customerName;
@override final  String? tableNumber;
@override final  String? paymentMethodName;
@override@JsonKey() final  double subTotal;
@override@JsonKey() final  double discount;
@override@JsonKey() final  double tax;
@override@JsonKey() final  double grandTotal;

/// Create a copy of SalesInvoiceData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesInvoiceDataCopyWith<_SalesInvoiceData> get copyWith => __$SalesInvoiceDataCopyWithImpl<_SalesInvoiceData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesInvoiceDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesInvoiceData&&(identical(other.billingMasterID, billingMasterID) || other.billingMasterID == billingMasterID)&&(identical(other.invoiceNo, invoiceNo) || other.invoiceNo == invoiceNo)&&(identical(other.billingDate, billingDate) || other.billingDate == billingDate)&&(identical(other.customerName, customerName) || other.customerName == customerName)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.paymentMethodName, paymentMethodName) || other.paymentMethodName == paymentMethodName)&&(identical(other.subTotal, subTotal) || other.subTotal == subTotal)&&(identical(other.discount, discount) || other.discount == discount)&&(identical(other.tax, tax) || other.tax == tax)&&(identical(other.grandTotal, grandTotal) || other.grandTotal == grandTotal));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,billingMasterID,invoiceNo,billingDate,customerName,tableNumber,paymentMethodName,subTotal,discount,tax,grandTotal);

@override
String toString() {
  return 'SalesInvoiceData(billingMasterID: $billingMasterID, invoiceNo: $invoiceNo, billingDate: $billingDate, customerName: $customerName, tableNumber: $tableNumber, paymentMethodName: $paymentMethodName, subTotal: $subTotal, discount: $discount, tax: $tax, grandTotal: $grandTotal)';
}


}

/// @nodoc
abstract mixin class _$SalesInvoiceDataCopyWith<$Res> implements $SalesInvoiceDataCopyWith<$Res> {
  factory _$SalesInvoiceDataCopyWith(_SalesInvoiceData value, $Res Function(_SalesInvoiceData) _then) = __$SalesInvoiceDataCopyWithImpl;
@override @useResult
$Res call({
 int? billingMasterID, String? invoiceNo, String? billingDate, String? customerName, String? tableNumber, String? paymentMethodName, double subTotal, double discount, double tax, double grandTotal
});




}
/// @nodoc
class __$SalesInvoiceDataCopyWithImpl<$Res>
    implements _$SalesInvoiceDataCopyWith<$Res> {
  __$SalesInvoiceDataCopyWithImpl(this._self, this._then);

  final _SalesInvoiceData _self;
  final $Res Function(_SalesInvoiceData) _then;

/// Create a copy of SalesInvoiceData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? billingMasterID = freezed,Object? invoiceNo = freezed,Object? billingDate = freezed,Object? customerName = freezed,Object? tableNumber = freezed,Object? paymentMethodName = freezed,Object? subTotal = null,Object? discount = null,Object? tax = null,Object? grandTotal = null,}) {
  return _then(_SalesInvoiceData(
billingMasterID: freezed == billingMasterID ? _self.billingMasterID : billingMasterID // ignore: cast_nullable_to_non_nullable
as int?,invoiceNo: freezed == invoiceNo ? _self.invoiceNo : invoiceNo // ignore: cast_nullable_to_non_nullable
as String?,billingDate: freezed == billingDate ? _self.billingDate : billingDate // ignore: cast_nullable_to_non_nullable
as String?,customerName: freezed == customerName ? _self.customerName : customerName // ignore: cast_nullable_to_non_nullable
as String?,tableNumber: freezed == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String?,paymentMethodName: freezed == paymentMethodName ? _self.paymentMethodName : paymentMethodName // ignore: cast_nullable_to_non_nullable
as String?,subTotal: null == subTotal ? _self.subTotal : subTotal // ignore: cast_nullable_to_non_nullable
as double,discount: null == discount ? _self.discount : discount // ignore: cast_nullable_to_non_nullable
as double,tax: null == tax ? _self.tax : tax // ignore: cast_nullable_to_non_nullable
as double,grandTotal: null == grandTotal ? _self.grandTotal : grandTotal // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
