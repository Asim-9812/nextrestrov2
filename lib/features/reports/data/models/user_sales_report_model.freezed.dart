// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_sales_report_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserSalesReportRequest {

 String get fromDate; String get toDate; int get userID; String get branchID; int get fiscalYearID;
/// Create a copy of UserSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSalesReportRequestCopyWith<UserSalesReportRequest> get copyWith => _$UserSalesReportRequestCopyWithImpl<UserSalesReportRequest>(this as UserSalesReportRequest, _$identity);

  /// Serializes this UserSalesReportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,userID,branchID,fiscalYearID);

@override
String toString() {
  return 'UserSalesReportRequest(fromDate: $fromDate, toDate: $toDate, userID: $userID, branchID: $branchID, fiscalYearID: $fiscalYearID)';
}


}

/// @nodoc
abstract mixin class $UserSalesReportRequestCopyWith<$Res>  {
  factory $UserSalesReportRequestCopyWith(UserSalesReportRequest value, $Res Function(UserSalesReportRequest) _then) = _$UserSalesReportRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate, int userID, String branchID, int fiscalYearID
});




}
/// @nodoc
class _$UserSalesReportRequestCopyWithImpl<$Res>
    implements $UserSalesReportRequestCopyWith<$Res> {
  _$UserSalesReportRequestCopyWithImpl(this._self, this._then);

  final UserSalesReportRequest _self;
  final $Res Function(UserSalesReportRequest) _then;

/// Create a copy of UserSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,Object? userID = null,Object? branchID = null,Object? fiscalYearID = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,userID: null == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as int,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UserSalesReportRequest].
extension UserSalesReportRequestPatterns on UserSalesReportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSalesReportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSalesReportRequest value)  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSalesReportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  int userID,  String branchID,  int fiscalYearID)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.userID,_that.branchID,_that.fiscalYearID);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate,  int userID,  String branchID,  int fiscalYearID)  $default,) {final _that = this;
switch (_that) {
case _UserSalesReportRequest():
return $default(_that.fromDate,_that.toDate,_that.userID,_that.branchID,_that.fiscalYearID);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate,  int userID,  String branchID,  int fiscalYearID)?  $default,) {final _that = this;
switch (_that) {
case _UserSalesReportRequest() when $default != null:
return $default(_that.fromDate,_that.toDate,_that.userID,_that.branchID,_that.fiscalYearID);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSalesReportRequest implements UserSalesReportRequest {
  const _UserSalesReportRequest({required this.fromDate, required this.toDate, this.userID = 0, this.branchID = '3', required this.fiscalYearID});
  factory _UserSalesReportRequest.fromJson(Map<String, dynamic> json) => _$UserSalesReportRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;
@override@JsonKey() final  int userID;
@override@JsonKey() final  String branchID;
@override final  int fiscalYearID;

/// Create a copy of UserSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSalesReportRequestCopyWith<_UserSalesReportRequest> get copyWith => __$UserSalesReportRequestCopyWithImpl<_UserSalesReportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSalesReportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSalesReportRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.branchID, branchID) || other.branchID == branchID)&&(identical(other.fiscalYearID, fiscalYearID) || other.fiscalYearID == fiscalYearID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate,userID,branchID,fiscalYearID);

@override
String toString() {
  return 'UserSalesReportRequest(fromDate: $fromDate, toDate: $toDate, userID: $userID, branchID: $branchID, fiscalYearID: $fiscalYearID)';
}


}

/// @nodoc
abstract mixin class _$UserSalesReportRequestCopyWith<$Res> implements $UserSalesReportRequestCopyWith<$Res> {
  factory _$UserSalesReportRequestCopyWith(_UserSalesReportRequest value, $Res Function(_UserSalesReportRequest) _then) = __$UserSalesReportRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate, int userID, String branchID, int fiscalYearID
});




}
/// @nodoc
class __$UserSalesReportRequestCopyWithImpl<$Res>
    implements _$UserSalesReportRequestCopyWith<$Res> {
  __$UserSalesReportRequestCopyWithImpl(this._self, this._then);

  final _UserSalesReportRequest _self;
  final $Res Function(_UserSalesReportRequest) _then;

/// Create a copy of UserSalesReportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,Object? userID = null,Object? branchID = null,Object? fiscalYearID = null,}) {
  return _then(_UserSalesReportRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,userID: null == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as int,branchID: null == branchID ? _self.branchID : branchID // ignore: cast_nullable_to_non_nullable
as String,fiscalYearID: null == fiscalYearID ? _self.fiscalYearID : fiscalYearID // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UserSalesReportResponse {

 bool get succeeded; String? get messages; UserSalesReportData? get data;
/// Create a copy of UserSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSalesReportResponseCopyWith<UserSalesReportResponse> get copyWith => _$UserSalesReportResponseCopyWithImpl<UserSalesReportResponse>(this as UserSalesReportResponse, _$identity);

  /// Serializes this UserSalesReportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'UserSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSalesReportResponseCopyWith<$Res>  {
  factory $UserSalesReportResponseCopyWith(UserSalesReportResponse value, $Res Function(UserSalesReportResponse) _then) = _$UserSalesReportResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, UserSalesReportData? data
});


$UserSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class _$UserSalesReportResponseCopyWithImpl<$Res>
    implements $UserSalesReportResponseCopyWith<$Res> {
  _$UserSalesReportResponseCopyWithImpl(this._self, this._then);

  final UserSalesReportResponse _self;
  final $Res Function(UserSalesReportResponse) _then;

/// Create a copy of UserSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSalesReportData?,
  ));
}
/// Create a copy of UserSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSalesReportResponse].
extension UserSalesReportResponsePatterns on UserSalesReportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSalesReportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSalesReportResponse value)  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSalesReportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  UserSalesReportData? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSalesReportResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  UserSalesReportData? data)  $default,) {final _that = this;
switch (_that) {
case _UserSalesReportResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  UserSalesReportData? data)?  $default,) {final _that = this;
switch (_that) {
case _UserSalesReportResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSalesReportResponse implements UserSalesReportResponse {
  const _UserSalesReportResponse({this.succeeded = false, this.messages, this.data});
  factory _UserSalesReportResponse.fromJson(Map<String, dynamic> json) => _$UserSalesReportResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
@override final  UserSalesReportData? data;

/// Create a copy of UserSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSalesReportResponseCopyWith<_UserSalesReportResponse> get copyWith => __$UserSalesReportResponseCopyWithImpl<_UserSalesReportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSalesReportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSalesReportResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,data);

@override
String toString() {
  return 'UserSalesReportResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$UserSalesReportResponseCopyWith<$Res> implements $UserSalesReportResponseCopyWith<$Res> {
  factory _$UserSalesReportResponseCopyWith(_UserSalesReportResponse value, $Res Function(_UserSalesReportResponse) _then) = __$UserSalesReportResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, UserSalesReportData? data
});


@override $UserSalesReportDataCopyWith<$Res>? get data;

}
/// @nodoc
class __$UserSalesReportResponseCopyWithImpl<$Res>
    implements _$UserSalesReportResponseCopyWith<$Res> {
  __$UserSalesReportResponseCopyWithImpl(this._self, this._then);

  final _UserSalesReportResponse _self;
  final $Res Function(_UserSalesReportResponse) _then;

/// Create a copy of UserSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_UserSalesReportResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserSalesReportData?,
  ));
}

/// Create a copy of UserSalesReportResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSalesReportDataCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserSalesReportDataCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UserSalesReportData {

 UserSalesReportSummary? get summary; List<UserSalesData> get data;
/// Create a copy of UserSalesReportData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSalesReportDataCopyWith<UserSalesReportData> get copyWith => _$UserSalesReportDataCopyWithImpl<UserSalesReportData>(this as UserSalesReportData, _$identity);

  /// Serializes this UserSalesReportData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'UserSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class $UserSalesReportDataCopyWith<$Res>  {
  factory $UserSalesReportDataCopyWith(UserSalesReportData value, $Res Function(UserSalesReportData) _then) = _$UserSalesReportDataCopyWithImpl;
