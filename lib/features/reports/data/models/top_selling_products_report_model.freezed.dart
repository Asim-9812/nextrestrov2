// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'top_selling_products_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TopSellingProductsReportRequest {

 String get fromDate; String get toDate; String get branchID; int get fiscalYearID; int get categoryID; int get productID; int get top;
/// Create a copy of TopSellingProductsReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductsReportRequestCopyWith<TopSellingProductsReportRequest> get copyWith => _$TopSellingProductsReportRequestCopyWithImpl<TopSellingProductsReportRequest>(this as TopSellingProductsReportRequest, _$identity);

  /// Serializes this TopSellingProductsReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProductsReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.top, top) || other.top == top));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,categoryID,productID,top);

@override
String toString() {
  return 'TopSellingProductsReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, categoryID: $categoryID, productID: $productID, top: $top)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductsReportRequestCopyWith<$Res>  {
  factory $TopSellingProductsReportRequestCopyWith(TopSellingProductsReportRequest value, $Res Function(TopSellingProductsReportRequest) _then) = _$TopSellingProductsReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, int categoryID, int productID, int top
});




}
/// @nodoc
class _$TopSellingProductsReportRequestCopyWithImpl<$Res>
    implements $TopSellingProductsReportRequestCopyWith<$Res> {
  _$TopSellingProductsReportRequestCopyWithImpl(this._self, this._then);

  final TopSellingProductsReportRequest _self;
  final $Res Function(TopSellingProductsReportRequest) _then;

/// Create a copy of TopSellingProductsReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? categoryID = null,Object? productID = null,Object? top = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingProductsReportRequest].
extension TopSellingProductsReportRequestPatterns on TopSellingProductsReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProductsReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProductsReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProductsReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProductsReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int categoryID,  int productID,  int top)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProductsReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.categoryID,_that.productID,_that.top);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int categoryID,  int productID,  int top)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductsReportRequest():
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.categoryID,_that.productID,_that.top);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  String branchID,  int fiscalYearID,  int categoryID,  int productID,  int top)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductsReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.branchID,_that.fiscalYearID,_that.categoryID,_that.productID,_that.top);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProductsReportRequest implements TopSellingProductsReportRequest {
  const _TopSellingProductsReportRequest({required this.fromDate, required this.toDate, this.branchID = '0', required this.fiscalYearID, this.categoryID = 0, this.productID = 0, this.top = 10});
  factory _TopSellingProductsReportRequest.fromJson(Map<String, dynamic> json) => _$TopSellingProductsReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  String branchID;
@override final  int fiscalYearID;
@override@JsonKey() final  int categoryID;
@override@JsonKey() final  int productID;
@override@JsonKey() final  int top;

/// Create a copy of TopSellingProductsReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductsReportRequestCopyWith<_TopSellingProductsReportRequest> get copyWith => __$TopSellingProductsReportRequestCopyWithImpl<_TopSellingProductsReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductsReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProductsReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID)&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.top, top) || other.top == top));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,branchID,fiscalYearID,categoryID,productID,top);

@override
String toString() {
  return 'TopSellingProductsReportRequest(fromDate: $fromDate, toDate: $toDate, branchID: $branchID, fiscalYearID: $fiscalYearID, categoryID: $categoryID, productID: $productID, top: $top)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductsReportRequestCopyWith<$Res> implements $TopSellingProductsReportRequestCopyWith<$Res> {
  factory _$TopSellingProductsReportRequestCopyWith(_TopSellingProductsReportRequest value, $Res Function(_TopSellingProductsReportRequest) _then) = __$TopSellingProductsReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, String branchID, int fiscalYearID, int categoryID, int productID, int top
});




}
/// @nodoc
class __$TopSellingProductsReportRequestCopyWithImpl<$Res>
    implements _$TopSellingProductsReportRequestCopyWith<$Res> {
  __$TopSellingProductsReportRequestCopyWithImpl(this._self, this._then);

  final _TopSellingProductsReportRequest _self;
  final $Res Function(_TopSellingProductsReportRequest) _then;

/// Create a copy of TopSellingProductsReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? branchID = null,Object? fiscalYearID = null,Object? categoryID = null,Object? productID = null,Object? top = null,}) {
  return _then(_TopSellingProductsReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int,top: null == top ? _self.top : top // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$TopSellingProductsReportResponse {

 bool get succeeded; String? get messages; TopSellingProductsReportData? get data;
/// Create a copy of TopSellingProductsReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductsReportResponseCopyWith<TopSellingProductsReportResponse> get copyWith => _$TopSellingProductsReportResponseCopyWithImpl<TopSellingProductsReportResponse>(this as TopSellingProductsReportResponse, _$identity);

  /// Serializes this TopSellingProductsReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProductsReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'TopSellingProductsReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductsReportResponseCopyWith<$Res>  {
  factory $TopSellingProductsReportResponseCopyWith(TopSellingProductsReportResponse value, $Res Function(TopSellingProductsReportResponse) _then) = _$TopSellingProductsReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, TopSellingProductsReportData? data
});


$TopSellingProductsReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$TopSellingProductsReportResponseCopyWithImpl<$Res>
    implements $TopSellingProductsReportResponseCopyWith<$Res> {
  _$TopSellingProductsReportResponseCopyWithImpl(this._self, this._then);

  final TopSellingProductsReportResponse _self;
  final $Res Function(TopSellingProductsReportResponse) _then;

/// Create a copy of TopSellingProductsReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TopSellingProductsReportData?,
  ));
}
/// Create a copy of TopSellingProductsReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopSellingProductsReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TopSellingProductsReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopSellingProductsReportResponse].
extension TopSellingProductsReportResponsePatterns on TopSellingProductsReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProductsReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProductsReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProductsReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProductsReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  TopSellingProductsReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProductsReportResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  TopSellingProductsReportData? data)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductsReportResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  TopSellingProductsReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductsReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProductsReportResponse implements TopSellingProductsReportResponse {
  const _TopSellingProductsReportResponse({this.succeeded = false, this.messages, this.data});
  factory _TopSellingProductsReportResponse.fromJson(Map<String, dynamic> json) => _$TopSellingProductsReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  TopSellingProductsReportData? data;

/// Create a copy of TopSellingProductsReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductsReportResponseCopyWith<_TopSellingProductsReportResponse> get copyWith => __$TopSellingProductsReportResponseCopyWithImpl<_TopSellingProductsReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductsReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProductsReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'TopSellingProductsReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductsReportResponseCopyWith<$Res> implements $TopSellingProductsReportResponseCopyWith<$Res> {
  factory _$TopSellingProductsReportResponseCopyWith(_TopSellingProductsReportResponse value, $Res Function(_TopSellingProductsReportResponse) _then) = __$TopSellingProductsReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, TopSellingProductsReportData? data
});


@override $TopSellingProductsReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$TopSellingProductsReportResponseCopyWithImpl<$Res>
    implements _$TopSellingProductsReportResponseCopyWith<$Res> {
  __$TopSellingProductsReportResponseCopyWithImpl(this._self, this._then);

  final _TopSellingProductsReportResponse _self;
  final $Res Function(_TopSellingProductsReportResponse) _then;

/// Create a copy of TopSellingProductsReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_TopSellingProductsReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TopSellingProductsReportData?,
  ));
}

/// Create a copy of TopSellingProductsReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopSellingProductsReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TopSellingProductsReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$TopSellingProductsReportData {

 TopSellingProductsReportSummary? get summary; List<TopSellingProductData> get data;
/// Create a copy of TopSellingProductsReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductsReportDataCopyWith<TopSellingProductsReportData> get copyWith => _$TopSellingProductsReportDataCopyWithImpl<TopSellingProductsReportData>(this as TopSellingProductsReportData, _$identity);

  /// Serializes this TopSellingProductsReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProductsReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'TopSellingProductsReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductsReportDataCopyWith<$Res>  {
  factory $TopSellingProductsReportDataCopyWith(TopSellingProductsReportData value, $Res Function(TopSellingProductsReportData) _then) = _$TopSellingProductsReportDataCopyWithImpl;
@useResult
$Res call({
 TopSellingProductsReportSummary? summary, List<TopSellingProductData> data
});


$TopSellingProductsReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$TopSellingProductsReportDataCopyWithImpl<$Res>
    implements $TopSellingProductsReportDataCopyWith<$Res> {
  _$TopSellingProductsReportDataCopyWithImpl(this._self, this._then);

  final TopSellingProductsReportData _self;
  final $Res Function(TopSellingProductsReportData) _then;

/// Create a copy of TopSellingProductsReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as TopSellingProductsReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TopSellingProductData>,
  ));
}
/// Create a copy of TopSellingProductsReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopSellingProductsReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $TopSellingProductsReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [TopSellingProductsReportData].
extension TopSellingProductsReportDataPatterns on TopSellingProductsReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProductsReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProductsReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProductsReportData value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProductsReportData value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TopSellingProductsReportSummary? summary,  List<TopSellingProductData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProductsReportData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TopSellingProductsReportSummary? summary,  List<TopSellingProductData> data)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductsReportData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TopSellingProductsReportSummary? summary,  List<TopSellingProductData> data)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductsReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProductsReportData implements TopSellingProductsReportData {
  const _TopSellingProductsReportData({this.summary, final  List<TopSellingProductData> data = const []}): _data = data;
  factory _TopSellingProductsReportData.fromJson(Map<String, dynamic> json) => _$TopSellingProductsReportDataFromJson(json);

@override final  TopSellingProductsReportSummary? summary;
 final  List<TopSellingProductData> _data;
@override@JsonKey() List<TopSellingProductData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of TopSellingProductsReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductsReportDataCopyWith<_TopSellingProductsReportData> get copyWith => __$TopSellingProductsReportDataCopyWithImpl<_TopSellingProductsReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductsReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProductsReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'TopSellingProductsReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductsReportDataCopyWith<$Res> implements $TopSellingProductsReportDataCopyWith<$Res> {
  factory _$TopSellingProductsReportDataCopyWith(_TopSellingProductsReportData value, $Res Function(_TopSellingProductsReportData) _then) = __$TopSellingProductsReportDataCopyWithImpl;
@override @useResult
$Res call({
 TopSellingProductsReportSummary? summary, List<TopSellingProductData> data
});


@override $TopSellingProductsReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$TopSellingProductsReportDataCopyWithImpl<$Res>
    implements _$TopSellingProductsReportDataCopyWith<$Res> {
  __$TopSellingProductsReportDataCopyWithImpl(this._self, this._then);

  final _TopSellingProductsReportData _self;
  final $Res Function(_TopSellingProductsReportData) _then;

/// Create a copy of TopSellingProductsReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_TopSellingProductsReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as TopSellingProductsReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TopSellingProductData>,
  ));
}

