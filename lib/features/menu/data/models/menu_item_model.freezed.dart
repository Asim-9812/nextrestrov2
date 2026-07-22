// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MenuItemModel {

 int get categoryID; String get categoryName; String? get image; int get itemID; String get itemName; double get price; int get subCategoryID; String get subCategoryName;
/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuItemModelCopyWith<MenuItemModel> get copyWith => _$MenuItemModelCopyWithImpl<MenuItemModel>(this as MenuItemModel, _$identity);

  /// Serializes this MenuItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuItemModel&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.image, image) || other.image == image)&&(identical(other.itemID, itemID) || other.itemID == itemID)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.price, price) || other.price == price)&&(identical(other.subCategoryID, subCategoryID) || other.subCategoryID == subCategoryID)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName,image,itemID,itemName,price,subCategoryID,subCategoryName);

@override
String toString() {
  return 'MenuItemModel(categoryID: $categoryID, categoryName: $categoryName, image: $image, itemID: $itemID, itemName: $itemName, price: $price, subCategoryID: $subCategoryID, subCategoryName: $subCategoryName)';
}


}

/// @nodoc
abstract mixin class $MenuItemModelCopyWith<$Res>  {
  factory $MenuItemModelCopyWith(MenuItemModel value, $Res Function(MenuItemModel) _then) = _$MenuItemModelCopyWithImpl;
@useResult
$Res call({
 int categoryID, String categoryName, String? image, int itemID, String itemName, double price, int subCategoryID, String subCategoryName
});




}
/// @nodoc
class _$MenuItemModelCopyWithImpl<$Res>
    implements $MenuItemModelCopyWith<$Res> {
  _$MenuItemModelCopyWithImpl(this._self, this._then);

  final MenuItemModel _self;
  final $Res Function(MenuItemModel) _then;

/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryID = null,Object? categoryName = null,Object? image = freezed,Object? itemID = null,Object? itemName = null,Object? price = null,Object? subCategoryID = null,Object? subCategoryName = null,}) {
  return _then(_self.copyWith(
categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,itemID: null == itemID ? _self.itemID : itemID // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,subCategoryID: null == subCategoryID ? _self.subCategoryID : subCategoryID // ignore: cast_nullable_to_non_nullable
as int,subCategoryName: null == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuItemModel].
extension MenuItemModelPatterns on MenuItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuItemModel value)  $default,){
final _that = this;
switch (_that) {
case _MenuItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryID,  String categoryName,  String? image,  int itemID,  String itemName,  double price,  int subCategoryID,  String subCategoryName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
return $default(_that.categoryID,_that.categoryName,_that.image,_that.itemID,_that.itemName,_that.price,_that.subCategoryID,_that.subCategoryName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryID,  String categoryName,  String? image,  int itemID,  String itemName,  double price,  int subCategoryID,  String subCategoryName)  $default,) {final _that = this;
switch (_that) {
case _MenuItemModel():
return $default(_that.categoryID,_that.categoryName,_that.image,_that.itemID,_that.itemName,_that.price,_that.subCategoryID,_that.subCategoryName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryID,  String categoryName,  String? image,  int itemID,  String itemName,  double price,  int subCategoryID,  String subCategoryName)?  $default,) {final _that = this;
switch (_that) {
case _MenuItemModel() when $default != null:
return $default(_that.categoryID,_that.categoryName,_that.image,_that.itemID,_that.itemName,_that.price,_that.subCategoryID,_that.subCategoryName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MenuItemModel implements MenuItemModel {
  const _MenuItemModel({required this.categoryID, required this.categoryName, this.image, required this.itemID, required this.itemName, required this.price, required this.subCategoryID, required this.subCategoryName});
  factory _MenuItemModel.fromJson(Map<String, dynamic> json) => _$MenuItemModelFromJson(json);

@override final  int categoryID;
@override final  String categoryName;
@override final  String? image;
@override final  int itemID;
@override final  String itemName;
@override final  double price;
@override final  int subCategoryID;
@override final  String subCategoryName;

/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuItemModelCopyWith<_MenuItemModel> get copyWith => __$MenuItemModelCopyWithImpl<_MenuItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MenuItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuItemModel&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.image, image) || other.image == image)&&(identical(other.itemID, itemID) || other.itemID == itemID)&&(identical(other.itemName, itemName) || other.itemName == itemName)&&(identical(other.price, price) || other.price == price)&&(identical(other.subCategoryID, subCategoryID) || other.subCategoryID == subCategoryID)&&(identical(other.subCategoryName, subCategoryName) || other.subCategoryName == subCategoryName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName,image,itemID,itemName,price,subCategoryID,subCategoryName);

@override
String toString() {
  return 'MenuItemModel(categoryID: $categoryID, categoryName: $categoryName, image: $image, itemID: $itemID, itemName: $itemName, price: $price, subCategoryID: $subCategoryID, subCategoryName: $subCategoryName)';
}


}

/// @nodoc
abstract mixin class _$MenuItemModelCopyWith<$Res> implements $MenuItemModelCopyWith<$Res> {
  factory _$MenuItemModelCopyWith(_MenuItemModel value, $Res Function(_MenuItemModel) _then) = __$MenuItemModelCopyWithImpl;
@override @useResult
$Res call({
 int categoryID, String categoryName, String? image, int itemID, String itemName, double price, int subCategoryID, String subCategoryName
});




}
/// @nodoc
class __$MenuItemModelCopyWithImpl<$Res>
    implements _$MenuItemModelCopyWith<$Res> {
  __$MenuItemModelCopyWithImpl(this._self, this._then);

  final _MenuItemModel _self;
  final $Res Function(_MenuItemModel) _then;

/// Create a copy of MenuItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryID = null,Object? categoryName = null,Object? image = freezed,Object? itemID = null,Object? itemName = null,Object? price = null,Object? subCategoryID = null,Object? subCategoryName = null,}) {
  return _then(_MenuItemModel(
categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,itemID: null == itemID ? _self.itemID : itemID // ignore: cast_nullable_to_non_nullable
as int,itemName: null == itemName ? _self.itemName : itemName // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as double,subCategoryID: null == subCategoryID ? _self.subCategoryID : subCategoryID // ignore: cast_nullable_to_non_nullable
as int,subCategoryName: null == subCategoryName ? _self.subCategoryName : subCategoryName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