@useResult
$Res call({
 UserSalesReportSummary? summary, List<UserSalesData> data
});


$UserSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class _$UserSalesReportDataCopyWithImpl<$Res>
    implements $UserSalesReportDataCopyWith<$Res> {
  _$UserSalesReportDataCopyWithImpl(this._self, this._then);

  final UserSalesReportData _self;
  final $Res Function(UserSalesReportData) _then;

/// Create a copy of UserSalesReportData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_self.copyWith(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as UserSalesReportSummary?,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<UserSalesData>,
  ));
}
/// Create a copy of UserSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $UserSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserSalesReportData].
extension UserSalesReportDataPatterns on UserSalesReportData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSalesReportData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSalesReportData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSalesReportData value)  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSalesReportData value)?  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserSalesReportSummary? summary,  List<UserSalesData> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSalesReportData() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserSalesReportSummary? summary,  List<UserSalesData> data)  $default,) {final _that = this;
switch (_that) {
case _UserSalesReportData():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserSalesReportSummary? summary,  List<UserSalesData> data)?  $default,) {final _that = this;
switch (_that) {
case _UserSalesReportData() when $default != null:
return $default(_that.summary,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSalesReportData implements UserSalesReportData {
  const _UserSalesReportData({this.summary, final  List<UserSalesData> data = const []}): _data = data;
  factory _UserSalesReportData.fromJson(Map<String, dynamic> json) => _$UserSalesReportDataFromJson(json);

@override final  UserSalesReportSummary? summary;
 final  List<UserSalesData> _data;
@override@JsonKey() List<UserSalesData> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of UserSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSalesReportDataCopyWith<_UserSalesReportData> get copyWith => __$UserSalesReportDataCopyWithImpl<_UserSalesReportData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSalesReportDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSalesReportData&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'UserSalesReportData(summary: $summary, data: $data)';
}


}

/// @nodoc
abstract mixin class _$UserSalesReportDataCopyWith<$Res> implements $UserSalesReportDataCopyWith<$Res> {
  factory _$UserSalesReportDataCopyWith(_UserSalesReportData value, $Res Function(_UserSalesReportData) _then) = __$UserSalesReportDataCopyWithImpl;
@override @useResult
$Res call({
 UserSalesReportSummary? summary, List<UserSalesData> data
});


@override $UserSalesReportSummaryCopyWith<$Res>? get summary;

}
/// @nodoc
class __$UserSalesReportDataCopyWithImpl<$Res>
    implements _$UserSalesReportDataCopyWith<$Res> {
  __$UserSalesReportDataCopyWithImpl(this._self, this._then);

  final _UserSalesReportData _self;
  final $Res Function(_UserSalesReportData) _then;

/// Create a copy of UserSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = freezed,Object? data = null,}) {
  return _then(_UserSalesReportData(
summary: freezed == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as UserSalesReportSummary?,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<UserSalesData>,
  ));
}

/// Create a copy of UserSalesReportData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserSalesReportSummaryCopyWith<$Res>? get summary {
    if (_self.summary == null) {
    return null;
  }

  return $UserSalesReportSummaryCopyWith<$Res>(_self.summary!, (value) {
    return _then(_self.copyWith(summary: value));
  });
}
}


