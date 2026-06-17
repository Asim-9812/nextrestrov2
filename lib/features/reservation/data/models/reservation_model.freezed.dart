// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReservationRequest {

 int get customerID; DateTime get reservationDate; String get specialRequest; double get advanceAmount; int get createdBy; List<ReservationDetail> get reservationDetails;
/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationRequestCopyWith<ReservationRequest> get copyWith => _$ReservationRequestCopyWithImpl<ReservationRequest>(this as ReservationRequest, _$identity);

  /// Serializes this ReservationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationRequest&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.reservationDate, reservationDate) || other.reservationDate == reservationDate)&&(identical(other.specialRequest, specialRequest) || other.specialRequest == specialRequest)&&(identical(other.advanceAmount, advanceAmount) || other.advanceAmount == advanceAmount)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other.reservationDetails, reservationDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerID,reservationDate,specialRequest,advanceAmount,createdBy,const DeepCollectionEquality().hash(reservationDetails));

@override
String toString() {
  return 'ReservationRequest(customerID: $customerID, reservationDate: $reservationDate, specialRequest: $specialRequest, advanceAmount: $advanceAmount, createdBy: $createdBy, reservationDetails: $reservationDetails)';
}


}

/// @nodoc
abstract mixin class $ReservationRequestCopyWith<$Res>  {
  factory $ReservationRequestCopyWith(ReservationRequest value, $Res Function(ReservationRequest) _then) = _$ReservationRequestCopyWithImpl;
@useResult
$Res call({
 int customerID, DateTime reservationDate, String specialRequest, double advanceAmount, int createdBy, List<ReservationDetail> reservationDetails
});




}
/// @nodoc
class _$ReservationRequestCopyWithImpl<$Res>
    implements $ReservationRequestCopyWith<$Res> {
  _$ReservationRequestCopyWithImpl(this._self, this._then);

  final ReservationRequest _self;
  final $Res Function(ReservationRequest) _then;

/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerID = null,Object? reservationDate = null,Object? specialRequest = null,Object? advanceAmount = null,Object? createdBy = null,Object? reservationDetails = null,}) {
  return _then(_self.copyWith(
customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,reservationDate: null == reservationDate ? _self.reservationDate : reservationDate // ignore: cast_nullable_to_non_nullable
as DateTime,specialRequest: null == specialRequest ? _self.specialRequest : specialRequest // ignore: cast_nullable_to_non_nullable
as String,advanceAmount: null == advanceAmount ? _self.advanceAmount : advanceAmount // ignore: cast_nullable_to_non_nullable
as double,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int,reservationDetails: null == reservationDetails ? _self.reservationDetails : reservationDetails // ignore: cast_nullable_to_non_nullable
as List<ReservationDetail>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationRequest].
extension ReservationRequestPatterns on ReservationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReservationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int customerID,  DateTime reservationDate,  String specialRequest,  double advanceAmount,  int createdBy,  List<ReservationDetail> reservationDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationRequest() when $default != null:
return $default(_that.customerID,_that.reservationDate,_that.specialRequest,_that.advanceAmount,_that.createdBy,_that.reservationDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int customerID,  DateTime reservationDate,  String specialRequest,  double advanceAmount,  int createdBy,  List<ReservationDetail> reservationDetails)  $default,) {final _that = this;
switch (_that) {
case _ReservationRequest():
return $default(_that.customerID,_that.reservationDate,_that.specialRequest,_that.advanceAmount,_that.createdBy,_that.reservationDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int customerID,  DateTime reservationDate,  String specialRequest,  double advanceAmount,  int createdBy,  List<ReservationDetail> reservationDetails)?  $default,) {final _that = this;
switch (_that) {
case _ReservationRequest() when $default != null:
return $default(_that.customerID,_that.reservationDate,_that.specialRequest,_that.advanceAmount,_that.createdBy,_that.reservationDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationRequest implements ReservationRequest {
  const _ReservationRequest({required this.customerID, required this.reservationDate, required this.specialRequest, required this.advanceAmount, required this.createdBy, required final  List<ReservationDetail> reservationDetails}): _reservationDetails = reservationDetails;
  factory _ReservationRequest.fromJson(Map<String, dynamic> json) => _$ReservationRequestFromJson(json);

@override final  int customerID;
@override final  DateTime reservationDate;
@override final  String specialRequest;
@override final  double advanceAmount;
@override final  int createdBy;
 final  List<ReservationDetail> _reservationDetails;
@override List<ReservationDetail> get reservationDetails {
  if (_reservationDetails is EqualUnmodifiableListView) return _reservationDetails;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reservationDetails);
}


/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationRequestCopyWith<_ReservationRequest> get copyWith => __$ReservationRequestCopyWithImpl<_ReservationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationRequest&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.reservationDate, reservationDate) || other.reservationDate == reservationDate)&&(identical(other.specialRequest, specialRequest) || other.specialRequest == specialRequest)&&(identical(other.advanceAmount, advanceAmount) || other.advanceAmount == advanceAmount)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&const DeepCollectionEquality().equals(other._reservationDetails, _reservationDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerID,reservationDate,specialRequest,advanceAmount,createdBy,const DeepCollectionEquality().hash(_reservationDetails));

@override
String toString() {
  return 'ReservationRequest(customerID: $customerID, reservationDate: $reservationDate, specialRequest: $specialRequest, advanceAmount: $advanceAmount, createdBy: $createdBy, reservationDetails: $reservationDetails)';
}


}

/// @nodoc
abstract mixin class _$ReservationRequestCopyWith<$Res> implements $ReservationRequestCopyWith<$Res> {
  factory _$ReservationRequestCopyWith(_ReservationRequest value, $Res Function(_ReservationRequest) _then) = __$ReservationRequestCopyWithImpl;
@override @useResult
$Res call({
 int customerID, DateTime reservationDate, String specialRequest, double advanceAmount, int createdBy, List<ReservationDetail> reservationDetails
});




}
/// @nodoc
class __$ReservationRequestCopyWithImpl<$Res>
    implements _$ReservationRequestCopyWith<$Res> {
  __$ReservationRequestCopyWithImpl(this._self, this._then);

  final _ReservationRequest _self;
  final $Res Function(_ReservationRequest) _then;

/// Create a copy of ReservationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerID = null,Object? reservationDate = null,Object? specialRequest = null,Object? advanceAmount = null,Object? createdBy = null,Object? reservationDetails = null,}) {
  return _then(_ReservationRequest(
customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,reservationDate: null == reservationDate ? _self.reservationDate : reservationDate // ignore: cast_nullable_to_non_nullable
as DateTime,specialRequest: null == specialRequest ? _self.specialRequest : specialRequest // ignore: cast_nullable_to_non_nullable
as String,advanceAmount: null == advanceAmount ? _self.advanceAmount : advanceAmount // ignore: cast_nullable_to_non_nullable
as double,createdBy: null == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int,reservationDetails: null == reservationDetails ? _self._reservationDetails : reservationDetails // ignore: cast_nullable_to_non_nullable
as List<ReservationDetail>,
  ));
}


}


/// @nodoc
mixin _$ReservationDetail {

 int get tableID; int get noOfPersons; int get reservationStatus; String get remarks;
/// Create a copy of ReservationDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationDetailCopyWith<ReservationDetail> get copyWith => _$ReservationDetailCopyWithImpl<ReservationDetail>(this as ReservationDetail, _$identity);

  /// Serializes this ReservationDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationDetail&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.noOfPersons, noOfPersons) || other.noOfPersons == noOfPersons)&&(identical(other.reservationStatus, reservationStatus) || other.reservationStatus == reservationStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableID,noOfPersons,reservationStatus,remarks);

@override
String toString() {
  return 'ReservationDetail(tableID: $tableID, noOfPersons: $noOfPersons, reservationStatus: $reservationStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $ReservationDetailCopyWith<$Res>  {
  factory $ReservationDetailCopyWith(ReservationDetail value, $Res Function(ReservationDetail) _then) = _$ReservationDetailCopyWithImpl;
@useResult
$Res call({
 int tableID, int noOfPersons, int reservationStatus, String remarks
});




}
/// @nodoc
class _$ReservationDetailCopyWithImpl<$Res>
    implements $ReservationDetailCopyWith<$Res> {
  _$ReservationDetailCopyWithImpl(this._self, this._then);

  final ReservationDetail _self;
  final $Res Function(ReservationDetail) _then;

/// Create a copy of ReservationDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableID = null,Object? noOfPersons = null,Object? reservationStatus = null,Object? remarks = null,}) {
  return _then(_self.copyWith(
tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,noOfPersons: null == noOfPersons ? _self.noOfPersons : noOfPersons // ignore: cast_nullable_to_non_nullable
as int,reservationStatus: null == reservationStatus ? _self.reservationStatus : reservationStatus // ignore: cast_nullable_to_non_nullable
as int,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationDetail].
extension ReservationDetailPatterns on ReservationDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationDetail value)  $default,){
final _that = this;
switch (_that) {
case _ReservationDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationDetail value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tableID,  int noOfPersons,  int reservationStatus,  String remarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationDetail() when $default != null:
return $default(_that.tableID,_that.noOfPersons,_that.reservationStatus,_that.remarks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tableID,  int noOfPersons,  int reservationStatus,  String remarks)  $default,) {final _that = this;
switch (_that) {
case _ReservationDetail():
return $default(_that.tableID,_that.noOfPersons,_that.reservationStatus,_that.remarks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tableID,  int noOfPersons,  int reservationStatus,  String remarks)?  $default,) {final _that = this;
switch (_that) {
case _ReservationDetail() when $default != null:
return $default(_that.tableID,_that.noOfPersons,_that.reservationStatus,_that.remarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationDetail implements ReservationDetail {
  const _ReservationDetail({required this.tableID, required this.noOfPersons, required this.reservationStatus, required this.remarks});
  factory _ReservationDetail.fromJson(Map<String, dynamic> json) => _$ReservationDetailFromJson(json);

@override final  int tableID;
@override final  int noOfPersons;
@override final  int reservationStatus;
@override final  String remarks;

/// Create a copy of ReservationDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationDetailCopyWith<_ReservationDetail> get copyWith => __$ReservationDetailCopyWithImpl<_ReservationDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationDetail&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.noOfPersons, noOfPersons) || other.noOfPersons == noOfPersons)&&(identical(other.reservationStatus, reservationStatus) || other.reservationStatus == reservationStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableID,noOfPersons,reservationStatus,remarks);

@override
String toString() {
  return 'ReservationDetail(tableID: $tableID, noOfPersons: $noOfPersons, reservationStatus: $reservationStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$ReservationDetailCopyWith<$Res> implements $ReservationDetailCopyWith<$Res> {
  factory _$ReservationDetailCopyWith(_ReservationDetail value, $Res Function(_ReservationDetail) _then) = __$ReservationDetailCopyWithImpl;
@override @useResult
$Res call({
 int tableID, int noOfPersons, int reservationStatus, String remarks
});




}
/// @nodoc
class __$ReservationDetailCopyWithImpl<$Res>
    implements _$ReservationDetailCopyWith<$Res> {
  __$ReservationDetailCopyWithImpl(this._self, this._then);

  final _ReservationDetail _self;
  final $Res Function(_ReservationDetail) _then;

/// Create a copy of ReservationDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableID = null,Object? noOfPersons = null,Object? reservationStatus = null,Object? remarks = null,}) {
  return _then(_ReservationDetail(
tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,noOfPersons: null == noOfPersons ? _self.noOfPersons : noOfPersons // ignore: cast_nullable_to_non_nullable
as int,reservationStatus: null == reservationStatus ? _self.reservationStatus : reservationStatus // ignore: cast_nullable_to_non_nullable
as int,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReservationListItem {

 int get reservationID; int get customerID; DateTime get reservationDate; double get advanceAmount; String get specialRequest;
/// Create a copy of ReservationListItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationListItemCopyWith<ReservationListItem> get copyWith => _$ReservationListItemCopyWithImpl<ReservationListItem>(this as ReservationListItem, _$identity);

  /// Serializes this ReservationListItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationListItem&&(identical(other.reservationID, reservationID) || other.reservationID == reservationID)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.reservationDate, reservationDate) || other.reservationDate == reservationDate)&&(identical(other.advanceAmount, advanceAmount) || other.advanceAmount == advanceAmount)&&(identical(other.specialRequest, specialRequest) || other.specialRequest == specialRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservationID,customerID,reservationDate,advanceAmount,specialRequest);

@override
String toString() {
  return 'ReservationListItem(reservationID: $reservationID, customerID: $customerID, reservationDate: $reservationDate, advanceAmount: $advanceAmount, specialRequest: $specialRequest)';
}


}

/// @nodoc
abstract mixin class $ReservationListItemCopyWith<$Res>  {
  factory $ReservationListItemCopyWith(ReservationListItem value, $Res Function(ReservationListItem) _then) = _$ReservationListItemCopyWithImpl;
@useResult
$Res call({
 int reservationID, int customerID, DateTime reservationDate, double advanceAmount, String specialRequest
});




}
/// @nodoc
class _$ReservationListItemCopyWithImpl<$Res>
    implements $ReservationListItemCopyWith<$Res> {
  _$ReservationListItemCopyWithImpl(this._self, this._then);

  final ReservationListItem _self;
  final $Res Function(ReservationListItem) _then;

/// Create a copy of ReservationListItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservationID = null,Object? customerID = null,Object? reservationDate = null,Object? advanceAmount = null,Object? specialRequest = null,}) {
  return _then(_self.copyWith(
reservationID: null == reservationID ? _self.reservationID : reservationID // ignore: cast_nullable_to_non_nullable
as int,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,reservationDate: null == reservationDate ? _self.reservationDate : reservationDate // ignore: cast_nullable_to_non_nullable
as DateTime,advanceAmount: null == advanceAmount ? _self.advanceAmount : advanceAmount // ignore: cast_nullable_to_non_nullable
as double,specialRequest: null == specialRequest ? _self.specialRequest : specialRequest // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationListItem].
extension ReservationListItemPatterns on ReservationListItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationListItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationListItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationListItem value)  $default,){
final _that = this;
switch (_that) {
case _ReservationListItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationListItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationListItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int reservationID,  int customerID,  DateTime reservationDate,  double advanceAmount,  String specialRequest)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationListItem() when $default != null:
return $default(_that.reservationID,_that.customerID,_that.reservationDate,_that.advanceAmount,_that.specialRequest);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int reservationID,  int customerID,  DateTime reservationDate,  double advanceAmount,  String specialRequest)  $default,) {final _that = this;
switch (_that) {
case _ReservationListItem():
return $default(_that.reservationID,_that.customerID,_that.reservationDate,_that.advanceAmount,_that.specialRequest);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int reservationID,  int customerID,  DateTime reservationDate,  double advanceAmount,  String specialRequest)?  $default,) {final _that = this;
switch (_that) {
case _ReservationListItem() when $default != null:
return $default(_that.reservationID,_that.customerID,_that.reservationDate,_that.advanceAmount,_that.specialRequest);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationListItem implements ReservationListItem {
  const _ReservationListItem({required this.reservationID, required this.customerID, required this.reservationDate, required this.advanceAmount, required this.specialRequest});
  factory _ReservationListItem.fromJson(Map<String, dynamic> json) => _$ReservationListItemFromJson(json);

@override final  int reservationID;
@override final  int customerID;
@override final  DateTime reservationDate;
@override final  double advanceAmount;
@override final  String specialRequest;

/// Create a copy of ReservationListItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationListItemCopyWith<_ReservationListItem> get copyWith => __$ReservationListItemCopyWithImpl<_ReservationListItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationListItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationListItem&&(identical(other.reservationID, reservationID) || other.reservationID == reservationID)&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.reservationDate, reservationDate) || other.reservationDate == reservationDate)&&(identical(other.advanceAmount, advanceAmount) || other.advanceAmount == advanceAmount)&&(identical(other.specialRequest, specialRequest) || other.specialRequest == specialRequest));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservationID,customerID,reservationDate,advanceAmount,specialRequest);

@override
String toString() {
  return 'ReservationListItem(reservationID: $reservationID, customerID: $customerID, reservationDate: $reservationDate, advanceAmount: $advanceAmount, specialRequest: $specialRequest)';
}


}

/// @nodoc
abstract mixin class _$ReservationListItemCopyWith<$Res> implements $ReservationListItemCopyWith<$Res> {
  factory _$ReservationListItemCopyWith(_ReservationListItem value, $Res Function(_ReservationListItem) _then) = __$ReservationListItemCopyWithImpl;
@override @useResult
$Res call({
 int reservationID, int customerID, DateTime reservationDate, double advanceAmount, String specialRequest
});




}
/// @nodoc
class __$ReservationListItemCopyWithImpl<$Res>
    implements _$ReservationListItemCopyWith<$Res> {
  __$ReservationListItemCopyWithImpl(this._self, this._then);

  final _ReservationListItem _self;
  final $Res Function(_ReservationListItem) _then;

/// Create a copy of ReservationListItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservationID = null,Object? customerID = null,Object? reservationDate = null,Object? advanceAmount = null,Object? specialRequest = null,}) {
  return _then(_ReservationListItem(
reservationID: null == reservationID ? _self.reservationID : reservationID // ignore: cast_nullable_to_non_nullable
as int,customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,reservationDate: null == reservationDate ? _self.reservationDate : reservationDate // ignore: cast_nullable_to_non_nullable
as DateTime,advanceAmount: null == advanceAmount ? _self.advanceAmount : advanceAmount // ignore: cast_nullable_to_non_nullable
as double,specialRequest: null == specialRequest ? _self.specialRequest : specialRequest // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReservationDetailItem {

 int get reservationDetailsID; int get reservationID; int get tableID; String get tableNumber; int get noOfPersons; int get reservationStatus; String get remarks;
/// Create a copy of ReservationDetailItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReservationDetailItemCopyWith<ReservationDetailItem> get copyWith => _$ReservationDetailItemCopyWithImpl<ReservationDetailItem>(this as ReservationDetailItem, _$identity);

  /// Serializes this ReservationDetailItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReservationDetailItem&&(identical(other.reservationDetailsID, reservationDetailsID) || other.reservationDetailsID == reservationDetailsID)&&(identical(other.reservationID, reservationID) || other.reservationID == reservationID)&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.noOfPersons, noOfPersons) || other.noOfPersons == noOfPersons)&&(identical(other.reservationStatus, reservationStatus) || other.reservationStatus == reservationStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservationDetailsID,reservationID,tableID,tableNumber,noOfPersons,reservationStatus,remarks);

@override
String toString() {
  return 'ReservationDetailItem(reservationDetailsID: $reservationDetailsID, reservationID: $reservationID, tableID: $tableID, tableNumber: $tableNumber, noOfPersons: $noOfPersons, reservationStatus: $reservationStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class $ReservationDetailItemCopyWith<$Res>  {
  factory $ReservationDetailItemCopyWith(ReservationDetailItem value, $Res Function(ReservationDetailItem) _then) = _$ReservationDetailItemCopyWithImpl;
@useResult
$Res call({
 int reservationDetailsID, int reservationID, int tableID, String tableNumber, int noOfPersons, int reservationStatus, String remarks
});




}
/// @nodoc
class _$ReservationDetailItemCopyWithImpl<$Res>
    implements $ReservationDetailItemCopyWith<$Res> {
  _$ReservationDetailItemCopyWithImpl(this._self, this._then);

  final ReservationDetailItem _self;
  final $Res Function(ReservationDetailItem) _then;

/// Create a copy of ReservationDetailItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reservationDetailsID = null,Object? reservationID = null,Object? tableID = null,Object? tableNumber = null,Object? noOfPersons = null,Object? reservationStatus = null,Object? remarks = null,}) {
  return _then(_self.copyWith(
reservationDetailsID: null == reservationDetailsID ? _self.reservationDetailsID : reservationDetailsID // ignore: cast_nullable_to_non_nullable
as int,reservationID: null == reservationID ? _self.reservationID : reservationID // ignore: cast_nullable_to_non_nullable
as int,tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,noOfPersons: null == noOfPersons ? _self.noOfPersons : noOfPersons // ignore: cast_nullable_to_non_nullable
as int,reservationStatus: null == reservationStatus ? _self.reservationStatus : reservationStatus // ignore: cast_nullable_to_non_nullable
as int,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ReservationDetailItem].
extension ReservationDetailItemPatterns on ReservationDetailItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReservationDetailItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReservationDetailItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReservationDetailItem value)  $default,){
final _that = this;
switch (_that) {
case _ReservationDetailItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReservationDetailItem value)?  $default,){
final _that = this;
switch (_that) {
case _ReservationDetailItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int reservationDetailsID,  int reservationID,  int tableID,  String tableNumber,  int noOfPersons,  int reservationStatus,  String remarks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReservationDetailItem() when $default != null:
return $default(_that.reservationDetailsID,_that.reservationID,_that.tableID,_that.tableNumber,_that.noOfPersons,_that.reservationStatus,_that.remarks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int reservationDetailsID,  int reservationID,  int tableID,  String tableNumber,  int noOfPersons,  int reservationStatus,  String remarks)  $default,) {final _that = this;
switch (_that) {
case _ReservationDetailItem():
return $default(_that.reservationDetailsID,_that.reservationID,_that.tableID,_that.tableNumber,_that.noOfPersons,_that.reservationStatus,_that.remarks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int reservationDetailsID,  int reservationID,  int tableID,  String tableNumber,  int noOfPersons,  int reservationStatus,  String remarks)?  $default,) {final _that = this;
switch (_that) {
case _ReservationDetailItem() when $default != null:
return $default(_that.reservationDetailsID,_that.reservationID,_that.tableID,_that.tableNumber,_that.noOfPersons,_that.reservationStatus,_that.remarks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReservationDetailItem implements ReservationDetailItem {
  const _ReservationDetailItem({required this.reservationDetailsID, required this.reservationID, required this.tableID, required this.tableNumber, required this.noOfPersons, required this.reservationStatus, required this.remarks});
  factory _ReservationDetailItem.fromJson(Map<String, dynamic> json) => _$ReservationDetailItemFromJson(json);

@override final  int reservationDetailsID;
@override final  int reservationID;
@override final  int tableID;
@override final  String tableNumber;
@override final  int noOfPersons;
@override final  int reservationStatus;
@override final  String remarks;

/// Create a copy of ReservationDetailItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReservationDetailItemCopyWith<_ReservationDetailItem> get copyWith => __$ReservationDetailItemCopyWithImpl<_ReservationDetailItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReservationDetailItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReservationDetailItem&&(identical(other.reservationDetailsID, reservationDetailsID) || other.reservationDetailsID == reservationDetailsID)&&(identical(other.reservationID, reservationID) || other.reservationID == reservationID)&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.noOfPersons, noOfPersons) || other.noOfPersons == noOfPersons)&&(identical(other.reservationStatus, reservationStatus) || other.reservationStatus == reservationStatus)&&(identical(other.remarks, remarks) || other.remarks == remarks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reservationDetailsID,reservationID,tableID,tableNumber,noOfPersons,reservationStatus,remarks);

@override
String toString() {
  return 'ReservationDetailItem(reservationDetailsID: $reservationDetailsID, reservationID: $reservationID, tableID: $tableID, tableNumber: $tableNumber, noOfPersons: $noOfPersons, reservationStatus: $reservationStatus, remarks: $remarks)';
}


}

/// @nodoc
abstract mixin class _$ReservationDetailItemCopyWith<$Res> implements $ReservationDetailItemCopyWith<$Res> {
  factory _$ReservationDetailItemCopyWith(_ReservationDetailItem value, $Res Function(_ReservationDetailItem) _then) = __$ReservationDetailItemCopyWithImpl;
@override @useResult
$Res call({
 int reservationDetailsID, int reservationID, int tableID, String tableNumber, int noOfPersons, int reservationStatus, String remarks
});




}
/// @nodoc
class __$ReservationDetailItemCopyWithImpl<$Res>
    implements _$ReservationDetailItemCopyWith<$Res> {
  __$ReservationDetailItemCopyWithImpl(this._self, this._then);

  final _ReservationDetailItem _self;
  final $Res Function(_ReservationDetailItem) _then;

/// Create a copy of ReservationDetailItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reservationDetailsID = null,Object? reservationID = null,Object? tableID = null,Object? tableNumber = null,Object? noOfPersons = null,Object? reservationStatus = null,Object? remarks = null,}) {
  return _then(_ReservationDetailItem(
reservationDetailsID: null == reservationDetailsID ? _self.reservationDetailsID : reservationDetailsID // ignore: cast_nullable_to_non_nullable
as int,reservationID: null == reservationID ? _self.reservationID : reservationID // ignore: cast_nullable_to_non_nullable
as int,tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,noOfPersons: null == noOfPersons ? _self.noOfPersons : noOfPersons // ignore: cast_nullable_to_non_nullable
as int,reservationStatus: null == reservationStatus ? _self.reservationStatus : reservationStatus // ignore: cast_nullable_to_non_nullable
as int,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
