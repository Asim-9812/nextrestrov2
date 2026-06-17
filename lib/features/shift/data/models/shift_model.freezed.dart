// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShiftResponse {

 bool get succeeded; String? get messages; List<ShiftModel>? get data;
/// Create a copy of ShiftResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftResponseCopyWith<ShiftResponse> get copyWith => _$ShiftResponseCopyWithImpl<ShiftResponse>(this as ShiftResponse, _$identity);

  /// Serializes this ShiftResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ShiftResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $ShiftResponseCopyWith<$Res>  {
  factory $ShiftResponseCopyWith(ShiftResponse value, $Res Function(ShiftResponse) _then) = _$ShiftResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, List<ShiftModel>? data
});




}
/// @nodoc
class _$ShiftResponseCopyWithImpl<$Res>
    implements $ShiftResponseCopyWith<$Res> {
  _$ShiftResponseCopyWithImpl(this._self, this._then);

  final ShiftResponse _self;
  final $Res Function(ShiftResponse) _then;

/// Create a copy of ShiftResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ShiftModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftResponse].
extension ShiftResponsePatterns on ShiftResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftResponse value)  $default,){
final _that = this;
switch (_that) {
case _ShiftResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<ShiftModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<ShiftModel>? data)  $default,) {final _that = this;
switch (_that) {
case _ShiftResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  List<ShiftModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _ShiftResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShiftResponse implements ShiftResponse {
  const _ShiftResponse({this.succeeded = false, this.messages, final  List<ShiftModel>? data}): _data = data;
  factory _ShiftResponse.fromJson(Map<String, dynamic> json) => _$ShiftResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
 final  List<ShiftModel>? _data;
@override List<ShiftModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ShiftResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftResponseCopyWith<_ShiftResponse> get copyWith => __$ShiftResponseCopyWithImpl<_ShiftResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'ShiftResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ShiftResponseCopyWith<$Res> implements $ShiftResponseCopyWith<$Res> {
  factory _$ShiftResponseCopyWith(_ShiftResponse value, $Res Function(_ShiftResponse) _then) = __$ShiftResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, List<ShiftModel>? data
});




}
/// @nodoc
class __$ShiftResponseCopyWithImpl<$Res>
    implements _$ShiftResponseCopyWith<$Res> {
  __$ShiftResponseCopyWithImpl(this._self, this._then);

  final _ShiftResponse _self;
  final $Res Function(_ShiftResponse) _then;

/// Create a copy of ShiftResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_ShiftResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ShiftModel>?,
  ));
}


}


/// @nodoc
mixin _$ShiftModel {

 int? get shiftID; String? get shiftName; int? get openedByUserID; double? get openingAmount; String? get openingTime; int? get closedByUserID; double? get closingAmount; String? get closingTime; double get totalSales; double get cashSales; double get cardSales; double get qrSales; double get creditSales; int? get shiftStatus;
/// Create a copy of ShiftModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShiftModelCopyWith<ShiftModel> get copyWith => _$ShiftModelCopyWithImpl<ShiftModel>(this as ShiftModel, _$identity);

  /// Serializes this ShiftModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShiftModel&&(identical(other.shiftID, shiftID) || other.shiftID == shiftID)&&(identical(other.shiftName, shiftName) || other.shiftName == shiftName)&&(identical(other.openedByUserID, openedByUserID) || other.openedByUserID == openedByUserID)&&(identical(other.openingAmount, openingAmount) || other.openingAmount == openingAmount)&&(identical(other.openingTime, openingTime) || other.openingTime == openingTime)&&(identical(other.closedByUserID, closedByUserID) || other.closedByUserID == closedByUserID)&&(identical(other.closingAmount, closingAmount) || other.closingAmount == closingAmount)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.cardSales, cardSales) || other.cardSales == cardSales)&&(identical(other.qrSales, qrSales) || other.qrSales == qrSales)&&(identical(other.creditSales, creditSales) || other.creditSales == creditSales)&&(identical(other.shiftStatus, shiftStatus) || other.shiftStatus == shiftStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shiftID,shiftName,openedByUserID,openingAmount,openingTime,closedByUserID,closingAmount,closingTime,totalSales,cashSales,cardSales,qrSales,creditSales,shiftStatus);

@override
String toString() {
  return 'ShiftModel(shiftID: $shiftID, shiftName: $shiftName, openedByUserID: $openedByUserID, openingAmount: $openingAmount, openingTime: $openingTime, closedByUserID: $closedByUserID, closingAmount: $closingAmount, closingTime: $closingTime, totalSales: $totalSales, cashSales: $cashSales, cardSales: $cardSales, qrSales: $qrSales, creditSales: $creditSales, shiftStatus: $shiftStatus)';
}


}

