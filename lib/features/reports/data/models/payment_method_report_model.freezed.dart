// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_method_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentMethodReportRequest {

 String get fromDate; String get toDate; String get branchID; int get fiscalYearID; String get paymentMethod;
/// Create a copy of PaymentMethodReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodReportRequestCopyWith<PaymentMethodReportRequest> get copyWith => _$PaymentMethodReportRequestCopyWithImpl<PaymentMethodReportRequest>(this as PaymentMethodReportRequest, _$identity);

  /// Serializes this PaymentMethodReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,paymentMethod);

@override
String toString() {
  return 'PaymentMethodReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodReportRequestCopyWith<$Res>  {
  factory $PaymentMethodReportRequestCopyWith(PaymentMethodReportRequest value, $Res Function(PaymentMethodReportRequest) _then) = _$PaymentMethodReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, String paymentMethod
});




}
/// @nodoc
class _$PaymentMethodReportRequestCopyWithImpl<$Res>
    implements $PaymentMethodReportRequestCopyWith<$Res> {
  _$PaymentMethodReportRequestCopyWithImpl(this._self, this._then);

  final PaymentMethodReportRequest _self;
  final $Res Function(PaymentMethodReportRequest) _then;

/// Create a copy of PaymentMethodReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? paymentMethod = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodReportRequest].
extension PaymentMethodReportRequestPatterns on PaymentMethodReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  String paymentMethod)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  String paymentMethod)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodReportRequest():
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.paymentMethod);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  String paymentMethod)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.paymentMethod);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodReportRequest implements PaymentMethodReportRequest {
  const _PaymentMethodReportRequest({required this.fromDate, required this.toDate, this.branchID = '0', required this.fiscalYearID, this.paymentMethod = '1'});
  factory _PaymentMethodReportRequest.fromJson(Map<String, dynamic> json) => _$PaymentMethodReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  String branchID;
@override final  int fiscalYearID;
@override@JsonKey() final  String paymentMethod;

/// Create a copy of PaymentMethodReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodReportRequestCopyWith<_PaymentMethodReportRequest> get copyWith => __$PaymentMethodReportRequestCopyWithImpl<_PaymentMethodReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,paymentMethod);

@override
String toString() {
  return 'PaymentMethodReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, paymentMethod: $paymentMethod)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodReportRequestCopyWith<$Res> implements $PaymentMethodReportRequestCopyWith<$Res> {
  factory _$PaymentMethodReportRequestCopyWith(_PaymentMethodReportRequest value, $Res Function(_PaymentMethodReportRequest) _then) = __$PaymentMethodReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, String paymentMethod
});




}
/// @nodoc
class __$PaymentMethodReportRequestCopyWithImpl<$Res>
    implements _$PaymentMethodReportRequestCopyWith<$Res> {
  __$PaymentMethodReportRequestCopyWithImpl(this._self, this._then);

  final _PaymentMethodReportRequest _self;
  final $Res Function(_PaymentMethodReportRequest) _then;

/// Create a copy of PaymentMethodReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? paymentMethod = null,}) {
  return _then(_PaymentMethodReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PaymentMethodReportResponse {

 bool get succeeded; String? get messages; PaymentMethodReportData? get data;
/// Create a copy of PaymentMethodReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodReportResponseCopyWith<PaymentMethodReportResponse> get copyWith => _$PaymentMethodReportResponseCopyWithImpl<PaymentMethodReportResponse>(this as PaymentMethodReportResponse, _$identity);

  /// Serializes this PaymentMethodReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'PaymentMethodReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodReportResponseCopyWith<$Res>  {
  factory $PaymentMethodReportResponseCopyWith(PaymentMethodReportResponse value, $Res Function(PaymentMethodReportResponse) _then) = _$PaymentMethodReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, PaymentMethodReportData? data
});


$PaymentMethodReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$PaymentMethodReportResponseCopyWithImpl<$Res>
    implements $PaymentMethodReportResponseCopyWith<$Res> {
  _$PaymentMethodReportResponseCopyWithImpl(this._self, this._then);

  final PaymentMethodReportResponse _self;
  final $Res Function(PaymentMethodReportResponse) _then;

/// Create a copy of PaymentMethodReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaymentMethodReportData?,
  ));
}
/// Create a copy of PaymentMethodReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PaymentMethodReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentMethodReportResponse].
extension PaymentMethodReportResponsePatterns on PaymentMethodReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  PaymentMethodReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodReportResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  PaymentMethodReportData? data)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodReportResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  PaymentMethodReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodReportResponse implements PaymentMethodReportResponse {
  const _PaymentMethodReportResponse({this.succeeded = false, this.messages, this.data});
  factory _PaymentMethodReportResponse.fromJson(Map<String, dynamic> json) => _$PaymentMethodReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  PaymentMethodReportData? data;

/// Create a copy of PaymentMethodReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodReportResponseCopyWith<_PaymentMethodReportResponse> get copyWith => __$PaymentMethodReportResponseCopyWithImpl<_PaymentMethodReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'PaymentMethodReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodReportResponseCopyWith<$Res> implements $PaymentMethodReportResponseCopyWith<$Res> {
  factory _$PaymentMethodReportResponseCopyWith(_PaymentMethodReportResponse value, $Res Function(_PaymentMethodReportResponse) _then) = __$PaymentMethodReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, PaymentMethodReportData? data
});


