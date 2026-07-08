// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prefix_suffix_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrefixSuffixResponse {

 bool get succeeded; String? get messages; List<PrefixSuffixModel>? get data;
/// Create a copy of PrefixSuffixResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrefixSuffixResponseCopyWith<PrefixSuffixResponse> get copyWith => _$PrefixSuffixResponseCopyWithImpl<PrefixSuffixResponse>(this as PrefixSuffixResponse, _$identity);

  /// Serializes this PrefixSuffixResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrefixSuffixResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'PrefixSuffixResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $PrefixSuffixResponseCopyWith<$Res>  {
  factory $PrefixSuffixResponseCopyWith(PrefixSuffixResponse value, $Res Function(PrefixSuffixResponse) _then) = _$PrefixSuffixResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String? messages, List<PrefixSuffixModel>? data
});




}
/// @nodoc
class _$PrefixSuffixResponseCopyWithImpl<$Res>
    implements $PrefixSuffixResponseCopyWith<$Res> {
  _$PrefixSuffixResponseCopyWithImpl(this._self, this._then);

  final PrefixSuffixResponse _self;
  final $Res Function(PrefixSuffixResponse) _then;

/// Create a copy of PrefixSuffixResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<PrefixSuffixModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrefixSuffixResponse].
extension PrefixSuffixResponsePatterns on PrefixSuffixResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrefixSuffixResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrefixSuffixResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrefixSuffixResponse value)  $default,){
final _that = this;
switch (_that) {
case _PrefixSuffixResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrefixSuffixResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PrefixSuffixResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<PrefixSuffixModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrefixSuffixResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String? messages,  List<PrefixSuffixModel>? data)  $default,) {final _that = this;
switch (_that) {
case _PrefixSuffixResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String? messages,  List<PrefixSuffixModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _PrefixSuffixResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrefixSuffixResponse implements PrefixSuffixResponse {
  const _PrefixSuffixResponse({this.succeeded = false, this.messages, final  List<PrefixSuffixModel>? data}): _data = data;
  factory _PrefixSuffixResponse.fromJson(Map<String, dynamic> json) => _$PrefixSuffixResponseFromJson(json);

@override@JsonKey() final  bool succeeded;
@override final  String? messages;
 final  List<PrefixSuffixModel>? _data;
@override List<PrefixSuffixModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of PrefixSuffixResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrefixSuffixResponseCopyWith<_PrefixSuffixResponse> get copyWith => __$PrefixSuffixResponseCopyWithImpl<_PrefixSuffixResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrefixSuffixResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrefixSuffixResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'PrefixSuffixResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$PrefixSuffixResponseCopyWith<$Res> implements $PrefixSuffixResponseCopyWith<$Res> {
  factory _$PrefixSuffixResponseCopyWith(_PrefixSuffixResponse value, $Res Function(_PrefixSuffixResponse) _then) = __$PrefixSuffixResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String? messages, List<PrefixSuffixModel>? data
});




}
/// @nodoc
class __$PrefixSuffixResponseCopyWithImpl<$Res>
    implements _$PrefixSuffixResponseCopyWith<$Res> {
  __$PrefixSuffixResponseCopyWithImpl(this._self, this._then);

  final _PrefixSuffixResponse _self;
  final $Res Function(_PrefixSuffixResponse) _then;

/// Create a copy of PrefixSuffixResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = freezed,Object? data = freezed,}) {
  return _then(_PrefixSuffixResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: freezed == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<PrefixSuffixModel>?,
  ));
}


}


/// @nodoc
mixin _$PrefixSuffixModel {

 int? get prefixSuffixID; int? get voucherTypeID; int? get financialYearID; double? get startIndex; double? get updatedIndex; String? get prefix; String? get suffix; String? get narration; bool? get status; int? get createdBy; String? get createdDate; String? get extra1; String? get extra2;
/// Create a copy of PrefixSuffixModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PrefixSuffixModelCopyWith<PrefixSuffixModel> get copyWith => _$PrefixSuffixModelCopyWithImpl<PrefixSuffixModel>(this as PrefixSuffixModel, _$identity);

  /// Serializes this PrefixSuffixModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PrefixSuffixModel&&(identical(other.prefixSuffixID, prefixSuffixID) || other.prefixSuffixID == prefixSuffixID)&&(identical(other.voucherTypeID, voucherTypeID) || other.voucherTypeID == voucherTypeID)&&(identical(other.financialYearID, financialYearID) || other.financialYearID == financialYearID)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.updatedIndex, updatedIndex) || other.updatedIndex == updatedIndex)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.extra1, extra1) || other.extra1 == extra1)&&(identical(other.extra2, extra2) || other.extra2 == extra2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prefixSuffixID,voucherTypeID,financialYearID,startIndex,updatedIndex,prefix,suffix,narration,status,createdBy,createdDate,extra1,extra2);

@override
String toString() {
  return 'PrefixSuffixModel(prefixSuffixID: $prefixSuffixID, voucherTypeID: $voucherTypeID, financialYearID: $financialYearID, startIndex: $startIndex, updatedIndex: $updatedIndex, prefix: $prefix, suffix: $suffix, narration: $narration, status: $status, createdBy: $createdBy, createdDate: $createdDate, extra1: $extra1, extra2: $extra2)';
}


}

