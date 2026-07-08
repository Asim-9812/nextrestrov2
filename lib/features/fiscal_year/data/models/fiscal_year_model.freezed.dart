// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fiscal_year_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FiscalYearResponse {

 bool get succeeded; String? get messages; List<FiscalYearModel>? get data;
/// Create a copy of FiscalYearResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FiscalYearResponseCopyWith<FiscalYearResponse> get copyWith => _$FiscalYearResponseCopyWithImpl<FiscalYearResponse>(this as FiscalYearResponse, _$identity);

  /// Serializes this FiscalYearResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiscalYearResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'FiscalYearResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $FiscalYearResponseCopyWith<$Res>  {
  factory $FiscalYearResponseCopyWith(FiscalYearResponse value, $Res Function(FiscalYearResponse) _then) = _$FiscalYearResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, List<FiscalYearModel>? data
});




}
/// @nodoc
class _$FiscalYearResponseCopyWithImpl<$Res>
    implements $FiscalYearResponseCopyWith<$Res> {
  _$FiscalYearResponseCopyWithImpl(this._self, this._then);

  final FiscalYearResponse _self;
  final $Res Function(FiscalYearResponse) _then;

/// Create a copy of FiscalYearResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<FiscalYearModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [FiscalYearResponse].
extension FiscalYearResponsePatterns on FiscalYearResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FiscalYearResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FiscalYearResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FiscalYearResponse value)  $default,){
final _that = this;
switch (_that) {
case _FiscalYearResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FiscalYearResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FiscalYearResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<FiscalYearModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FiscalYearResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<FiscalYearModel>? data)  $default,) {final _that = this;
switch (_that) {
case _FiscalYearResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  List<FiscalYearModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _FiscalYearResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FiscalYearResponse implements FiscalYearResponse {
  const _FiscalYearResponse({this.succeeded = false, this.messages, final  List<FiscalYearModel>? data}): _data = data;
  factory _FiscalYearResponse.fromJson(Map<String, dynamic> json) => _$FiscalYearResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
 final  List<FiscalYearModel>? _data;
@override List<FiscalYearModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of FiscalYearResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FiscalYearResponseCopyWith<_FiscalYearResponse> get copyWith => __$FiscalYearResponseCopyWithImpl<_FiscalYearResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FiscalYearResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FiscalYearResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'FiscalYearResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$FiscalYearResponseCopyWith<$Res> implements $FiscalYearResponseCopyWith<$Res> {
  factory _$FiscalYearResponseCopyWith(_FiscalYearResponse value, $Res Function(_FiscalYearResponse) _then) = __$FiscalYearResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, List<FiscalYearModel>? data
});




}
/// @nodoc
class __$FiscalYearResponseCopyWithImpl<$Res>
    implements _$FiscalYearResponseCopyWith<$Res> {
  __$FiscalYearResponseCopyWithImpl(this._self, this._then);

  final _FiscalYearResponse _self;
  final $Res Function(_FiscalYearResponse) _then;

/// Create a copy of FiscalYearResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_FiscalYearResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<FiscalYearModel>?,
  ));
}


}


/// @nodoc
mixin _$FiscalYearModel {

 int? get fiscalYearId; String? get fromDate; String? get toDate; String? get fiscalYearName; String? get shortDate; String? get createdDate; int? get userId; int? get bookClose;
/// Create a copy of FiscalYearModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FiscalYearModelCopyWith<FiscalYearModel> get copyWith => _$FiscalYearModelCopyWithImpl<FiscalYearModel>(this as FiscalYearModel, _$identity);

  /// Serializes this FiscalYearModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FiscalYearModel&&(identical(other.fiscalYearId, fiscalYearId) || other.fiscalYearId == fiscalYearId)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.fiscalYearName, fiscalYearName) || other.fiscalYearName == fiscalYearName)&&(identical(other.shortDate, shortDate) || other.shortDate == shortDate)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bookClose, bookClose) || other.bookClose == bookClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiscalYearId,fromDate,toDate,fiscalYearName,shortDate,createdDate,userId,bookClose);

@override
String toString() {
  return 'FiscalYearModel(fiscalYearId: $fiscalYearId, fromDate: $fromDate, toDate: $toDate, fiscalYearName: $fiscalYearName, shortDate: $shortDate, createdDate: $createdDate, userId: $userId, bookClose: $bookClose)';
}


}

