// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerModel {

 int get customerID; String get firstName; String get lastName; String get email; String get phone; String get address; int get loyaltyPoints; bool get isMember; String? get gender; DateTime? get dob;
/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<CustomerModel> get copyWith => _$CustomerModelCopyWithImpl<CustomerModel>(this as CustomerModel, _$identity);

  /// Serializes this CustomerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerModel&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.loyaltyPoints, loyaltyPoints) || other.loyaltyPoints == loyaltyPoints)&&(identical(other.isMember, isMember) || other.isMember == isMember)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerID,firstName,lastName,email,phone,address,loyaltyPoints,isMember,gender,dob);

@override
String toString() {
  return 'CustomerModel(customerID: $customerID, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, address: $address, loyaltyPoints: $loyaltyPoints, isMember: $isMember, gender: $gender, dob: $dob)';
}


}

/// @nodoc
abstract mixin class $CustomerModelCopyWith<$Res>  {
  factory $CustomerModelCopyWith(CustomerModel value, $Res Function(CustomerModel) _then) = _$CustomerModelCopyWithImpl;
@useResult
$Res call({
 int customerID, String firstName, String lastName, String email, String phone, String address, int loyaltyPoints, bool isMember, String? gender, DateTime? dob
});




}
/// @nodoc
class _$CustomerModelCopyWithImpl<$Res>
    implements $CustomerModelCopyWith<$Res> {
  _$CustomerModelCopyWithImpl(this._self, this._then);

  final CustomerModel _self;
  final $Res Function(CustomerModel) _then;

/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? customerID = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,Object? address = null,Object? loyaltyPoints = null,Object? isMember = null,Object? gender = freezed,Object? dob = freezed,}) {
  return _then(_self.copyWith(
customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,loyaltyPoints: null == loyaltyPoints ? _self.loyaltyPoints : loyaltyPoints // ignore: cast_nullable_to_non_nullable
as int,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerModel].
extension CustomerModelPatterns on CustomerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerModel value)  $default,){
final _that = this;
switch (_that) {
case _CustomerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerModel value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int customerID,  String firstName,  String lastName,  String email,  String phone,  String address,  int loyaltyPoints,  bool isMember,  String? gender,  DateTime? dob)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerModel() when $default != null:
return $default(_that.customerID,_that.firstName,_that.lastName,_that.email,_that.phone,_that.address,_that.loyaltyPoints,_that.isMember,_that.gender,_that.dob);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int customerID,  String firstName,  String lastName,  String email,  String phone,  String address,  int loyaltyPoints,  bool isMember,  String? gender,  DateTime? dob)  $default,) {final _that = this;
switch (_that) {
case _CustomerModel():
return $default(_that.customerID,_that.firstName,_that.lastName,_that.email,_that.phone,_that.address,_that.loyaltyPoints,_that.isMember,_that.gender,_that.dob);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int customerID,  String firstName,  String lastName,  String email,  String phone,  String address,  int loyaltyPoints,  bool isMember,  String? gender,  DateTime? dob)?  $default,) {final _that = this;
switch (_that) {
case _CustomerModel() when $default != null:
return $default(_that.customerID,_that.firstName,_that.lastName,_that.email,_that.phone,_that.address,_that.loyaltyPoints,_that.isMember,_that.gender,_that.dob);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerModel implements CustomerModel {
  const _CustomerModel({required this.customerID, required this.firstName, required this.lastName, required this.email, required this.phone, required this.address, required this.loyaltyPoints, required this.isMember, this.gender, this.dob});
  factory _CustomerModel.fromJson(Map<String, dynamic> json) => _$CustomerModelFromJson(json);

@override final  int customerID;
@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String phone;
@override final  String address;
@override final  int loyaltyPoints;
@override final  bool isMember;
@override final  String? gender;
@override final  DateTime? dob;

/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerModelCopyWith<_CustomerModel> get copyWith => __$CustomerModelCopyWithImpl<_CustomerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerModel&&(identical(other.customerID, customerID) || other.customerID == customerID)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.loyaltyPoints, loyaltyPoints) || other.loyaltyPoints == loyaltyPoints)&&(identical(other.isMember, isMember) || other.isMember == isMember)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.dob, dob) || other.dob == dob));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,customerID,firstName,lastName,email,phone,address,loyaltyPoints,isMember,gender,dob);

@override
String toString() {
  return 'CustomerModel(customerID: $customerID, firstName: $firstName, lastName: $lastName, email: $email, phone: $phone, address: $address, loyaltyPoints: $loyaltyPoints, isMember: $isMember, gender: $gender, dob: $dob)';
}


}

/// @nodoc
abstract mixin class _$CustomerModelCopyWith<$Res> implements $CustomerModelCopyWith<$Res> {
  factory _$CustomerModelCopyWith(_CustomerModel value, $Res Function(_CustomerModel) _then) = __$CustomerModelCopyWithImpl;
@override @useResult
$Res call({
 int customerID, String firstName, String lastName, String email, String phone, String address, int loyaltyPoints, bool isMember, String? gender, DateTime? dob
});




}
/// @nodoc
class __$CustomerModelCopyWithImpl<$Res>
    implements _$CustomerModelCopyWith<$Res> {
  __$CustomerModelCopyWithImpl(this._self, this._then);

  final _CustomerModel _self;
  final $Res Function(_CustomerModel) _then;

/// Create a copy of CustomerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? customerID = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? phone = null,Object? address = null,Object? loyaltyPoints = null,Object? isMember = null,Object? gender = freezed,Object? dob = freezed,}) {
  return _then(_CustomerModel(
customerID: null == customerID ? _self.customerID : customerID // ignore: cast_nullable_to_non_nullable
as int,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,loyaltyPoints: null == loyaltyPoints ? _self.loyaltyPoints : loyaltyPoints // ignore: cast_nullable_to_non_nullable
as int,isMember: null == isMember ? _self.isMember : isMember // ignore: cast_nullable_to_non_nullable
as bool,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,dob: freezed == dob ? _self.dob : dob // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