/// @nodoc
mixin _$UserSalesReportSummary {

 int get totalBills; int get totalQuantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of UserSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSalesReportSummaryCopyWith<UserSalesReportSummary> get copyWith => _$UserSalesReportSummaryCopyWithImpl<UserSalesReportSummary>(this as UserSalesReportSummary, _$identity);

  /// Serializes this UserSalesReportSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'UserSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $UserSalesReportSummaryCopyWith<$Res>  {
  factory $UserSalesReportSummaryCopyWith(UserSalesReportSummary value, $Res Function(UserSalesReportSummary) _then) = _$UserSalesReportSummaryCopyWithImpl;
@useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$UserSalesReportSummaryCopyWithImpl<$Res>
    implements $UserSalesReportSummaryCopyWith<$Res> {
  _$UserSalesReportSummaryCopyWithImpl(this._self, this._then);

  final UserSalesReportSummary _self;
  final $Res Function(UserSalesReportSummary) _then;

/// Create a copy of UserSalesReportSummary
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


/// Adds pattern-matching-related methods to [UserSalesReportSummary].
extension UserSalesReportSummaryPatterns on UserSalesReportSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSalesReportSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSalesReportSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSalesReportSummary value)  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSalesReportSummary value)?  $default,){
final _that = this;
switch (_that) {
case _UserSalesReportSummary() when $default != null:
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
case _UserSalesReportSummary() when $default != null:
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
case _UserSalesReportSummary():
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
case _UserSalesReportSummary() when $default != null:
return $default(_that.totalBills,_that.totalQuantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSalesReportSummary implements UserSalesReportSummary {
  const _UserSalesReportSummary({this.totalBills = 0, this.totalQuantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _UserSalesReportSummary.fromJson(Map<String, dynamic> json) => _$UserSalesReportSummaryFromJson(json);

@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int totalQuantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of UserSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSalesReportSummaryCopyWith<_UserSalesReportSummary> get copyWith => __$UserSalesReportSummaryCopyWithImpl<_UserSalesReportSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSalesReportSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSalesReportSummary&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalQuantity, totalQuantity) || other.totalQuantity == totalQuantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalBills,totalQuantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'UserSalesReportSummary(totalBills: $totalBills, totalQuantity: $totalQuantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$UserSalesReportSummaryCopyWith<$Res> implements $UserSalesReportSummaryCopyWith<$Res> {
  factory _$UserSalesReportSummaryCopyWith(_UserSalesReportSummary value, $Res Function(_UserSalesReportSummary) _then) = __$UserSalesReportSummaryCopyWithImpl;
@override @useResult
$Res call({
 int totalBills, int totalQuantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$UserSalesReportSummaryCopyWithImpl<$Res>
    implements _$UserSalesReportSummaryCopyWith<$Res> {
  __$UserSalesReportSummaryCopyWithImpl(this._self, this._then);

  final _UserSalesReportSummary _self;
  final $Res Function(_UserSalesReportSummary) _then;

/// Create a copy of UserSalesReportSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalBills = null,Object? totalQuantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_UserSalesReportSummary(
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
mixin _$UserSalesData {

 int? get sn; int? get userID; String? get userName; int get totalBills; int get quantity; double get grossAmount; double get discountAmount; double get taxAmount; double get netAmount;
/// Create a copy of UserSalesData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserSalesDataCopyWith<UserSalesData> get copyWith => _$UserSalesDataCopyWithImpl<UserSalesData>(this as UserSalesData, _$identity);

  /// Serializes this UserSalesData to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,userID,userName,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'UserSalesData(sn: $sn, userID: $userID, userName: $userName, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class $UserSalesDataCopyWith<$Res>  {
  factory $UserSalesDataCopyWith(UserSalesData value, $Res Function(UserSalesData) _then) = _$UserSalesDataCopyWithImpl;
@useResult
$Res call({
 int? sn, int? userID, String? userName, int totalBills, int quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class _$UserSalesDataCopyWithImpl<$Res>
    implements $UserSalesDataCopyWith<$Res> {
  _$UserSalesDataCopyWithImpl(this._self, this._then);

  final UserSalesData _self;
  final $Res Function(UserSalesData) _then;

/// Create a copy of UserSalesData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sn = freezed,Object? userID = freezed,Object? userName = freezed,Object? totalBills = null,Object? quantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_self.copyWith(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,userID: freezed == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as int?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
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


/// Adds pattern-matching-related methods to [UserSalesData].
extension UserSalesDataPatterns on UserSalesData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserSalesData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserSalesData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserSalesData value)  $default,){
final _that = this;
switch (_that) {
case _UserSalesData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserSalesData value)?  $default,){
final _that = this;
switch (_that) {
case _UserSalesData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? sn,  int? userID,  String? userName,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserSalesData() when $default != null:
return $default(_that.sn,_that.userID,_that.userName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? sn,  int? userID,  String? userName,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)  $default,) {final _that = this;
switch (_that) {
case _UserSalesData():
return $default(_that.sn,_that.userID,_that.userName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? sn,  int? userID,  String? userName,  int totalBills,  int quantity,  double grossAmount,  double discountAmount,  double taxAmount,  double netAmount)?  $default,) {final _that = this;
switch (_that) {
case _UserSalesData() when $default != null:
return $default(_that.sn,_that.userID,_that.userName,_that.totalBills,_that.quantity,_that.grossAmount,_that.discountAmount,_that.taxAmount,_that.netAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserSalesData implements UserSalesData {
  const _UserSalesData({this.sn, this.userID, this.userName, this.totalBills = 0, this.quantity = 0, this.grossAmount = 0.0, this.discountAmount = 0.0, this.taxAmount = 0.0, this.netAmount = 0.0});
  factory _UserSalesData.fromJson(Map<String, dynamic> json) => _$UserSalesDataFromJson(json);

@override final  int? sn;
@override final  int? userID;
@override final  String? userName;
@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  double grossAmount;
@override@JsonKey() final  double discountAmount;
@override@JsonKey() final  double taxAmount;
@override@JsonKey() final  double netAmount;

/// Create a copy of UserSalesData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserSalesDataCopyWith<_UserSalesData> get copyWith => __$UserSalesDataCopyWithImpl<_UserSalesData>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserSalesDataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserSalesData&&(identical(other.sn, sn) || other.sn == sn)&&(identical(other.userID, userID) || other.userID == userID)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.grossAmount, grossAmount) || other.grossAmount == grossAmount)&&(identical(other.discountAmount, discountAmount) || other.discountAmount == discountAmount)&&(identical(other.taxAmount, taxAmount) || other.taxAmount == taxAmount)&&(identical(other.netAmount, netAmount) || other.netAmount == netAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sn,userID,userName,totalBills,quantity,grossAmount,discountAmount,taxAmount,netAmount);

@override
String toString() {
  return 'UserSalesData(sn: $sn, userID: $userID, userName: $userName, totalBills: $totalBills, quantity: $quantity, grossAmount: $grossAmount, discountAmount: $discountAmount, taxAmount: $taxAmount, netAmount: $netAmount)';
}


}

/// @nodoc
abstract mixin class _$UserSalesDataCopyWith<$Res> implements $UserSalesDataCopyWith<$Res> {
  factory _$UserSalesDataCopyWith(_UserSalesData value, $Res Function(_UserSalesData) _then) = __$UserSalesDataCopyWithImpl;
@override @useResult
$Res call({
 int? sn, int? userID, String? userName, int totalBills, int quantity, double grossAmount, double discountAmount, double taxAmount, double netAmount
});




}
/// @nodoc
class __$UserSalesDataCopyWithImpl<$Res>
    implements _$UserSalesDataCopyWith<$Res> {
  __$UserSalesDataCopyWithImpl(this._self, this._then);

  final _UserSalesData _self;
  final $Res Function(_UserSalesData) _then;

/// Create a copy of UserSalesData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sn = freezed,Object? userID = freezed,Object? userName = freezed,Object? totalBills = null,Object? quantity = null,Object? grossAmount = null,Object? discountAmount = null,Object? taxAmount = null,Object? netAmount = null,}) {
  return _then(_UserSalesData(
sn: freezed == sn ? _self.sn : sn // ignore: cast_nullable_to_non_nullable
as int?,userID: freezed == userID ? _self.userID : userID // ignore: cast_nullable_to_non_nullable
as int?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
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