@override $PaymentMethodReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$PaymentMethodReportResponseCopyWithImpl<$Res>
    implements _$PaymentMethodReportResponseCopyWith<$Res> {
  __$PaymentMethodReportResponseCopyWithImpl(this._self, this._then);

  final _PaymentMethodReportResponse _self;
  final $Res Function(_PaymentMethodReportResponse) _then;

/// Create a copy of PaymentMethodReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_PaymentMethodReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaymentMethodReportData?,
  ));
}

/// Create a copy of PaymentMethodReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $PaymentMethodReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$PaymentMethodReportData {

 PaymentMethodReportSummary? get summary; List<PaymentMethodItemData> get data;
/// Create a copy of PaymentMethodReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodReportDataCopyWith<PaymentMethodReportData> get copyWith => _$PaymentMethodReportDataCopyWithImpl<PaymentMethodReportData>(this as PaymentMethodReportData, _$identity);

  /// Serializes this PaymentMethodReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PaymentMethodReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodReportDataCopyWith<$Res>  {
  factory $PaymentMethodReportDataCopyWith(PaymentMethodReportData value, $Res Function(PaymentMethodReportData) _then) = _$PaymentMethodReportDataCopyWithImpl;
@useResult
$Res call({
 PaymentMethodReportSummary? summary, List<PaymentMethodItemData> data
});


$PaymentMethodReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$PaymentMethodReportDataCopyWithImpl<$Res>
    implements $PaymentMethodReportDataCopyWith<$Res> {
  _$PaymentMethodReportDataCopyWithImpl(this._self, this._then);

  final PaymentMethodReportData _self;
  final $Res Function(PaymentMethodReportData) _then;

/// Create a copy of PaymentMethodReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as PaymentMethodReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodItemData>,
  ));
}
/// Create a copy of PaymentMethodReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $PaymentMethodReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [PaymentMethodReportData].
extension PaymentMethodReportDataPatterns on PaymentMethodReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodReportData value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodReportData value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PaymentMethodReportSummary? summary,  List<PaymentMethodItemData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodReportData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PaymentMethodReportSummary? summary,  List<PaymentMethodItemData> data)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodReportData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PaymentMethodReportSummary? summary,  List<PaymentMethodItemData> data)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodReportData implements PaymentMethodReportData {
  const _PaymentMethodReportData({this.summary, final  List<PaymentMethodItemData> data = const []}): _data = data;
  factory _PaymentMethodReportData.fromJson(Map<String, dynamic> json) => _$PaymentMethodReportDataFromJson(json);

@override final  PaymentMethodReportSummary? summary;
 final  List<PaymentMethodItemData> _data;
@override@JsonKey() List<PaymentMethodItemData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of PaymentMethodReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodReportDataCopyWith<_PaymentMethodReportData> get copyWith => __$PaymentMethodReportDataCopyWithImpl<_PaymentMethodReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PaymentMethodReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodReportDataCopyWith<$Res> implements $PaymentMethodReportDataCopyWith<$Res> {
  factory _$PaymentMethodReportDataCopyWith(_PaymentMethodReportData value, $Res Function(_PaymentMethodReportData) _then) = __$PaymentMethodReportDataCopyWithImpl;
@override @useResult
$Res call({
 PaymentMethodReportSummary? summary, List<PaymentMethodItemData> data
});


@override $PaymentMethodReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$PaymentMethodReportDataCopyWithImpl<$Res>
    implements _$PaymentMethodReportDataCopyWith<$Res> {
  __$PaymentMethodReportDataCopyWithImpl(this._self, this._then);

  final _PaymentMethodReportData _self;
  final $Res Function(_PaymentMethodReportData) _then;

/// Create a copy of PaymentMethodReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_PaymentMethodReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as PaymentMethodReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PaymentMethodItemData>,
  ));
}