/// @nodoc
abstract mixin class $FiscalYearModelCopyWith<$Res>  {
  factory $FiscalYearModelCopyWith(FiscalYearModel value, $Res Function(FiscalYearModel) _then) = _$FiscalYearModelCopyWithImpl;
@useResult
$Res call({
 int? fiscalYearId, String? fromDate, String? toDate, String? fiscalYearName, String? shortDate, String? createdDate, int? userId, int? bookClose
});




}
/// @nodoc
class _$FiscalYearModelCopyWithImpl<$Res>
    implements $FiscalYearModelCopyWith<$Res> {
  _$FiscalYearModelCopyWithImpl(this._self, this._then);

  final FiscalYearModel _self;
  final $Res Function(FiscalYearModel) _then;

/// Create a copy of FiscalYearModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fiscalYearId = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? fiscalYearName = freezed,Object? shortDate = freezed,Object? createdDate = freezed,Object? userId = freezed,Object? bookClose = freezed,}) {
  return _then(_self.copyWith(
fiscalYearId: freezed == fiscalYearId ? _self.fiscalYearId : fiscalYearId // ignore: cast_nullable_to_non_nullable
as int?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,fiscalYearName: freezed == fiscalYearName ? _self.fiscalYearName : fiscalYearName // ignore: cast_nullable_to_non_nullable
as String?,shortDate: freezed == shortDate ? _self.shortDate : shortDate // ignore: cast_nullable_to_non_nullable
as String?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,bookClose: freezed == bookClose ? _self.bookClose : bookClose // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FiscalYearModel].
extension FiscalYearModelPatterns on FiscalYearModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FiscalYearModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FiscalYearModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FiscalYearModel value)  $default,){
final _that = this;
switch (_that) {
case _FiscalYearModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FiscalYearModel value)?  $default,){
final _that = this;
switch (_that) {
case _FiscalYearModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? fiscalYearId,  String? fromDate,  String? toDate,  String? fiscalYearName,  String? shortDate,  String? createdDate,  int? userId,  int? bookClose)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FiscalYearModel() when $default != null:
return $default(_that.fiscalYearId,_that.fromDate,_that.toDate,_that.fiscalYearName,_that.shortDate,_that.createdDate,_that.userId,_that.bookClose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? fiscalYearId,  String? fromDate,  String? toDate,  String? fiscalYearName,  String? shortDate,  String? createdDate,  int? userId,  int? bookClose)  $default,) {final _that = this;
switch (_that) {
case _FiscalYearModel():
return $default(_that.fiscalYearId,_that.fromDate,_that.toDate,_that.fiscalYearName,_that.shortDate,_that.createdDate,_that.userId,_that.bookClose);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? fiscalYearId,  String? fromDate,  String? toDate,  String? fiscalYearName,  String? shortDate,  String? createdDate,  int? userId,  int? bookClose)?  $default,) {final _that = this;
switch (_that) {
case _FiscalYearModel() when $default != null:
return $default(_that.fiscalYearId,_that.fromDate,_that.toDate,_that.fiscalYearName,_that.shortDate,_that.createdDate,_that.userId,_that.bookClose);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FiscalYearModel implements FiscalYearModel {
  const _FiscalYearModel({this.fiscalYearId, this.fromDate, this.toDate, this.fiscalYearName, this.shortDate, this.createdDate, this.userId, this.bookClose});
  factory _FiscalYearModel.fromJson(Map<String, dynamic> json) => _$FiscalYearModelFromJson(json);

@override final  int? fiscalYearId;
@override final  String? fromDate;
@override final  String? toDate;
@override final  String? fiscalYearName;
@override final  String? shortDate;
@override final  String? createdDate;
@override final  int? userId;
@override final  int? bookClose;

/// Create a copy of FiscalYearModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FiscalYearModelCopyWith<_FiscalYearModel> get copyWith => __$FiscalYearModelCopyWithImpl<_FiscalYearModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FiscalYearModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FiscalYearModel&&(identical(other.fiscalYearId, fiscalYearId) || other.fiscalYearId == fiscalYearId)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.fiscalYearName, fiscalYearName) || other.fiscalYearName == fiscalYearName)&&(identical(other.shortDate, shortDate) || other.shortDate == shortDate)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.bookClose, bookClose) || other.bookClose == bookClose));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fiscalYearId,fromDate,toDate,fiscalYearName,shortDate,createdDate,userId,bookClose);

@override
String toString() {
  return 'FiscalYearModel(fiscalYearId: $fiscalYearId, fromDate: $fromDate, toDate: $toDate, fiscalYearName: $fiscalYearName, shortDate: $shortDate, createdDate: $createdDate, userId: $userId, bookClose: $bookClose)';
}


}

/// @nodoc
abstract mixin class _$FiscalYearModelCopyWith<$Res> implements $FiscalYearModelCopyWith<$Res> {
  factory _$FiscalYearModelCopyWith(_FiscalYearModel value, $Res Function(_FiscalYearModel) _then) = __$FiscalYearModelCopyWithImpl;
@override @useResult
$Res call({
 int? fiscalYearId, String? fromDate, String? toDate, String? fiscalYearName, String? shortDate, String? createdDate, int? userId, int? bookClose
});




}
/// @nodoc
class __$FiscalYearModelCopyWithImpl<$Res>
    implements _$FiscalYearModelCopyWith<$Res> {
  __$FiscalYearModelCopyWithImpl(this._self, this._then);

  final _FiscalYearModel _self;
  final $Res Function(_FiscalYearModel) _then;

/// Create a copy of FiscalYearModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fiscalYearId = freezed,Object? fromDate = freezed,Object? toDate = freezed,Object? fiscalYearName = freezed,Object? shortDate = freezed,Object? createdDate = freezed,Object? userId = freezed,Object? bookClose = freezed,}) {
  return _then(_FiscalYearModel(
fiscalYearId: freezed == fiscalYearId ? _self.fiscalYearId : fiscalYearId // ignore: cast_nullable_to_non_nullable
as int?,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String?,fiscalYearName: freezed == fiscalYearName ? _self.fiscalYearName : fiscalYearName // ignore: cast_nullable_to_non_nullable
as String?,shortDate: freezed == shortDate ? _self.shortDate : shortDate // ignore: cast_nullable_to_non_nullable
as String?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as int?,bookClose: freezed == bookClose ? _self.bookClose : bookClose // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
