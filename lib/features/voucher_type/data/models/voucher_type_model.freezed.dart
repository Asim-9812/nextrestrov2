// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voucher_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VoucherTypeResponse {

 bool get succeeded; String? get messages; List<VoucherTypeModel>? get data;
/// Create a copy of VoucherTypeResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherTypeResponseCopyWith<VoucherTypeResponse> get copyWith => _$VoucherTypeResponseCopyWithImpl<VoucherTypeResponse>(this as VoucherTypeResponse, _$identity);

  /// Serializes this VoucherTypeResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherTypeResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'VoucherTypeResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $VoucherTypeResponseCopyWith<$Res>  {
  factory $VoucherTypeResponseCopyWith(VoucherTypeResponse value, $Res Function(VoucherTypeResponse) _then) = _$VoucherTypeResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, List<VoucherTypeModel>? data
});




}
/// @nodoc
class _$VoucherTypeResponseCopyWithImpl<$Res>
    implements $VoucherTypeResponseCopyWith<$Res> {
  _$VoucherTypeResponseCopyWithImpl(this._self, this._then);

  final VoucherTypeResponse _self;
  final $Res Function(VoucherTypeResponse) _then;

/// Create a copy of VoucherTypeResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<VoucherTypeModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherTypeResponse].
extension VoucherTypeResponsePatterns on VoucherTypeResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherTypeResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherTypeResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherTypeResponse value)  $default,){
final _that = this;
switch (_that) {
case _VoucherTypeResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherTypeResponse value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherTypeResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<VoucherTypeModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherTypeResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<VoucherTypeModel>? data)  $default,) {final _that = this;
switch (_that) {
case _VoucherTypeResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  List<VoucherTypeModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _VoucherTypeResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoucherTypeResponse implements VoucherTypeResponse {
  const _VoucherTypeResponse({this.succeeded = false, this.messages, final  List<VoucherTypeModel>? data}): _data = data;
  factory _VoucherTypeResponse.fromJson(Map<String, dynamic> json) => _$VoucherTypeResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
 final  List<VoucherTypeModel>? _data;
@override List<VoucherTypeModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of VoucherTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherTypeResponseCopyWith<_VoucherTypeResponse> get copyWith => __$VoucherTypeResponseCopyWithImpl<_VoucherTypeResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherTypeResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherTypeResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'VoucherTypeResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$VoucherTypeResponseCopyWith<$Res> implements $VoucherTypeResponseCopyWith<$Res> {
  factory _$VoucherTypeResponseCopyWith(_VoucherTypeResponse value, $Res Function(_VoucherTypeResponse) _then) = __$VoucherTypeResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, List<VoucherTypeModel>? data
});




}
/// @nodoc
class __$VoucherTypeResponseCopyWithImpl<$Res>
    implements _$VoucherTypeResponseCopyWith<$Res> {
  __$VoucherTypeResponseCopyWithImpl(this._self, this._then);

  final _VoucherTypeResponse _self;
  final $Res Function(_VoucherTypeResponse) _then;

/// Create a copy of VoucherTypeResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_VoucherTypeResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<VoucherTypeModel>?,
  ));
}


}


/// @nodoc
mixin _$VoucherTypeModel {

 int? get voucherTypeId; String? get voucherTypeName; bool? get isTax; String? get narration; String? get entryDate; bool? get isActive; String? get extra1; String? get extra2;
/// Create a copy of VoucherTypeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoucherTypeModelCopyWith<VoucherTypeModel> get copyWith => _$VoucherTypeModelCopyWithImpl<VoucherTypeModel>(this as VoucherTypeModel, _$identity);

  /// Serializes this VoucherTypeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoucherTypeModel&&(identical(other.voucherTypeId, voucherTypeId) || other.voucherTypeId == voucherTypeId)&&(identical(other.voucherTypeName, voucherTypeName) || other.voucherTypeName == voucherTypeName)&&(identical(other.isTax, isTax) || other.isTax == isTax)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.extra1, extra1) || other.extra1 == extra1)&&(identical(other.extra2, extra2) || other.extra2 == extra2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherTypeId,voucherTypeName,isTax,narration,entryDate,isActive,extra1,extra2);

@override
String toString() {
  return 'VoucherTypeModel(voucherTypeId: $voucherTypeId, voucherTypeName: $voucherTypeName, isTax: $isTax, narration: $narration, entryDate: $entryDate, isActive: $isActive, extra1: $extra1, extra2: $extra2)';
}


}