/// Create a copy of PaymentMethodReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PaymentMethodReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $PaymentMethodReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$PaymentMethodReportSummary {

 int get totalBills; int get totalQuantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of PaymentMethodReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodReportSummaryCopyWith<PaymentMethodReportSummary> get copyWith => _$PaymentMethodReportSummaryCopyWithImpl<PaymentMethodReportSummary>(this as PaymentMethodReportSummary, _$identity);

  /// Serializes this PaymentMethodReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'PaymentMethodReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodReportSummaryCopyWith<$Res>  {
  factory $PaymentMethodReportSummaryCopyWith(PaymentMethodReportSummary value, $Res Function(PaymentMethodReportSummary) _then) = _$PaymentMethodReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$PaymentMethodReportSummaryCopyWithImpl<$Res>
    implements $PaymentMethodReportSummaryCopyWith<$Res> {
  _$PaymentMethodReportSummaryCopyWithImpl(this._self, this._then);

  final PaymentMethodReportSummary _self;
  final $Res Function(PaymentMethodReportSummary) _then;

/// Create a copy of PaymentMethodReportSummary
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


/// Adds pattern-matching-related methods to [PaymentMethodReportSummary].
extension PaymentMethodReportSummaryPatterns on PaymentMethodReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodReportSummary() when $default != null:
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
case _PaymentMethodReportSummary() when $default != null:
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
case _PaymentMethodReportSummary():
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
case _PaymentMethodReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodReportSummary implements PaymentMethodReportSummary {
  const _PaymentMethodReportSummary({this.totalBills = 0, this.totalQuantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _PaymentMethodReportSummary.fromJson(Map<String, dynamic> json) => _$PaymentMethodReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int totalQuantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of PaymentMethodReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodReportSummaryCopyWith<_PaymentMethodReportSummary> get copyWith => __$PaymentMethodReportSummaryCopyWithImpl<_PaymentMethodReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'PaymentMethodReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodReportSummaryCopyWith<$Res> implements $PaymentMethodReportSummaryCopyWith<$Res> {
  factory _$PaymentMethodReportSummaryCopyWith(_PaymentMethodReportSummary value, $Res Function(_PaymentMethodReportSummary) _then) = __$PaymentMethodReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$PaymentMethodReportSummaryCopyWithImpl<$Res>
    implements _$PaymentMethodReportSummaryCopyWith<$Res> {
  __$PaymentMethodReportSummaryCopyWithImpl(this._self, this._then);

  final _PaymentMethodReportSummary _self;
  final $Res Function(_PaymentMethodReportSummary) _then;

/// Create a copy of PaymentMethodReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_PaymentMethodReportSummary(
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
mixin _$PaymentMethodItemData {

 int? get sn; String? get paymentMethod; int get totalBills; int get quantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of PaymentMethodItemData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentMethodItemDataCopyWith<PaymentMethodItemData> get copyWith => _$PaymentMethodItemDataCopyWithImpl<PaymentMethodItemData>(this as PaymentMethodItemData, _$identity);

  /// Serializes this PaymentMethodItemData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentMethodItemData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,paymentMethod,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'PaymentMethodItemData(sn: $sn, paymentMethod: $paymentMethod, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $PaymentMethodItemDataCopyWith<$Res>  {
  factory $PaymentMethodItemDataCopyWith(PaymentMethodItemData value, $Res Function(PaymentMethodItemData) _then) = _$PaymentMethodItemDataCopyWithImpl;
@useResult
$Res call({
 int? sn, String? paymentMethod, int totalBills, int quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$PaymentMethodItemDataCopyWithImpl<$Res>
    implements $PaymentMethodItemDataCopyWith<$Res> {
  _$PaymentMethodItemDataCopyWithImpl(this._self, this._then);

  final PaymentMethodItemData _self;
  final $Res Function(PaymentMethodItemData) _then;

/// Create a copy of PaymentMethodItemData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sn = freezed,Object? paymentMethod = freezed,Object? totalBills = null,Object? quantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_self.copyWith(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentMethodItemData].
extension PaymentMethodItemDataPatterns on PaymentMethodItemData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentMethodItemData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentMethodItemData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentMethodItemData value)  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodItemData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentMethodItemData value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentMethodItemData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sn,  String? paymentMethod,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentMethodItemData() when $default != null:
return $default(_that.sn,_that.paymentMethod,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sn,  String? paymentMethod,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodItemData():
return $default(_that.sn,_that.paymentMethod,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sn,  String? paymentMethod,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,) {final _that = this;
switch (_that) {
case _PaymentMethodItemData() when $default != null:
return $default(_that.sn,_that.paymentMethod,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentMethodItemData implements PaymentMethodItemData {
  const _PaymentMethodItemData({this.sn, this.paymentMethod, this.totalBills = 0, this.quantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _PaymentMethodItemData.fromJson(Map<String, dynamic> json) => _$PaymentMethodItemDataFromJson(json);

@override final  int? sn;
@override final  String? paymentMethod;
@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of PaymentMethodItemData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentMethodItemDataCopyWith<_PaymentMethodItemData> get copyWith => __$PaymentMethodItemDataCopyWithImpl<_PaymentMethodItemData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentMethodItemDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentMethodItemData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.paymentMethod, paymentMethod) || other.paymentMethod == paymentMethod)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,paymentMethod,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'PaymentMethodItemData(sn: $sn, paymentMethod: $paymentMethod, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$PaymentMethodItemDataCopyWith<$Res> implements $PaymentMethodItemDataCopyWith<$Res> {
  factory _$PaymentMethodItemDataCopyWith(_PaymentMethodItemData value, $Res Function(_PaymentMethodItemData) _then) = __$PaymentMethodItemDataCopyWithImpl;
@override @useResult
$Res call({
 int? sn, String? paymentMethod, int totalBills, int quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$PaymentMethodItemDataCopyWithImpl<$Res>
    implements _$PaymentMethodItemDataCopyWith<$Res> {
  __$PaymentMethodItemDataCopyWithImpl(this._self, this._then);

  final _PaymentMethodItemData _self;
  final $Res Function(_PaymentMethodItemData) _then;

/// Create a copy of PaymentMethodItemData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sn = freezed,Object? paymentMethod = freezed,Object? totalBills = null,Object? quantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_PaymentMethodItemData(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,paymentMethod: freezed == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String?,totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,grossAmount: null == grossAmount ? _self.grossAmount : grossAmount // ignore: cast_nullable_to_non_nullable
as double,discountAmount: null == discountAmount ? _self.discountAmount : discountAmount // ignore: cast_nullable_to_non_nullable
as double,taxAmount: null == taxAmount ? _self.taxAmount : taxAmount // ignore: cast_nullable_to_non_nullable
as double,netAmount: null == netAmount ? _self.netAmount : netAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
