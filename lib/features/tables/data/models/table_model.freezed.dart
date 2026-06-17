// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'table_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TableModel {

 int get tableID; String get tableNumber; int get capacity; int get floorID; String get floorName; String get status; bool get isActive; String? get qrToken;
/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TableModelCopyWith<TableModel> get copyWith => _$TableModelCopyWithImpl<TableModel>(this as TableModel, _$identity);

  /// Serializes this TableModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TableModel&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.floorID, floorID) || other.floorID == floorID)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.qrToken, qrToken) || other.qrToken == qrToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableID,tableNumber,capacity,floorID,floorName,status,isActive,qrToken);

@override
String toString() {
  return 'TableModel(tableID: $tableID, tableNumber: $tableNumber, capacity: $capacity, floorID: $floorID, floorName: $floorName, status: $status, isActive: $isActive, qrToken: $qrToken)';
}


}

/// @nodoc
abstract mixin class $TableModelCopyWith<$Res>  {
  factory $TableModelCopyWith(TableModel value, $Res Function(TableModel) _then) = _$TableModelCopyWithImpl;
@useResult
$Res call({
 int tableID, String tableNumber, int capacity, int floorID, String floorName, String status, bool isActive, String? qrToken
});




}
/// @nodoc
class _$TableModelCopyWithImpl<$Res>
    implements $TableModelCopyWith<$Res> {
  _$TableModelCopyWithImpl(this._self, this._then);

  final TableModel _self;
  final $Res Function(TableModel) _then;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tableID = null,Object? tableNumber = null,Object? capacity = null,Object? floorID = null,Object? floorName = null,Object? status = null,Object? isActive = null,Object? qrToken = freezed,}) {
  return _then(_self.copyWith(
tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,floorID: null == floorID ? _self.floorID : floorID // ignore: cast_nullable_to_non_nullable
as int,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,qrToken: freezed == qrToken ? _self.qrToken : qrToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TableModel].
extension TableModelPatterns on TableModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TableModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TableModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TableModel value)  $default,){
final _that = this;
switch (_that) {
case _TableModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TableModel value)?  $default,){
final _that = this;
switch (_that) {
case _TableModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int tableID,  String tableNumber,  int capacity,  int floorID,  String floorName,  String status,  bool isActive,  String? qrToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TableModel() when $default != null:
return $default(_that.tableID,_that.tableNumber,_that.capacity,_that.floorID,_that.floorName,_that.status,_that.isActive,_that.qrToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int tableID,  String tableNumber,  int capacity,  int floorID,  String floorName,  String status,  bool isActive,  String? qrToken)  $default,) {final _that = this;
switch (_that) {
case _TableModel():
return $default(_that.tableID,_that.tableNumber,_that.capacity,_that.floorID,_that.floorName,_that.status,_that.isActive,_that.qrToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int tableID,  String tableNumber,  int capacity,  int floorID,  String floorName,  String status,  bool isActive,  String? qrToken)?  $default,) {final _that = this;
switch (_that) {
case _TableModel() when $default != null:
return $default(_that.tableID,_that.tableNumber,_that.capacity,_that.floorID,_that.floorName,_that.status,_that.isActive,_that.qrToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TableModel implements TableModel {
  const _TableModel({required this.tableID, required this.tableNumber, required this.capacity, required this.floorID, required this.floorName, required this.status, required this.isActive, this.qrToken});
  factory _TableModel.fromJson(Map<String, dynamic> json) => _$TableModelFromJson(json);

@override final  int tableID;
@override final  String tableNumber;
@override final  int capacity;
@override final  int floorID;
@override final  String floorName;
@override final  String status;
@override final  bool isActive;
@override final  String? qrToken;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TableModelCopyWith<_TableModel> get copyWith => __$TableModelCopyWithImpl<_TableModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TableModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TableModel&&(identical(other.tableID, tableID) || other.tableID == tableID)&&(identical(other.tableNumber, tableNumber) || other.tableNumber == tableNumber)&&(identical(other.capacity, capacity) || other.capacity == capacity)&&(identical(other.floorID, floorID) || other.floorID == floorID)&&(identical(other.floorName, floorName) || other.floorName == floorName)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.qrToken, qrToken) || other.qrToken == qrToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tableID,tableNumber,capacity,floorID,floorName,status,isActive,qrToken);

@override
String toString() {
  return 'TableModel(tableID: $tableID, tableNumber: $tableNumber, capacity: $capacity, floorID: $floorID, floorName: $floorName, status: $status, isActive: $isActive, qrToken: $qrToken)';
}


}

/// @nodoc
abstract mixin class _$TableModelCopyWith<$Res> implements $TableModelCopyWith<$Res> {
  factory _$TableModelCopyWith(_TableModel value, $Res Function(_TableModel) _then) = __$TableModelCopyWithImpl;
@override @useResult
$Res call({
 int tableID, String tableNumber, int capacity, int floorID, String floorName, String status, bool isActive, String? qrToken
});




}
/// @nodoc
class __$TableModelCopyWithImpl<$Res>
    implements _$TableModelCopyWith<$Res> {
  __$TableModelCopyWithImpl(this._self, this._then);

  final _TableModel _self;
  final $Res Function(_TableModel) _then;

/// Create a copy of TableModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tableID = null,Object? tableNumber = null,Object? capacity = null,Object? floorID = null,Object? floorName = null,Object? status = null,Object? isActive = null,Object? qrToken = freezed,}) {
  return _then(_TableModel(
tableID: null == tableID ? _self.tableID : tableID // ignore: cast_nullable_to_non_nullable
as int,tableNumber: null == tableNumber ? _self.tableNumber : tableNumber // ignore: cast_nullable_to_non_nullable
as String,capacity: null == capacity ? _self.capacity : capacity // ignore: cast_nullable_to_non_nullable
as int,floorID: null == floorID ? _self.floorID : floorID // ignore: cast_nullable_to_non_nullable
as int,floorName: null == floorName ? _self.floorName : floorName // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,qrToken: freezed == qrToken ? _self.qrToken : qrToken // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