/// @nodoc
abstract mixin class $VoucherTypeModelCopyWith<$Res>  {
  factory $VoucherTypeModelCopyWith(VoucherTypeModel value, $Res Function(VoucherTypeModel) _then) = _$VoucherTypeModelCopyWithImpl;
@useResult
$Res call({
 int? voucherTypeId, String? voucherTypeName, bool? isTax, String? narration, String? entryDate, bool? isActive, String? extra1, String? extra2
});




}
/// @nodoc
class _$VoucherTypeModelCopyWithImpl<$Res>
    implements $VoucherTypeModelCopyWith<$Res> {
  _$VoucherTypeModelCopyWithImpl(this._self, this._then);

  final VoucherTypeModel _self;
  final $Res Function(VoucherTypeModel) _then;

/// Create a copy of VoucherTypeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? voucherTypeId = freezed,Object? voucherTypeName = freezed,Object? isTax = freezed,Object? narration = freezed,Object? entryDate = freezed,Object? isActive = freezed,Object? extra1 = freezed,Object? extra2 = freezed,}) {
  return _then(_self.copyWith(
voucherTypeId: freezed == voucherTypeId ? _self.voucherTypeId : voucherTypeId // ignore: cast_nullable_to_non_nullable
as int?,voucherTypeName: freezed == voucherTypeName ? _self.voucherTypeName : voucherTypeName // ignore: cast_nullable_to_non_nullable
as String?,isTax: freezed == isTax ? _self.isTax : isTax // ignore: cast_nullable_to_non_nullable
as bool?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,extra1: freezed == extra1 ? _self.extra1 : extra1 // ignore: cast_nullable_to_non_nullable
as String?,extra2: freezed == extra2 ? _self.extra2 : extra2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VoucherTypeModel].
extension VoucherTypeModelPatterns on VoucherTypeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoucherTypeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoucherTypeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoucherTypeModel value)  $default,){
final _that = this;
switch (_that) {
case _VoucherTypeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoucherTypeModel value)?  $default,){
final _that = this;
switch (_that) {
case _VoucherTypeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? voucherTypeId,  String? voucherTypeName,  bool? isTax,  String? narration,  String? entryDate,  bool? isActive,  String? extra1,  String? extra2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoucherTypeModel() when $default != null:
return $default(_that.voucherTypeId,_that.voucherTypeName,_that.isTax,_that.narration,_that.entryDate,_that.isActive,_that.extra1,_that.extra2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? voucherTypeId,  String? voucherTypeName,  bool? isTax,  String? narration,  String? entryDate,  bool? isActive,  String? extra1,  String? extra2)  $default,) {final _that = this;
switch (_that) {
case _VoucherTypeModel():
return $default(_that.voucherTypeId,_that.voucherTypeName,_that.isTax,_that.narration,_that.entryDate,_that.isActive,_that.extra1,_that.extra2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? voucherTypeId,  String? voucherTypeName,  bool? isTax,  String? narration,  String? entryDate,  bool? isActive,  String? extra1,  String? extra2)?  $default,) {final _that = this;
switch (_that) {
case _VoucherTypeModel() when $default != null:
return $default(_that.voucherTypeId,_that.voucherTypeName,_that.isTax,_that.narration,_that.entryDate,_that.isActive,_that.extra1,_that.extra2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoucherTypeModel implements VoucherTypeModel {
  const _VoucherTypeModel({this.voucherTypeId, this.voucherTypeName, this.isTax, this.narration, this.entryDate, this.isActive, this.extra1, this.extra2});
  factory _VoucherTypeModel.fromJson(Map<String, dynamic> json) => _$VoucherTypeModelFromJson(json);

@override final  int? voucherTypeId;
@override final  String? voucherTypeName;
@override final  bool? isTax;
@override final  String? narration;
@override final  String? entryDate;
@override final  bool? isActive;
@override final  String? extra1;
@override final  String? extra2;

/// Create a copy of VoucherTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoucherTypeModelCopyWith<_VoucherTypeModel> get copyWith => __$VoucherTypeModelCopyWithImpl<_VoucherTypeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoucherTypeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoucherTypeModel&&(identical(other.voucherTypeId, voucherTypeId) || other.voucherTypeId == voucherTypeId)&&(identical(other.voucherTypeName, voucherTypeName) || other.voucherTypeName == voucherTypeName)&&(identical(other.isTax, isTax) || other.isTax == isTax)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.entryDate, entryDate) || other.entryDate == entryDate)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.extra1, extra1) || other.extra1 == extra1)&&(identical(other.extra2, extra2) || other.extra2 == extra2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,voucherTypeId,voucherTypeName,isTax,narration,entryDate,isActive,extra1,extra2);

@override
String toString() {
  return 'VoucherTypeModel(voucherTypeId: $voucherTypeId, voucherTypeName: $voucherTypeName, isTax: $isTax, narration: $narration, entryDate: $entryDate, isActive: $isActive, extra1: $extra1, extra2: $extra2)';
}


}

/// @nodoc
abstract mixin class _$VoucherTypeModelCopyWith<$Res> implements $VoucherTypeModelCopyWith<$Res> {
  factory _$VoucherTypeModelCopyWith(_VoucherTypeModel value, $Res Function(_VoucherTypeModel) _then) = __$VoucherTypeModelCopyWithImpl;
@override @useResult
$Res call({
 int? voucherTypeId, String? voucherTypeName, bool? isTax, String? narration, String? entryDate, bool? isActive, String? extra1, String? extra2
});




}
/// @nodoc
class __$VoucherTypeModelCopyWithImpl<$Res>
    implements _$VoucherTypeModelCopyWith<$Res> {
  __$VoucherTypeModelCopyWithImpl(this._self, this._then);

  final _VoucherTypeModel _self;
  final $Res Function(_VoucherTypeModel) _then;

/// Create a copy of VoucherTypeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? voucherTypeId = freezed,Object? voucherTypeName = freezed,Object? isTax = freezed,Object? narration = freezed,Object? entryDate = freezed,Object? isActive = freezed,Object? extra1 = freezed,Object? extra2 = freezed,}) {
  return _then(_VoucherTypeModel(
voucherTypeId: freezed == voucherTypeId ? _self.voucherTypeId : voucherTypeId // ignore: cast_nullable_to_non_nullable
as int?,voucherTypeName: freezed == voucherTypeName ? _self.voucherTypeName : voucherTypeName // ignore: cast_nullable_to_non_nullable
as String?,isTax: freezed == isTax ? _self.isTax : isTax // ignore: cast_nullable_to_non_nullable
as bool?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,entryDate: freezed == entryDate ? _self.entryDate : entryDate // ignore: cast_nullable_to_non_nullable
as String?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,extra1: freezed == extra1 ? _self.extra1 : extra1 // ignore: cast_nullable_to_non_nullable
as String?,extra2: freezed == extra2 ? _self.extra2 : extra2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