/// Create a copy of TopSellingProductsReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TopSellingProductsReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $TopSellingProductsReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$TopSellingProductsReportSummary {

 int get totalBills; double get totalQuantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of TopSellingProductsReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductsReportSummaryCopyWith<TopSellingProductsReportSummary> get copyWith => _$TopSellingProductsReportSummaryCopyWithImpl<TopSellingProductsReportSummary>(this as TopSellingProductsReportSummary, _$identity);

  /// Serializes this TopSellingProductsReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProductsReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'TopSellingProductsReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductsReportSummaryCopyWith<$Res>  {
  factory $TopSellingProductsReportSummaryCopyWith(TopSellingProductsReportSummary value, $Res Function(TopSellingProductsReportSummary) _then) = _$TopSellingProductsReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, double totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$TopSellingProductsReportSummaryCopyWithImpl<$Res>
    implements $TopSellingProductsReportSummaryCopyWith<$Res> {
  _$TopSellingProductsReportSummaryCopyWithImpl(this._self, this._then);

  final TopSellingProductsReportSummary _self;
  final $Res Function(TopSellingProductsReportSummary) _then;

/// Create a copy of TopSellingProductsReportSummary
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


/// Adds pattern-matching-related methods to [TopSellingProductsReportSummary].
extension TopSellingProductsReportSummaryPatterns on TopSellingProductsReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProductsReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProductsReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProductsReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProductsReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductsReportSummary() when $default != null:
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
case _TopSellingProductsReportSummary() when $default != null:
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
case _TopSellingProductsReportSummary():
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
case _TopSellingProductsReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProductsReportSummary implements TopSellingProductsReportSummary {
  const _TopSellingProductsReportSummary({this.totalBills = 0, this.totalQuantity = 0.0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _TopSellingProductsReportSummary.fromJson(Map<String, dynamic> json) => _$TopSellingProductsReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  double totalQuantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of TopSellingProductsReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductsReportSummaryCopyWith<_TopSellingProductsReportSummary> get copyWith => __$TopSellingProductsReportSummaryCopyWithImpl<_TopSellingProductsReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductsReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProductsReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'TopSellingProductsReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductsReportSummaryCopyWith<$Res> implements $TopSellingProductsReportSummaryCopyWith<$Res> {
  factory _$TopSellingProductsReportSummaryCopyWith(_TopSellingProductsReportSummary value, $Res Function(_TopSellingProductsReportSummary) _then) = __$TopSellingProductsReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, double totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$TopSellingProductsReportSummaryCopyWithImpl<$Res>
    implements _$TopSellingProductsReportSummaryCopyWith<$Res> {
  __$TopSellingProductsReportSummaryCopyWithImpl(this._self, this._then);

  final _TopSellingProductsReportSummary _self;
  final $Res Function(_TopSellingProductsReportSummary) _then;

/// Create a copy of TopSellingProductsReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_TopSellingProductsReportSummary(
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
mixin _$TopSellingProductData {

 int? get sn; int? get productID; String? get productName; String? get categoryName; double get quantity; double get totalSales; double get averagePrice;
/// Create a copy of TopSellingProductData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductDataCopyWith<TopSellingProductData> get copyWith => _$TopSellingProductDataCopyWithImpl<TopSellingProductData>(this as TopSellingProductData, _$identity);

  /// Serializes this TopSellingProductData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProductData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,productID,productName,categoryName,quantity,totalSales,averagePrice);

@override
String toString() {
  return 'TopSellingProductData(sn: $sn, productID: $productID, productName: $productName, categoryName: $categoryName, quantity: $quantity, totalSales: $totalSales, averagePrice: $averagePrice)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductDataCopyWith<$Res>  {
  factory $TopSellingProductDataCopyWith(TopSellingProductData value, $Res Function(TopSellingProductData) _then) = _$TopSellingProductDataCopyWithImpl;
@useResult
$Res call({
 int? sn, int? productID, String? productName, String? categoryName, double quantity, double totalSales, double averagePrice
});




}
/// @nodoc
class _$TopSellingProductDataCopyWithImpl<$Res>
    implements $TopSellingProductDataCopyWith<$Res> {
  _$TopSellingProductDataCopyWithImpl(this._self, this._then);

  final TopSellingProductData _self;
  final $Res Function(TopSellingProductData) _then;

/// Create a copy of TopSellingProductData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sn = freezed,Object? productID = freezed,Object? productName = freezed,Object? categoryName = freezed,Object? quantity = null,Object? totalSales = null,Object? averagePrice = null,}) {
  return _then(_self.copyWith(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingProductData].
extension TopSellingProductDataPatterns on TopSellingProductData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProductData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProductData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProductData value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProductData value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProductData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sn,  int? productID,  String? productName,  String? categoryName,  double quantity,  double totalSales,  double averagePrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProductData() when $default != null:
return $default(_that.sn,_that.productID,_that.productName,_that.categoryName,_that.quantity,_that.totalSales,_that.averagePrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sn,  int? productID,  String? productName,  String? categoryName,  double quantity,  double totalSales,  double averagePrice)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductData():
return $default(_that.sn,_that.productID,_that.productName,_that.categoryName,_that.quantity,_that.totalSales,_that.averagePrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sn,  int? productID,  String? productName,  String? categoryName,  double quantity,  double totalSales,  double averagePrice)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProductData() when $default != null:
return $default(_that.sn,_that.productID,_that.productName,_that.categoryName,_that.quantity,_that.totalSales,_that.averagePrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProductData implements TopSellingProductData {
  const _TopSellingProductData({this.sn, this.productID, this.productName, this.categoryName, this.quantity = 0.0, this.totalSales = 0.0, this.averagePrice = 0.0});
  factory _TopSellingProductData.fromJson(Map<String, dynamic> json) => _$TopSellingProductDataFromJson(json);

@override final  int? sn;
@override final  int? productID;
@override final  String? productName;
@override final  String? categoryName;
@override@JsonKey() final  double quantity;
@override@JsonKey() final  double totalSales;
@override@JsonKey() final  double averagePrice;

/// Create a copy of TopSellingProductData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductDataCopyWith<_TopSellingProductData> get copyWith => __$TopSellingProductDataCopyWithImpl<_TopSellingProductData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProductData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.averagePrice, averagePrice) || other.averagePrice == averagePrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,productID,productName,categoryName,quantity,totalSales,averagePrice);

@override
String toString() {
  return 'TopSellingProductData(sn: $sn, productID: $productID, productName: $productName, categoryName: $categoryName, quantity: $quantity, totalSales: $totalSales, averagePrice: $averagePrice)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductDataCopyWith<$Res> implements $TopSellingProductDataCopyWith<$Res> {
  factory _$TopSellingProductDataCopyWith(_TopSellingProductData value, $Res Function(_TopSellingProductData) _then) = __$TopSellingProductDataCopyWithImpl;
@override @useResult
$Res call({
 int? sn, int? productID, String? productName, String? categoryName, double quantity, double totalSales, double averagePrice
});




}
/// @nodoc
class __$TopSellingProductDataCopyWithImpl<$Res>
    implements _$TopSellingProductDataCopyWith<$Res> {
  __$TopSellingProductDataCopyWithImpl(this._self, this._then);

  final _TopSellingProductData _self;
  final $Res Function(_TopSellingProductData) _then;

/// Create a copy of TopSellingProductData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sn = freezed,Object? productID = freezed,Object? productName = freezed,Object? categoryName = freezed,Object? quantity = null,Object? totalSales = null,Object? averagePrice = null,}) {
  return _then(_TopSellingProductData(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,productID: freezed == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int?,productName: freezed == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as double,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,averagePrice: null == averagePrice ? _self.averagePrice : averagePrice // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
