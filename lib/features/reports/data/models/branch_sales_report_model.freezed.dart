// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BranchSalesReportRequest {

 String get fromDate; String get toDate; String get branchID; int get fiscalYearID;
/// Create a copy of BranchSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchSalesReportRequestCopyWith<BranchSalesReportRequest> get copyWith => _$BranchSalesReportRequestCopyWithImpl<BranchSalesReportRequest>(this as BranchSalesReportRequest, _$identity);

  /// Serializes this BranchSalesReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID);

@override
String toString() {
  return 'BranchSalesReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID)';
}


}

/// @nodoc
abstract mixin class $BranchSalesReportRequestCopyWith<$Res>  {
  factory $BranchSalesReportRequestCopyWith(BranchSalesReportRequest value, $Res Function(BranchSalesReportRequest) _then) = _$BranchSalesReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID
});




}
/// @nodoc
class _$BranchSalesReportRequestCopyWithImpl<$Res>
    implements $BranchSalesReportRequestCopyWith<$Res> {
  _$BranchSalesReportRequestCopyWithImpl(this._self, this._then);

  final BranchSalesReportRequest _self;
  final $Res Function(BranchSalesReportRequest) _then;

/// Create a copy of BranchSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [BranchSalesReportRequest].
extension BranchSalesReportRequestPatterns on BranchSalesReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchSalesReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchSalesReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchSalesReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID)  $default,) {final _that = this;
switch (_that) {
case _BranchSalesReportRequest():
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID)?  $default,) {final _that = this;
switch (_that) {
case _BranchSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchSalesReportRequest implements BranchSalesReportRequest {
  const _BranchSalesReportRequest({required this.fromDate, required this.toDate, this.branchID = '0', required this.fiscalYearID});
  factory _BranchSalesReportRequest.fromJson(Map<String, dynamic> json) => _$BranchSalesReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  String branchID;
@override final  int fiscalYearID;

/// Create a copy of BranchSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchSalesReportRequestCopyWith<_BranchSalesReportRequest> get copyWith => __$BranchSalesReportRequestCopyWithImpl<_BranchSalesReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchSalesReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID);

@override
String toString() {
  return 'BranchSalesReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID)';
}


}

/// @nodoc
abstract mixin class _$BranchSalesReportRequestCopyWith<$Res> implements $BranchSalesReportRequestCopyWith<$Res> {
  factory _$BranchSalesReportRequestCopyWith(_BranchSalesReportRequest value, $Res Function(_BranchSalesReportRequest) _then) = __$BranchSalesReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID
});




}
/// @nodoc
class __$BranchSalesReportRequestCopyWithImpl<$Res>
    implements _$BranchSalesReportRequestCopyWith<$Res> {
  __$BranchSalesReportRequestCopyWithImpl(this._self, this._then);

  final _BranchSalesReportRequest _self;
  final $Res Function(_BranchSalesReportRequest) _then;

/// Create a copy of BranchSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,}) {
  return _then(_BranchSalesReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$BranchSalesReportResponse {

 bool get succeeded; String? get messages; BranchSalesReportData? get data;
/// Create a copy of BranchSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchSalesReportResponseCopyWith<BranchSalesReportResponse> get copyWith => _$BranchSalesReportResponseCopyWithImpl<BranchSalesReportResponse>(this as BranchSalesReportResponse, _$identity);

  /// Serializes this BranchSalesReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'BranchSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $BranchSalesReportResponseCopyWith<$Res>  {
  factory $BranchSalesReportResponseCopyWith(BranchSalesReportResponse value, $Res Function(BranchSalesReportResponse) _then) = _$BranchSalesReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, BranchSalesReportData? data
});


$BranchSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$BranchSalesReportResponseCopyWithImpl<$Res>
    implements $BranchSalesReportResponseCopyWith<$Res> {
  _$BranchSalesReportResponseCopyWithImpl(this._self, this._then);

  final BranchSalesReportResponse _self;
  final $Res Function(BranchSalesReportResponse) _then;

/// Create a copy of BranchSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BranchSalesReportData?,
  ));
}
/// Create a copy of BranchSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BranchSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [BranchSalesReportResponse].
extension BranchSalesReportResponsePatterns on BranchSalesReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchSalesReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchSalesReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchSalesReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  BranchSalesReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  BranchSalesReportData? data)  $default,) {final _that = this;
switch (_that) {
case _BranchSalesReportResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  BranchSalesReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _BranchSalesReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchSalesReportResponse implements BranchSalesReportResponse {
  const _BranchSalesReportResponse({this.succeeded = false, this.messages, this.data});
  factory _BranchSalesReportResponse.fromJson(Map<String, dynamic> json) => _$BranchSalesReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  BranchSalesReportData? data;

/// Create a copy of BranchSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchSalesReportResponseCopyWith<_BranchSalesReportResponse> get copyWith => __$BranchSalesReportResponseCopyWithImpl<_BranchSalesReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchSalesReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'BranchSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BranchSalesReportResponseCopyWith<$Res> implements $BranchSalesReportResponseCopyWith<$Res> {
  factory _$BranchSalesReportResponseCopyWith(_BranchSalesReportResponse value, $Res Function(_BranchSalesReportResponse) _then) = __$BranchSalesReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, BranchSalesReportData? data
});


@override $BranchSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$BranchSalesReportResponseCopyWithImpl<$Res>
    implements _$BranchSalesReportResponseCopyWith<$Res> {
  __$BranchSalesReportResponseCopyWithImpl(this._self, this._then);

  final _BranchSalesReportResponse _self;
  final $Res Function(_BranchSalesReportResponse) _then;

/// Create a copy of BranchSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_BranchSalesReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as BranchSalesReportData?,
  ));
}

