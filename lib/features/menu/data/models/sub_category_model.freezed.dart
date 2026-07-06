// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sub_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubCategoryResponse {

 bool get succeeded; String get messages; List<SubCategoryModel> get data;
/// Create a copy of SubCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubCategoryResponseCopyWith<SubCategoryResponse> get copyWith => _$SubCategoryResponseCopyWithImpl<SubCategoryResponse>(this as SubCategoryResponse, _$identity);

  /// Serializes this SubCategoryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubCategoryResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'SubCategoryResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class $SubCategoryResponseCopyWith<$Res>  {
  factory $SubCategoryResponseCopyWith(SubCategoryResponse value, $Res Function(SubCategoryResponse) _then) = _$SubCategoryResponseCopyWithImpl;
@useResult
$Res call({
 bool succeeded, String messages, List<SubCategoryModel> data
});




}
/// @nodoc
class _$SubCategoryResponseCopyWithImpl<$Res>
    implements $SubCategoryResponseCopyWith<$Res> {
  _$SubCategoryResponseCopyWithImpl(this._self, this._then);

  final SubCategoryResponse _self;
  final $Res Function(SubCategoryResponse) _then;

/// Create a copy of SubCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? succeeded = null,Object? messages = null,Object? data = null,}) {
  return _then(_self.copyWith(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<SubCategoryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [SubCategoryResponse].
extension SubCategoryResponsePatterns on SubCategoryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubCategoryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubCategoryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubCategoryResponse value)  $default,){
final _that = this;
switch (_that) {
case _SubCategoryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubCategoryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SubCategoryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool succeeded,  String messages,  List<SubCategoryModel> data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubCategoryResponse() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool succeeded,  String messages,  List<SubCategoryModel> data)  $default,) {final _that = this;
switch (_that) {
case _SubCategoryResponse():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool succeeded,  String messages,  List<SubCategoryModel> data)?  $default,) {final _that = this;
switch (_that) {
case _SubCategoryResponse() when $default != null:
return $default(_that.succeeded,_that.messages,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubCategoryResponse implements SubCategoryResponse {
  const _SubCategoryResponse({required this.succeeded, required this.messages, required final  List<SubCategoryModel> data}): _data = data;
  factory _SubCategoryResponse.fromJson(Map<String, dynamic> json) => _$SubCategoryResponseFromJson(json);

@override final  bool succeeded;
@override final  String messages;
 final  List<SubCategoryModel> _data;
@override List<SubCategoryModel> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}


/// Create a copy of SubCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubCategoryResponseCopyWith<_SubCategoryResponse> get copyWith => __$SubCategoryResponseCopyWithImpl<_SubCategoryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubCategoryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubCategoryResponse&&(identical(other.succeeded, succeeded) || other.succeeded == succeeded)&&(identical(other.messages, messages) || other.messages == messages)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,succeeded,messages,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'SubCategoryResponse(succeeded: $succeeded, messages: $messages, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SubCategoryResponseCopyWith<$Res> implements $SubCategoryResponseCopyWith<$Res> {
  factory _$SubCategoryResponseCopyWith(_SubCategoryResponse value, $Res Function(_SubCategoryResponse) _then) = __$SubCategoryResponseCopyWithImpl;
@override @useResult
$Res call({
 bool succeeded, String messages, List<SubCategoryModel> data
});




}
/// @nodoc
class __$SubCategoryResponseCopyWithImpl<$Res>
    implements _$SubCategoryResponseCopyWith<$Res> {
  __$SubCategoryResponseCopyWithImpl(this._self, this._then);

  final _SubCategoryResponse _self;
  final $Res Function(_SubCategoryResponse) _then;

/// Create a copy of SubCategoryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? succeeded = null,Object? messages = null,Object? data = null,}) {
  return _then(_SubCategoryResponse(
succeeded: null == succeeded ? _self.succeeded : succeeded // ignore: cast_nullable_to_non_nullable
as bool,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as String,data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<SubCategoryModel>,
  ));
}


}


/// @nodoc
mixin _$SubCategoryModel {

 int get subCategoryId; int get categoryId; String get subCategoryName; String? get categoryName;
/// Create a copy of SubCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubCategoryModelCopyWith<SubCategoryModel> get copyWith => _$SubCategoryModelCopyWithImpl<SubCategoryModel>(this as SubCategoryModel, _$identity);

  /// Serializes this SubCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubCategoryModel&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subCategoryId,categoryId,subCategoryName,categoryName);

@override
String toString() {
  return 'SubCategoryModel(subCategoryId: $subCategoryId, categoryId: $categoryId, subCategoryName: $subCategoryName, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class $SubCategoryModelCopyWith<$Res>  {
  factory $SubCategoryModelCopyWith(SubCategoryModel value, $Res Function(SubCategoryModel) _then) = _$SubCategoryModelCopyWithImpl;
@useResult
$Res call({
 int subCategoryId, int categoryId, String subCategoryName, String? categoryName
});




}
/// @nodoc
class _$SubCategoryModelCopyWithImpl<$Res>
    implements $SubCategoryModelCopyWith<$Res> {
  _$SubCategoryModelCopyWithImpl(this._self, this._then);

  final SubCategoryModel _self;
  final $Res Function(SubCategoryModel) _then;

/// Create a copy of SubCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? subCategoryId = null,Object? categoryId = null,Object? subCategoryName = null,Object? categoryName = freezed,}) {
  return _then(_self.copyWith(
subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,subCategoryName: null == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubCategoryModel].
extension SubCategoryModelPatterns on SubCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _SubCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int subCategoryId,  int categoryId,  String subCategoryName,  String? categoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubCategoryModel() when $default != null:
return $default(_that.subCategoryId,_that.categoryId,_that.subCategoryName,_that.categoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int subCategoryId,  int categoryId,  String subCategoryName,  String? categoryName)  $default,) {final _that = this;
switch (_that) {
case _SubCategoryModel():
return $default(_that.subCategoryId,_that.categoryId,_that.subCategoryName,_that.categoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int subCategoryId,  int categoryId,  String subCategoryName,  String? categoryName)?  $default,) {final _that = this;
switch (_that) {
case _SubCategoryModel() when $default != null:
return $default(_that.subCategoryId,_that.categoryId,_that.subCategoryName,_that.categoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubCategoryModel implements SubCategoryModel {
  const _SubCategoryModel({required this.subCategoryId, required this.categoryId, required this.subCategoryName, this.categoryName});
  factory _SubCategoryModel.fromJson(Map<String, dynamic> json) => _$SubCategoryModelFromJson(json);

@override final  int subCategoryId;
@override final  int categoryId;
@override final  String subCategoryName;
@override final  String? categoryName;

/// Create a copy of SubCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubCategoryModelCopyWith<_SubCategoryModel> get copyWith => __$SubCategoryModelCopyWithImpl<_SubCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubCategoryModel&&(identical(other.subCategoryId, subCategoryId) || other.subCategoryId == subCategoryId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,subCategoryId,categoryId,subCategoryName,categoryName);

@override
String toString() {
  return 'SubCategoryModel(subCategoryId: $subCategoryId, categoryId: $categoryId, subCategoryName: $subCategoryName, categoryName: $categoryName)';
}


}

/// @nodoc
abstract mixin class _$SubCategoryModelCopyWith<$Res> implements $SubCategoryModelCopyWith<$Res> {
  factory _$SubCategoryModelCopyWith(_SubCategoryModel value, $Res Function(_SubCategoryModel) _then) = __$SubCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int subCategoryId, int categoryId, String subCategoryName, String? categoryName
});




}
/// @nodoc
class __$SubCategoryModelCopyWithImpl<$Res>
    implements _$SubCategoryModelCopyWith<$Res> {
  __$SubCategoryModelCopyWithImpl(this._self, this._then);

  final _SubCategoryModel _self;
  final $Res Function(_SubCategoryModel) _then;

/// Create a copy of SubCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? subCategoryId = null,Object? categoryId = null,Object? subCategoryName = null,Object? categoryName = freezed,}) {
  return _then(_SubCategoryModel(
subCategoryId: null == subCategoryId ? _self.subCategoryId : subCategoryId // ignore: cast_nullable_to_non_nullable
as int,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int,subCategoryName: null == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