/// @nodoc
abstract mixin class $ShiftModelCopyWith<$Res>  {
  factory $ShiftModelCopyWith(ShiftModel value, $Res Function(ShiftModel) _then) = _$ShiftModelCopyWithImpl;
@useResult
$Res call({
 int? shiftID, String? shiftName, int? openedByUserID, double? openingAmount, String? openingTime, int? closedByUserID, double? closingAmount, String? closingTime, double totalSales, double cashSales, double cardSales, double qrSales, double creditSales, int? shiftStatus
});




}
/// @nodoc
class _$ShiftModelCopyWithImpl<$Res>
    implements $ShiftModelCopyWith<$Res> {
  _$ShiftModelCopyWithImpl(this._self, this._then);

  final ShiftModel _self;
  final $Res Function(ShiftModel) _then;

/// Create a copy of ShiftModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? shiftID = freezed,Object? shiftName = freezed,Object? openedByUserID = freezed,Object? openingAmount = freezed,Object? openingTime = freezed,Object? closedByUserID = freezed,Object? closingAmount = freezed,Object? closingTime = freezed,Object? totalSales = null,Object? cashSales = null,Object? cardSales = null,Object? qrSales = null,Object? creditSales = null,Object? shiftStatus = freezed,}) {
  return _then(_self.copyWith(
shiftID: freezed == shiftID ? _self.shiftID : shiftID // ignore: cast_nullable_to_non_nullable
as int?,shiftName: freezed == shiftName ? _self.shiftName : shiftName // ignore: cast_nullable_to_non_nullable
as String?,openedByUserID: freezed == openedByUserID ? _self.openedByUserID : openedByUserID // ignore: cast_nullable_to_non_nullable
as int?,openingAmount: freezed == openingAmount ? _self.openingAmount : openingAmount // ignore: cast_nullable_to_non_nullable
as double?,openingTime: freezed == openingTime ? _self.openingTime : openingTime // ignore: cast_nullable_to_non_nullable
as String?,closedByUserID: freezed == closedByUserID ? _self.closedByUserID : closedByUserID // ignore: cast_nullable_to_non_nullable
as int?,closingAmount: freezed == closingAmount ? _self.closingAmount : closingAmount // ignore: cast_nullable_to_non_nullable
as double?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as String?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashSales: null == cashSales ? _self.cashSales : cashSales // ignore: cast_nullable_to_non_nullable
as double,cardSales: null == cardSales ? _self.cardSales : cardSales // ignore: cast_nullable_to_non_nullable
as double,qrSales: null == qrSales ? _self.qrSales : qrSales // ignore: cast_nullable_to_non_nullable
as double,creditSales: null == creditSales ? _self.creditSales : creditSales // ignore: cast_nullable_to_non_nullable
as double,shiftStatus: freezed == shiftStatus ? _self.shiftStatus : shiftStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShiftModel].
extension ShiftModelPatterns on ShiftModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShiftModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShiftModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShiftModel value)  $default,){
final _that = this;
switch (_that) {
case _ShiftModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShiftModel value)?  $default,){
final _that = this;
switch (_that) {
case _ShiftModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? shiftID,  String? shiftName,  int? openedByUserID,  double? openingAmount,  String? openingTime,  int? closedByUserID,  double? closingAmount,  String? closingTime,  double totalSales,  double cashSales,  double cardSales,  double qrSales,  double creditSales,  int? shiftStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShiftModel() when $default != null:
return $default(_that.shiftID,_that.shiftName,_that.openedByUserID,_that.openingAmount,_that.openingTime,_that.closedByUserID,_that.closingAmount,_that.closingTime,_that.totalSales,_that.cashSales,_that.cardSales,_that.qrSales,_that.creditSales,_that.shiftStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? shiftID,  String? shiftName,  int? openedByUserID,  double? openingAmount,  String? openingTime,  int? closedByUserID,  double? closingAmount,  String? closingTime,  double totalSales,  double cashSales,  double cardSales,  double qrSales,  double creditSales,  int? shiftStatus)  $default,) {final _that = this;
switch (_that) {
case _ShiftModel():
return $default(_that.shiftID,_that.shiftName,_that.openedByUserID,_that.openingAmount,_that.openingTime,_that.closedByUserID,_that.closingAmount,_that.closingTime,_that.totalSales,_that.cashSales,_that.cardSales,_that.qrSales,_that.creditSales,_that.shiftStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? shiftID,  String? shiftName,  int? openedByUserID,  double? openingAmount,  String? openingTime,  int? closedByUserID,  double? closingAmount,  String? closingTime,  double totalSales,  double cashSales,  double cardSales,  double qrSales,  double creditSales,  int? shiftStatus)?  $default,) {final _that = this;
switch (_that) {
case _ShiftModel() when $default != null:
return $default(_that.shiftID,_that.shiftName,_that.openedByUserID,_that.openingAmount,_that.openingTime,_that.closedByUserID,_that.closingAmount,_that.closingTime,_that.totalSales,_that.cashSales,_that.cardSales,_that.qrSales,_that.creditSales,_that.shiftStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShiftModel implements ShiftModel {
  const _ShiftModel({this.shiftID, this.shiftName, this.openedByUserID, this.openingAmount, this.openingTime, this.closedByUserID, this.closingAmount, this.closingTime, this.totalSales = 0.0, this.cashSales = 0.0, this.cardSales = 0.0, this.qrSales = 0.0, this.creditSales = 0.0, this.shiftStatus});
  factory _ShiftModel.fromJson(Map<String, dynamic> json) => _$ShiftModelFromJson(json);

@override final  int? shiftID;
@override final  String? shiftName;
@override final  int? openedByUserID;
@override final  double? openingAmount;
@override final  String? openingTime;
@override final  int? closedByUserID;
@override final  double? closingAmount;
@override final  String? closingTime;
@override@JsonKey() final  double totalSales;
@override@JsonKey() final  double cashSales;
@override@JsonKey() final  double cardSales;
@override@JsonKey() final  double qrSales;
@override@JsonKey() final  double creditSales;
@override final  int? shiftStatus;

/// Create a copy of ShiftModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShiftModelCopyWith<_ShiftModel> get copyWith => __$ShiftModelCopyWithImpl<_ShiftModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShiftModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShiftModel&&(identical(other.shiftID, shiftID) || other.shiftID == shiftID)&&(identical(other.shiftName, shiftName) || other.shiftName == shiftName)&&(identical(other.openedByUserID, openedByUserID) || other.openedByUserID == openedByUserID)&&(identical(other.openingAmount, openingAmount) || other.openingAmount == openingAmount)&&(identical(other.openingTime, openingTime) || other.openingTime == openingTime)&&(identical(other.closedByUserID, closedByUserID) || other.closedByUserID == closedByUserID)&&(identical(other.closingAmount, closingAmount) || other.closingAmount == closingAmount)&&(identical(other.closingTime, closingTime) || other.closingTime == closingTime)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.cardSales, cardSales) || other.cardSales == cardSales)&&(identical(other.qrSales, qrSales) || other.qrSales == qrSales)&&(identical(other.creditSales, creditSales) || other.creditSales == creditSales)&&(identical(other.shiftStatus, shiftStatus) || other.shiftStatus == shiftStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,shiftID,shiftName,openedByUserID,openingAmount,openingTime,closedByUserID,closingAmount,closingTime,totalSales,cashSales,cardSales,qrSales,creditSales,shiftStatus);

@override
String toString() {
  return 'ShiftModel(shiftID: $shiftID, shiftName: $shiftName, openedByUserID: $openedByUserID, openingAmount: $openingAmount, openingTime: $openingTime, closedByUserID: $closedByUserID, closingAmount: $closingAmount, closingTime: $closingTime, totalSales: $totalSales, cashSales: $cashSales, cardSales: $cardSales, qrSales: $qrSales, creditSales: $creditSales, shiftStatus: $shiftStatus)';
}


}

/// @nodoc
abstract mixin class _$ShiftModelCopyWith<$Res> implements $ShiftModelCopyWith<$Res> {
  factory _$ShiftModelCopyWith(_ShiftModel value, $Res Function(_ShiftModel) _then) = __$ShiftModelCopyWithImpl;
@override @useResult
$Res call({
 int? shiftID, String? shiftName, int? openedByUserID, double? openingAmount, String? openingTime, int? closedByUserID, double? closingAmount, String? closingTime, double totalSales, double cashSales, double cardSales, double qrSales, double creditSales, int? shiftStatus
});




}
/// @nodoc
class __$ShiftModelCopyWithImpl<$Res>
    implements _$ShiftModelCopyWith<$Res> {
  __$ShiftModelCopyWithImpl(this._self, this._then);

  final _ShiftModel _self;
  final $Res Function(_ShiftModel) _then;

/// Create a copy of ShiftModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? shiftID = freezed,Object? shiftName = freezed,Object? openedByUserID = freezed,Object? openingAmount = freezed,Object? openingTime = freezed,Object? closedByUserID = freezed,Object? closingAmount = freezed,Object? closingTime = freezed,Object? totalSales = null,Object? cashSales = null,Object? cardSales = null,Object? qrSales = null,Object? creditSales = null,Object? shiftStatus = freezed,}) {
  return _then(_ShiftModel(
shiftID: freezed == shiftID ? _self.shiftID : shiftID // ignore: cast_nullable_to_non_nullable
as int?,shiftName: freezed == shiftName ? _self.shiftName : shiftName // ignore: cast_nullable_to_non_nullable
as String?,openedByUserID: freezed == openedByUserID ? _self.openedByUserID : openedByUserID // ignore: cast_nullable_to_non_nullable
as int?,openingAmount: freezed == openingAmount ? _self.openingAmount : openingAmount // ignore: cast_nullable_to_non_nullable
as double?,openingTime: freezed == openingTime ? _self.openingTime : openingTime // ignore: cast_nullable_to_non_nullable
as String?,closedByUserID: freezed == closedByUserID ? _self.closedByUserID : closedByUserID // ignore: cast_nullable_to_non_nullable
as int?,closingAmount: freezed == closingAmount ? _self.closingAmount : closingAmount // ignore: cast_nullable_to_non_nullable
as double?,closingTime: freezed == closingTime ? _self.closingTime : closingTime // ignore: cast_nullable_to_non_nullable
as String?,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,cashSales: null == cashSales ? _self.cashSales : cashSales // ignore: cast_nullable_to_non_nullable
as double,cardSales: null == cardSales ? _self.cardSales : cardSales // ignore: cast_nullable_to_non_nullable
as double,qrSales: null == qrSales ? _self.qrSales : qrSales // ignore: cast_nullable_to_non_nullable
as double,creditSales: null == creditSales ? _self.creditSales : creditSales // ignore: cast_nullable_to_non_nullable
as double,shiftStatus: freezed == shiftStatus ? _self.shiftStatus : shiftStatus // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