/// Create a copy of BranchSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $BranchSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$BranchSalesReportData {

 BranchSalesReportSummary? get summary; List<BranchSalesData> get data;
/// Create a copy of BranchSalesReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchSalesReportDataCopyWith<BranchSalesReportData> get copyWith => _$BranchSalesReportDataCopyWithImpl<BranchSalesReportData>(this as BranchSalesReportData, _$identity);

  /// Serializes this BranchSalesReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'BranchSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $BranchSalesReportDataCopyWith<$Res>  {
  factory $BranchSalesReportDataCopyWith(BranchSalesReportData value, $Res Function(BranchSalesReportData) _then) = _$BranchSalesReportDataCopyWithImpl;
@useResult
$Res call({
 BranchSalesReportSummary? summary, List<BranchSalesData> data
});


$BranchSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$BranchSalesReportDataCopyWithImpl<$Res>
    implements $BranchSalesReportDataCopyWith<$Res> {
  _$BranchSalesReportDataCopyWithImpl(this._self, this._then);

  final BranchSalesReportData _self;
  final $Res Function(BranchSalesReportData) _then;

/// Create a copy of BranchSalesReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BranchSalesReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<BranchSalesData>,
  ));
}
/// Create a copy of BranchSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $BranchSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [BranchSalesReportData].
extension BranchSalesReportDataPatterns on BranchSalesReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchSalesReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchSalesReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchSalesReportData value)  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchSalesReportData value)?  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( BranchSalesReportSummary? summary,  List<BranchSalesData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchSalesReportData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( BranchSalesReportSummary? summary,  List<BranchSalesData> data)  $default,) {final _that = this;
switch (_that) {
case _BranchSalesReportData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( BranchSalesReportSummary? summary,  List<BranchSalesData> data)?  $default,) {final _that = this;
switch (_that) {
case _BranchSalesReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchSalesReportData implements BranchSalesReportData {
  const _BranchSalesReportData({this.summary, final  List<BranchSalesData> data = const []}): _data = data;
  factory _BranchSalesReportData.fromJson(Map<String, dynamic> json) => _$BranchSalesReportDataFromJson(json);

@override final  BranchSalesReportSummary? summary;
 final  List<BranchSalesData> _data;
@override@JsonKey() List<BranchSalesData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of BranchSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchSalesReportDataCopyWith<_BranchSalesReportData> get copyWith => __$BranchSalesReportDataCopyWithImpl<_BranchSalesReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchSalesReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'BranchSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$BranchSalesReportDataCopyWith<$Res> implements $BranchSalesReportDataCopyWith<$Res> {
  factory _$BranchSalesReportDataCopyWith(_BranchSalesReportData value, $Res Function(_BranchSalesReportData) _then) = __$BranchSalesReportDataCopyWithImpl;
@override @useResult
$Res call({
 BranchSalesReportSummary? summary, List<BranchSalesData> data
});


@override $BranchSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$BranchSalesReportDataCopyWithImpl<$Res>
    implements _$BranchSalesReportDataCopyWith<$Res> {
  __$BranchSalesReportDataCopyWithImpl(this._self, this._then);

  final _BranchSalesReportData _self;
  final $Res Function(_BranchSalesReportData) _then;

/// Create a copy of BranchSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_BranchSalesReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as BranchSalesReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<BranchSalesData>,
  ));
}

/// Create a copy of BranchSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BranchSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $BranchSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$BranchSalesReportSummary {

 int get totalBills; int get totalQuantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of BranchSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchSalesReportSummaryCopyWith<BranchSalesReportSummary> get copyWith => _$BranchSalesReportSummaryCopyWithImpl<BranchSalesReportSummary>(this as BranchSalesReportSummary, _$identity);

  /// Serializes this BranchSalesReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'BranchSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $BranchSalesReportSummaryCopyWith<$Res>  {
  factory $BranchSalesReportSummaryCopyWith(BranchSalesReportSummary value, $Res Function(BranchSalesReportSummary) _then) = _$BranchSalesReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$BranchSalesReportSummaryCopyWithImpl<$Res>
    implements $BranchSalesReportSummaryCopyWith<$Res> {
  _$BranchSalesReportSummaryCopyWithImpl(this._self, this._then);

  final BranchSalesReportSummary _self;
  final $Res Function(BranchSalesReportSummary) _then;

/// Create a copy of BranchSalesReportSummary
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


/// Adds pattern-matching-related methods to [BranchSalesReportSummary].
extension BranchSalesReportSummaryPatterns on BranchSalesReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchSalesReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchSalesReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchSalesReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _BranchSalesReportSummary() when $default != null:
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
case _BranchSalesReportSummary() when $default != null:
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
case _BranchSalesReportSummary():
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
case _BranchSalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchSalesReportSummary implements BranchSalesReportSummary {
  const _BranchSalesReportSummary({this.totalBills = 0, this.totalQuantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _BranchSalesReportSummary.fromJson(Map<String, dynamic> json) => _$BranchSalesReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int totalQuantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of BranchSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchSalesReportSummaryCopyWith<_BranchSalesReportSummary> get copyWith => __$BranchSalesReportSummaryCopyWithImpl<_BranchSalesReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchSalesReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'BranchSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$BranchSalesReportSummaryCopyWith<$Res> implements $BranchSalesReportSummaryCopyWith<$Res> {
  factory _$BranchSalesReportSummaryCopyWith(_BranchSalesReportSummary value, $Res Function(_BranchSalesReportSummary) _then) = __$BranchSalesReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$BranchSalesReportSummaryCopyWithImpl<$Res>
    implements _$BranchSalesReportSummaryCopyWith<$Res> {
  __$BranchSalesReportSummaryCopyWithImpl(this._self, this._then);

  final _BranchSalesReportSummary _self;
  final $Res Function(_BranchSalesReportSummary) _then;

/// Create a copy of BranchSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_BranchSalesReportSummary(
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
mixin _$BranchSalesData {

 int? get sn; int? get branchID; String? get branchName; int get totalBills; int get quantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of BranchSalesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BranchSalesDataCopyWith<BranchSalesData> get copyWith => _$BranchSalesDataCopyWithImpl<BranchSalesData>(this as BranchSalesData, _$identity);

  /// Serializes this BranchSalesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,branchID,branchName,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'BranchSalesData(sn: $sn, branchID: $branchID, branchName: $branchName, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $BranchSalesDataCopyWith<$Res>  {
  factory $BranchSalesDataCopyWith(BranchSalesData value, $Res Function(BranchSalesData) _then) = _$BranchSalesDataCopyWithImpl;
@useResult
$Res call({
 int? sn, int? branchID, String? branchName, int totalBills, int quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$BranchSalesDataCopyWithImpl<$Res>
    implements $BranchSalesDataCopyWith<$Res> {
  _$BranchSalesDataCopyWithImpl(this._self, this._then);

  final BranchSalesData _self;
  final $Res Function(BranchSalesData) _then;

/// Create a copy of BranchSalesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sn = freezed,Object? branchID = freezed,Object? branchName = freezed,Object? totalBills = null,Object? quantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_self.copyWith(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,branchID: freezed == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as int?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [BranchSalesData].
extension BranchSalesDataPatterns on BranchSalesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BranchSalesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BranchSalesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BranchSalesData value)  $default,){
final _that = this;
switch (_that) {
case _BranchSalesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BranchSalesData value)?  $default,){
final _that = this;
switch (_that) {
case _BranchSalesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sn,  int? branchID,  String? branchName,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BranchSalesData() when $default != null:
return $default(_that.sn,_that.branchID,_that.branchName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sn,  int? branchID,  String? branchName,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)  $default,) {final _that = this;
switch (_that) {
case _BranchSalesData():
return $default(_that.sn,_that.branchID,_that.branchName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sn,  int? branchID,  String? branchName,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,) {final _that = this;
switch (_that) {
case _BranchSalesData() when $default != null:
return $default(_that.sn,_that.branchID,_that.branchName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BranchSalesData implements BranchSalesData {
  const _BranchSalesData({this.sn, this.branchID, this.branchName, this.totalBills = 0, this.quantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _BranchSalesData.fromJson(Map<String, dynamic> json) => _$BranchSalesDataFromJson(json);

@override final  int? sn;
@override final  int? branchID;
@override final  String? branchName;
@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of BranchSalesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BranchSalesDataCopyWith<_BranchSalesData> get copyWith => __$BranchSalesDataCopyWithImpl<_BranchSalesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BranchSalesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BranchSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.branchName, branchName) || other.branchName == branchName)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,branchID,branchName,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'BranchSalesData(sn: $sn, branchID: $branchID, branchName: $branchName, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$BranchSalesDataCopyWith<$Res> implements $BranchSalesDataCopyWith<$Res> {
  factory _$BranchSalesDataCopyWith(_BranchSalesData value, $Res Function(_BranchSalesData) _then) = __$BranchSalesDataCopyWithImpl;
@override @useResult
$Res call({
 int? sn, int? branchID, String? branchName, int totalBills, int quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$BranchSalesDataCopyWithImpl<$Res>
    implements _$BranchSalesDataCopyWith<$Res> {
  __$BranchSalesDataCopyWithImpl(this._self, this._then);

  final _BranchSalesData _self;
  final $Res Function(_BranchSalesData) _then;

/// Create a copy of BranchSalesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sn = freezed,Object? branchID = freezed,Object? branchName = freezed,Object? totalBills = null,Object? quantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_BranchSalesData(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,branchID: freezed == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as int?,branchName: freezed == branchName ? _self.branchName : branchName // ignore: cast_nullable_to_non_nullable
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