/// @nodoc
abstract mixin class $PrefixSuffixModelCopyWith<$Res>  {
  factory $PrefixSuffixModelCopyWith(PrefixSuffixModel value, $Res Function(PrefixSuffixModel) _then) = _$PrefixSuffixModelCopyWithImpl;
@useResult
$Res call({
 int? prefixSuffixID, int? voucherTypeID, int? financialYearID, double? startIndex, double? updatedIndex, String? prefix, String? suffix, String? narration, bool? status, int? createdBy, String? createdDate, String? extra1, String? extra2
});




}
/// @nodoc
class _$PrefixSuffixModelCopyWithImpl<$Res>
    implements $PrefixSuffixModelCopyWith<$Res> {
  _$PrefixSuffixModelCopyWithImpl(this._self, this._then);

  final PrefixSuffixModel _self;
  final $Res Function(PrefixSuffixModel) _then;

/// Create a copy of PrefixSuffixModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? prefixSuffixID = freezed,Object? voucherTypeID = freezed,Object? financialYearID = freezed,Object? startIndex = freezed,Object? updatedIndex = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? narration = freezed,Object? status = freezed,Object? createdBy = freezed,Object? createdDate = freezed,Object? extra1 = freezed,Object? extra2 = freezed,}) {
  return _then(_self.copyWith(
prefixSuffixID: freezed == prefixSuffixID ? _self.prefixSuffixID : prefixSuffixID // ignore: cast_nullable_to_non_nullable
as int?,voucherTypeID: freezed == voucherTypeID ? _self.voucherTypeID : voucherTypeID // ignore: cast_nullable_to_non_nullable
as int?,financialYearID: freezed == financialYearID ? _self.financialYearID : financialYearID // ignore: cast_nullable_to_non_nullable
as int?,startIndex: freezed == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as double?,updatedIndex: freezed == updatedIndex ? _self.updatedIndex : updatedIndex // ignore: cast_nullable_to_non_nullable
as double?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,extra1: freezed == extra1 ? _self.extra1 : extra1 // ignore: cast_nullable_to_non_nullable
as String?,extra2: freezed == extra2 ? _self.extra2 : extra2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PrefixSuffixModel].
extension PrefixSuffixModelPatterns on PrefixSuffixModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PrefixSuffixModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PrefixSuffixModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PrefixSuffixModel value)  $default,){
final _that = this;
switch (_that) {
case _PrefixSuffixModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PrefixSuffixModel value)?  $default,){
final _that = this;
switch (_that) {
case _PrefixSuffixModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? prefixSuffixID,  int? voucherTypeID,  int? financialYearID,  double? startIndex,  double? updatedIndex,  String? prefix,  String? suffix,  String? narration,  bool? status,  int? createdBy,  String? createdDate,  String? extra1,  String? extra2)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PrefixSuffixModel() when $default != null:
return $default(_that.prefixSuffixID,_that.voucherTypeID,_that.financialYearID,_that.startIndex,_that.updatedIndex,_that.prefix,_that.suffix,_that.narration,_that.status,_that.createdBy,_that.createdDate,_that.extra1,_that.extra2);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? prefixSuffixID,  int? voucherTypeID,  int? financialYearID,  double? startIndex,  double? updatedIndex,  String? prefix,  String? suffix,  String? narration,  bool? status,  int? createdBy,  String? createdDate,  String? extra1,  String? extra2)  $default,) {final _that = this;
switch (_that) {
case _PrefixSuffixModel():
return $default(_that.prefixSuffixID,_that.voucherTypeID,_that.financialYearID,_that.startIndex,_that.updatedIndex,_that.prefix,_that.suffix,_that.narration,_that.status,_that.createdBy,_that.createdDate,_that.extra1,_that.extra2);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? prefixSuffixID,  int? voucherTypeID,  int? financialYearID,  double? startIndex,  double? updatedIndex,  String? prefix,  String? suffix,  String? narration,  bool? status,  int? createdBy,  String? createdDate,  String? extra1,  String? extra2)?  $default,) {final _that = this;
switch (_that) {
case _PrefixSuffixModel() when $default != null:
return $default(_that.prefixSuffixID,_that.voucherTypeID,_that.financialYearID,_that.startIndex,_that.updatedIndex,_that.prefix,_that.suffix,_that.narration,_that.status,_that.createdBy,_that.createdDate,_that.extra1,_that.extra2);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PrefixSuffixModel implements PrefixSuffixModel {
  const _PrefixSuffixModel({this.prefixSuffixID, this.voucherTypeID, this.financialYearID, this.startIndex, this.updatedIndex, this.prefix, this.suffix, this.narration, this.status, this.createdBy, this.createdDate, this.extra1, this.extra2});
  factory _PrefixSuffixModel.fromJson(Map<String, dynamic> json) => _$PrefixSuffixModelFromJson(json);

@override final  int? prefixSuffixID;
@override final  int? voucherTypeID;
@override final  int? financialYearID;
@override final  double? startIndex;
@override final  double? updatedIndex;
@override final  String? prefix;
@override final  String? suffix;
@override final  String? narration;
@override final  bool? status;
@override final  int? createdBy;
@override final  String? createdDate;
@override final  String? extra1;
@override final  String? extra2;

/// Create a copy of PrefixSuffixModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PrefixSuffixModelCopyWith<_PrefixSuffixModel> get copyWith => __$PrefixSuffixModelCopyWithImpl<_PrefixSuffixModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PrefixSuffixModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PrefixSuffixModel&&(identical(other.prefixSuffixID, prefixSuffixID) || other.prefixSuffixID == prefixSuffixID)&&(identical(other.voucherTypeID, voucherTypeID) || other.voucherTypeID == voucherTypeID)&&(identical(other.financialYearID, financialYearID) || other.financialYearID == financialYearID)&&(identical(other.startIndex, startIndex) || other.startIndex == startIndex)&&(identical(other.updatedIndex, updatedIndex) || other.updatedIndex == updatedIndex)&&(identical(other.prefix, prefix) || other.prefix == prefix)&&(identical(other.suffix, suffix) || other.suffix == suffix)&&(identical(other.narration, narration) || other.narration == narration)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.extra1, extra1) || other.extra1 == extra1)&&(identical(other.extra2, extra2) || other.extra2 == extra2));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,prefixSuffixID,voucherTypeID,financialYearID,startIndex,updatedIndex,prefix,suffix,narration,status,createdBy,createdDate,extra1,extra2);

@override
String toString() {
  return 'PrefixSuffixModel(prefixSuffixID: $prefixSuffixID, voucherTypeID: $voucherTypeID, financialYearID: $financialYearID, startIndex: $startIndex, updatedIndex: $updatedIndex, prefix: $prefix, suffix: $suffix, narration: $narration, status: $status, createdBy: $createdBy, createdDate: $createdDate, extra1: $extra1, extra2: $extra2)';
}


}

/// @nodoc
abstract mixin class _$PrefixSuffixModelCopyWith<$Res> implements $PrefixSuffixModelCopyWith<$Res> {
  factory _$PrefixSuffixModelCopyWith(_PrefixSuffixModel value, $Res Function(_PrefixSuffixModel) _then) = __$PrefixSuffixModelCopyWithImpl;
@override @useResult
$Res call({
 int? prefixSuffixID, int? voucherTypeID, int? financialYearID, double? startIndex, double? updatedIndex, String? prefix, String? suffix, String? narration, bool? status, int? createdBy, String? createdDate, String? extra1, String? extra2
});




}
/// @nodoc
class __$PrefixSuffixModelCopyWithImpl<$Res>
    implements _$PrefixSuffixModelCopyWith<$Res> {
  __$PrefixSuffixModelCopyWithImpl(this._self, this._then);

  final _PrefixSuffixModel _self;
  final $Res Function(_PrefixSuffixModel) _then;

/// Create a copy of PrefixSuffixModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? prefixSuffixID = freezed,Object? voucherTypeID = freezed,Object? financialYearID = freezed,Object? startIndex = freezed,Object? updatedIndex = freezed,Object? prefix = freezed,Object? suffix = freezed,Object? narration = freezed,Object? status = freezed,Object? createdBy = freezed,Object? createdDate = freezed,Object? extra1 = freezed,Object? extra2 = freezed,}) {
  return _then(_PrefixSuffixModel(
prefixSuffixID: freezed == prefixSuffixID ? _self.prefixSuffixID : prefixSuffixID // ignore: cast_nullable_to_non_nullable
as int?,voucherTypeID: freezed == voucherTypeID ? _self.voucherTypeID : voucherTypeID // ignore: cast_nullable_to_non_nullable
as int?,financialYearID: freezed == financialYearID ? _self.financialYearID : financialYearID // ignore: cast_nullable_to_non_nullable
as int?,startIndex: freezed == startIndex ? _self.startIndex : startIndex // ignore: cast_nullable_to_non_nullable
as double?,updatedIndex: freezed == updatedIndex ? _self.updatedIndex : updatedIndex // ignore: cast_nullable_to_non_nullable
as double?,prefix: freezed == prefix ? _self.prefix : prefix // ignore: cast_nullable_to_non_nullable
as String?,suffix: freezed == suffix ? _self.suffix : suffix // ignore: cast_nullable_to_non_nullable
as String?,narration: freezed == narration ? _self.narration : narration // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as bool?,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as int?,createdDate: freezed == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as String?,extra1: freezed == extra1 ? _self.extra1 : extra1 // ignore: cast_nullable_to_non_nullable
as String?,extra2: freezed == extra2 ? _self.extra2 : extra2 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
