// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DashboardSummaryRequest {

 String get fromDate; String get toDate;
/// Create a copy of DashboardSummaryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryRequestCopyWith<DashboardSummaryRequest> get copyWith => _$DashboardSummaryRequestCopyWithImpl<DashboardSummaryRequest>(this as DashboardSummaryRequest, _$identity);

  /// Serializes this DashboardSummaryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate);

@override
String toString() {
  return 'DashboardSummaryRequest(fromDate: $fromDate, toDate: $toDate)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryRequestCopyWith<$Res>  {
  factory $DashboardSummaryRequestCopyWith(DashboardSummaryRequest value, $Res Function(DashboardSummaryRequest) _then) = _$DashboardSummaryRequestCopyWithImpl;
@useResult
$Res call({
 String fromDate, String toDate
});




}
/// @nodoc
class _$DashboardSummaryRequestCopyWithImpl<$Res>
    implements $DashboardSummaryRequestCopyWith<$Res> {
  _$DashboardSummaryRequestCopyWithImpl(this._self, this._then);

  final DashboardSummaryRequest _self;
  final $Res Function(DashboardSummaryRequest) _then;

/// Create a copy of DashboardSummaryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fromDate = null,Object? toDate = null,}) {
  return _then(_self.copyWith(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummaryRequest].
extension DashboardSummaryRequestPatterns on DashboardSummaryRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryRequest value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String fromDate,  String toDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryRequest() when $default != null:
return $default(_that.fromDate,_that.toDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String fromDate,  String toDate)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryRequest():
return $default(_that.fromDate,_that.toDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String fromDate,  String toDate)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryRequest() when $default != null:
return $default(_that.fromDate,_that.toDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryRequest implements DashboardSummaryRequest {
  const _DashboardSummaryRequest({required this.fromDate, required this.toDate});
  factory _DashboardSummaryRequest.fromJson(Map<String, dynamic> json) => _$DashboardSummaryRequestFromJson(json);

@override final  String fromDate;
@override final  String toDate;

/// Create a copy of DashboardSummaryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryRequestCopyWith<_DashboardSummaryRequest> get copyWith => __$DashboardSummaryRequestCopyWithImpl<_DashboardSummaryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryRequest&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fromDate,toDate);

@override
String toString() {
  return 'DashboardSummaryRequest(fromDate: $fromDate, toDate: $toDate)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryRequestCopyWith<$Res> implements $DashboardSummaryRequestCopyWith<$Res> {
  factory _$DashboardSummaryRequestCopyWith(_DashboardSummaryRequest value, $Res Function(_DashboardSummaryRequest) _then) = __$DashboardSummaryRequestCopyWithImpl;
@override @useResult
$Res call({
 String fromDate, String toDate
});




}
/// @nodoc
class __$DashboardSummaryRequestCopyWithImpl<$Res>
    implements _$DashboardSummaryRequestCopyWith<$Res> {
  __$DashboardSummaryRequestCopyWithImpl(this._self, this._then);

  final _DashboardSummaryRequest _self;
  final $Res Function(_DashboardSummaryRequest) _then;

/// Create a copy of DashboardSummaryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fromDate = null,Object? toDate = null,}) {
  return _then(_DashboardSummaryRequest(
fromDate: null == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as String,toDate: null == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DashboardSummaryModel {

 double get totalSales; int get totalBills; int get totalCustomers; double get averageBill; double get cashSales; double get cardSales; double get qrSales; double get creditSales; List<TopSellingProduct> get topSellingProducts; List<TopSellingCategory> get topSellingCategories;
/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<DashboardSummaryModel> get copyWith => _$DashboardSummaryModelCopyWithImpl<DashboardSummaryModel>(this as DashboardSummaryModel, _$identity);

  /// Serializes this DashboardSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardSummaryModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.averageBill, averageBill) || other.averageBill == averageBill)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.cardSales, cardSales) || other.cardSales == cardSales)&&(identical(other.qrSales, qrSales) || other.qrSales == qrSales)&&(identical(other.creditSales, creditSales) || other.creditSales == creditSales)&&const DeepCollectionEquality().equals(other.topSellingProducts, topSellingProducts)&&const DeepCollectionEquality().equals(other.topSellingCategories, topSellingCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalBills,totalCustomers,averageBill,cashSales,cardSales,qrSales,creditSales,const DeepCollectionEquality().hash(topSellingProducts),const DeepCollectionEquality().hash(topSellingCategories));

@override
String toString() {
  return 'DashboardSummaryModel(totalSales: $totalSales, totalBills: $totalBills, totalCustomers: $totalCustomers, averageBill: $averageBill, cashSales: $cashSales, cardSales: $cardSales, qrSales: $qrSales, creditSales: $creditSales, topSellingProducts: $topSellingProducts, topSellingCategories: $topSellingCategories)';
}


}

/// @nodoc
abstract mixin class $DashboardSummaryModelCopyWith<$Res>  {
  factory $DashboardSummaryModelCopyWith(DashboardSummaryModel value, $Res Function(DashboardSummaryModel) _then) = _$DashboardSummaryModelCopyWithImpl;
@useResult
$Res call({
 double totalSales, int totalBills, int totalCustomers, double averageBill, double cashSales, double cardSales, double qrSales, double creditSales, List<TopSellingProduct> topSellingProducts, List<TopSellingCategory> topSellingCategories
});




}
/// @nodoc
class _$DashboardSummaryModelCopyWithImpl<$Res>
    implements $DashboardSummaryModelCopyWith<$Res> {
  _$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final DashboardSummaryModel _self;
  final $Res Function(DashboardSummaryModel) _then;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalSales = null,Object? totalBills = null,Object? totalCustomers = null,Object? averageBill = null,Object? cashSales = null,Object? cardSales = null,Object? qrSales = null,Object? creditSales = null,Object? topSellingProducts = null,Object? topSellingCategories = null,}) {
  return _then(_self.copyWith(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,totalCustomers: null == totalCustomers ? _self.totalCustomers : totalCustomers // ignore: cast_nullable_to_non_nullable
as int,averageBill: null == averageBill ? _self.averageBill : averageBill // ignore: cast_nullable_to_non_nullable
as double,cashSales: null == cashSales ? _self.cashSales : cashSales // ignore: cast_nullable_to_non_nullable
as double,cardSales: null == cardSales ? _self.cardSales : cardSales // ignore: cast_nullable_to_non_nullable
as double,qrSales: null == qrSales ? _self.qrSales : qrSales // ignore: cast_nullable_to_non_nullable
as double,creditSales: null == creditSales ? _self.creditSales : creditSales // ignore: cast_nullable_to_non_nullable
as double,topSellingProducts: null == topSellingProducts ? _self.topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProduct>,topSellingCategories: null == topSellingCategories ? _self.topSellingCategories : topSellingCategories // ignore: cast_nullable_to_non_nullable
as List<TopSellingCategory>,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardSummaryModel].
extension DashboardSummaryModelPatterns on DashboardSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double totalSales,  int totalBills,  int totalCustomers,  double averageBill,  double cashSales,  double cardSales,  double qrSales,  double creditSales,  List<TopSellingProduct> topSellingProducts,  List<TopSellingCategory> topSellingCategories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
return $default(_that.totalSales,_that.totalBills,_that.totalCustomers,_that.averageBill,_that.cashSales,_that.cardSales,_that.qrSales,_that.creditSales,_that.topSellingProducts,_that.topSellingCategories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double totalSales,  int totalBills,  int totalCustomers,  double averageBill,  double cashSales,  double cardSales,  double qrSales,  double creditSales,  List<TopSellingProduct> topSellingProducts,  List<TopSellingCategory> topSellingCategories)  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryModel():
return $default(_that.totalSales,_that.totalBills,_that.totalCustomers,_that.averageBill,_that.cashSales,_that.cardSales,_that.qrSales,_that.creditSales,_that.topSellingProducts,_that.topSellingCategories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double totalSales,  int totalBills,  int totalCustomers,  double averageBill,  double cashSales,  double cardSales,  double qrSales,  double creditSales,  List<TopSellingProduct> topSellingProducts,  List<TopSellingCategory> topSellingCategories)?  $default,) {final _that = this;
switch (_that) {
case _DashboardSummaryModel() when $default != null:
return $default(_that.totalSales,_that.totalBills,_that.totalCustomers,_that.averageBill,_that.cashSales,_that.cardSales,_that.qrSales,_that.creditSales,_that.topSellingProducts,_that.topSellingCategories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DashboardSummaryModel implements DashboardSummaryModel {
  const _DashboardSummaryModel({this.totalSales = 0.0, this.totalBills = 0, this.totalCustomers = 0, this.averageBill = 0.0, this.cashSales = 0.0, this.cardSales = 0.0, this.qrSales = 0.0, this.creditSales = 0.0, final  List<TopSellingProduct> topSellingProducts = const [], final  List<TopSellingCategory> topSellingCategories = const []}): _topSellingProducts = topSellingProducts,_topSellingCategories = topSellingCategories;
  factory _DashboardSummaryModel.fromJson(Map<String, dynamic> json) => _$DashboardSummaryModelFromJson(json);

@override@JsonKey() final  double totalSales;
@override@JsonKey() final  int totalBills;
@override@JsonKey() final  int totalCustomers;
@override@JsonKey() final  double averageBill;
@override@JsonKey() final  double cashSales;
@override@JsonKey() final  double cardSales;
@override@JsonKey() final  double qrSales;
@override@JsonKey() final  double creditSales;
 final  List<TopSellingProduct> _topSellingProducts;
@override@JsonKey() List<TopSellingProduct> get topSellingProducts {
  if (_topSellingProducts is EqualUnmodifiableListView) return _topSellingProducts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellingProducts);
}

 final  List<TopSellingCategory> _topSellingCategories;
@override@JsonKey() List<TopSellingCategory> get topSellingCategories {
  if (_topSellingCategories is EqualUnmodifiableListView) return _topSellingCategories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_topSellingCategories);
}


/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardSummaryModelCopyWith<_DashboardSummaryModel> get copyWith => __$DashboardSummaryModelCopyWithImpl<_DashboardSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DashboardSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardSummaryModel&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales)&&(identical(other.totalBills, totalBills) || other.totalBills == totalBills)&&(identical(other.totalCustomers, totalCustomers) || other.totalCustomers == totalCustomers)&&(identical(other.averageBill, averageBill) || other.averageBill == averageBill)&&(identical(other.cashSales, cashSales) || other.cashSales == cashSales)&&(identical(other.cardSales, cardSales) || other.cardSales == cardSales)&&(identical(other.qrSales, qrSales) || other.qrSales == qrSales)&&(identical(other.creditSales, creditSales) || other.creditSales == creditSales)&&const DeepCollectionEquality().equals(other._topSellingProducts, _topSellingProducts)&&const DeepCollectionEquality().equals(other._topSellingCategories, _topSellingCategories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,totalSales,totalBills,totalCustomers,averageBill,cashSales,cardSales,qrSales,creditSales,const DeepCollectionEquality().hash(_topSellingProducts),const DeepCollectionEquality().hash(_topSellingCategories));

@override
String toString() {
  return 'DashboardSummaryModel(totalSales: $totalSales, totalBills: $totalBills, totalCustomers: $totalCustomers, averageBill: $averageBill, cashSales: $cashSales, cardSales: $cardSales, qrSales: $qrSales, creditSales: $creditSales, topSellingProducts: $topSellingProducts, topSellingCategories: $topSellingCategories)';
}


}

/// @nodoc
abstract mixin class _$DashboardSummaryModelCopyWith<$Res> implements $DashboardSummaryModelCopyWith<$Res> {
  factory _$DashboardSummaryModelCopyWith(_DashboardSummaryModel value, $Res Function(_DashboardSummaryModel) _then) = __$DashboardSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 double totalSales, int totalBills, int totalCustomers, double averageBill, double cashSales, double cardSales, double qrSales, double creditSales, List<TopSellingProduct> topSellingProducts, List<TopSellingCategory> topSellingCategories
});




}
/// @nodoc
class __$DashboardSummaryModelCopyWithImpl<$Res>
    implements _$DashboardSummaryModelCopyWith<$Res> {
  __$DashboardSummaryModelCopyWithImpl(this._self, this._then);

  final _DashboardSummaryModel _self;
  final $Res Function(_DashboardSummaryModel) _then;

/// Create a copy of DashboardSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalSales = null,Object? totalBills = null,Object? totalCustomers = null,Object? averageBill = null,Object? cashSales = null,Object? cardSales = null,Object? qrSales = null,Object? creditSales = null,Object? topSellingProducts = null,Object? topSellingCategories = null,}) {
  return _then(_DashboardSummaryModel(
totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,totalBills: null == totalBills ? _self.totalBills : totalBills // ignore: cast_nullable_to_non_nullable
as int,totalCustomers: null == totalCustomers ? _self.totalCustomers : totalCustomers // ignore: cast_nullable_to_non_nullable
as int,averageBill: null == averageBill ? _self.averageBill : averageBill // ignore: cast_nullable_to_non_nullable
as double,cashSales: null == cashSales ? _self.cashSales : cashSales // ignore: cast_nullable_to_non_nullable
as double,cardSales: null == cardSales ? _self.cardSales : cardSales // ignore: cast_nullable_to_non_nullable
as double,qrSales: null == qrSales ? _self.qrSales : qrSales // ignore: cast_nullable_to_non_nullable
as double,creditSales: null == creditSales ? _self.creditSales : creditSales // ignore: cast_nullable_to_non_nullable
as double,topSellingProducts: null == topSellingProducts ? _self._topSellingProducts : topSellingProducts // ignore: cast_nullable_to_non_nullable
as List<TopSellingProduct>,topSellingCategories: null == topSellingCategories ? _self._topSellingCategories : topSellingCategories // ignore: cast_nullable_to_non_nullable
as List<TopSellingCategory>,
  ));
}


}


/// @nodoc
mixin _$TopSellingProduct {

 int get productID; String get productName; int get quantitySold; double get totalSales;
/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingProductCopyWith<TopSellingProduct> get copyWith => _$TopSellingProductCopyWithImpl<TopSellingProduct>(this as TopSellingProduct, _$identity);

  /// Serializes this TopSellingProduct to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingProduct&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,quantitySold,totalSales);

@override
String toString() {
  return 'TopSellingProduct(productID: $productID, productName: $productName, quantitySold: $quantitySold, totalSales: $totalSales)';
}


}

/// @nodoc
abstract mixin class $TopSellingProductCopyWith<$Res>  {
  factory $TopSellingProductCopyWith(TopSellingProduct value, $Res Function(TopSellingProduct) _then) = _$TopSellingProductCopyWithImpl;
@useResult
$Res call({
 int productID, String productName, int quantitySold, double totalSales
});




}
/// @nodoc
class _$TopSellingProductCopyWithImpl<$Res>
    implements $TopSellingProductCopyWith<$Res> {
  _$TopSellingProductCopyWithImpl(this._self, this._then);

  final TopSellingProduct _self;
  final $Res Function(TopSellingProduct) _then;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? productID = null,Object? productName = null,Object? quantitySold = null,Object? totalSales = null,}) {
  return _then(_self.copyWith(
productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingProduct].
extension TopSellingProductPatterns on TopSellingProduct {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingProduct value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingProduct value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingProduct():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingProduct value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int productID,  String productName,  int quantitySold,  double totalSales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
return $default(_that.productID,_that.productName,_that.quantitySold,_that.totalSales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int productID,  String productName,  int quantitySold,  double totalSales)  $default,) {final _that = this;
switch (_that) {
case _TopSellingProduct():
return $default(_that.productID,_that.productName,_that.quantitySold,_that.totalSales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int productID,  String productName,  int quantitySold,  double totalSales)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingProduct() when $default != null:
return $default(_that.productID,_that.productName,_that.quantitySold,_that.totalSales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingProduct implements TopSellingProduct {
  const _TopSellingProduct({this.productID = 0, this.productName = '', this.quantitySold = 0, this.totalSales = 0.0});
  factory _TopSellingProduct.fromJson(Map<String, dynamic> json) => _$TopSellingProductFromJson(json);

@override@JsonKey() final  int productID;
@override@JsonKey() final  String productName;
@override@JsonKey() final  int quantitySold;
@override@JsonKey() final  double totalSales;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingProductCopyWith<_TopSellingProduct> get copyWith => __$TopSellingProductCopyWithImpl<_TopSellingProduct>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingProductToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingProduct&&(identical(other.productID, productID) || other.productID == productID)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,productID,productName,quantitySold,totalSales);

@override
String toString() {
  return 'TopSellingProduct(productID: $productID, productName: $productName, quantitySold: $quantitySold, totalSales: $totalSales)';
}


}

/// @nodoc
abstract mixin class _$TopSellingProductCopyWith<$Res> implements $TopSellingProductCopyWith<$Res> {
  factory _$TopSellingProductCopyWith(_TopSellingProduct value, $Res Function(_TopSellingProduct) _then) = __$TopSellingProductCopyWithImpl;
@override @useResult
$Res call({
 int productID, String productName, int quantitySold, double totalSales
});




}
/// @nodoc
class __$TopSellingProductCopyWithImpl<$Res>
    implements _$TopSellingProductCopyWith<$Res> {
  __$TopSellingProductCopyWithImpl(this._self, this._then);

  final _TopSellingProduct _self;
  final $Res Function(_TopSellingProduct) _then;

/// Create a copy of TopSellingProduct
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? productID = null,Object? productName = null,Object? quantitySold = null,Object? totalSales = null,}) {
  return _then(_TopSellingProduct(
productID: null == productID ? _self.productID : productID // ignore: cast_nullable_to_non_nullable
as int,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$TopSellingCategory {

 int get categoryID; String get categoryName; int get quantitySold; double get totalSales;
/// Create a copy of TopSellingCategory
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TopSellingCategoryCopyWith<TopSellingCategory> get copyWith => _$TopSellingCategoryCopyWithImpl<TopSellingCategory>(this as TopSellingCategory, _$identity);

  /// Serializes this TopSellingCategory to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TopSellingCategory&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName,quantitySold,totalSales);

@override
String toString() {
  return 'TopSellingCategory(categoryID: $categoryID, categoryName: $categoryName, quantitySold: $quantitySold, totalSales: $totalSales)';
}


}

/// @nodoc
abstract mixin class $TopSellingCategoryCopyWith<$Res>  {
  factory $TopSellingCategoryCopyWith(TopSellingCategory value, $Res Function(TopSellingCategory) _then) = _$TopSellingCategoryCopyWithImpl;
@useResult
$Res call({
 int categoryID, String categoryName, int quantitySold, double totalSales
});




}
/// @nodoc
class _$TopSellingCategoryCopyWithImpl<$Res>
    implements $TopSellingCategoryCopyWith<$Res> {
  _$TopSellingCategoryCopyWithImpl(this._self, this._then);

  final TopSellingCategory _self;
  final $Res Function(TopSellingCategory) _then;

/// Create a copy of TopSellingCategory
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? categoryID = null,Object? categoryName = null,Object? quantitySold = null,Object? totalSales = null,}) {
  return _then(_self.copyWith(
categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [TopSellingCategory].
extension TopSellingCategoryPatterns on TopSellingCategory {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TopSellingCategory value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TopSellingCategory() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TopSellingCategory value)  $default,){
final _that = this;
switch (_that) {
case _TopSellingCategory():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TopSellingCategory value)?  $default,){
final _that = this;
switch (_that) {
case _TopSellingCategory() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int categoryID,  String categoryName,  int quantitySold,  double totalSales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TopSellingCategory() when $default != null:
return $default(_that.categoryID,_that.categoryName,_that.quantitySold,_that.totalSales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int categoryID,  String categoryName,  int quantitySold,  double totalSales)  $default,) {final _that = this;
switch (_that) {
case _TopSellingCategory():
return $default(_that.categoryID,_that.categoryName,_that.quantitySold,_that.totalSales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int categoryID,  String categoryName,  int quantitySold,  double totalSales)?  $default,) {final _that = this;
switch (_that) {
case _TopSellingCategory() when $default != null:
return $default(_that.categoryID,_that.categoryName,_that.quantitySold,_that.totalSales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TopSellingCategory implements TopSellingCategory {
  const _TopSellingCategory({this.categoryID = 0, this.categoryName = '', this.quantitySold = 0, this.totalSales = 0.0});
  factory _TopSellingCategory.fromJson(Map<String, dynamic> json) => _$TopSellingCategoryFromJson(json);

@override@JsonKey() final  int categoryID;
@override@JsonKey() final  String categoryName;
@override@JsonKey() final  int quantitySold;
@override@JsonKey() final  double totalSales;

/// Create a copy of TopSellingCategory
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TopSellingCategoryCopyWith<_TopSellingCategory> get copyWith => __$TopSellingCategoryCopyWithImpl<_TopSellingCategory>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TopSellingCategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TopSellingCategory&&(identical(other.categoryID, categoryID) || other.categoryID == categoryID)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.quantitySold, quantitySold) || other.quantitySold == quantitySold)&&(identical(other.totalSales, totalSales) || other.totalSales == totalSales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,categoryID,categoryName,quantitySold,totalSales);

@override
String toString() {
  return 'TopSellingCategory(categoryID: $categoryID, categoryName: $categoryName, quantitySold: $quantitySold, totalSales: $totalSales)';
}


}

/// @nodoc
abstract mixin class _$TopSellingCategoryCopyWith<$Res> implements $TopSellingCategoryCopyWith<$Res> {
  factory _$TopSellingCategoryCopyWith(_TopSellingCategory value, $Res Function(_TopSellingCategory) _then) = __$TopSellingCategoryCopyWithImpl;
@override @useResult
$Res call({
 int categoryID, String categoryName, int quantitySold, double totalSales
});




}
/// @nodoc
class __$TopSellingCategoryCopyWithImpl<$Res>
    implements _$TopSellingCategoryCopyWith<$Res> {
  __$TopSellingCategoryCopyWithImpl(this._self, this._then);

  final _TopSellingCategory _self;
  final $Res Function(_TopSellingCategory) _then;

/// Create a copy of TopSellingCategory
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? categoryID = null,Object? categoryName = null,Object? quantitySold = null,Object? totalSales = null,}) {
  return _then(_TopSellingCategory(
categoryID: null == categoryID ? _self.categoryID : categoryID // ignore: cast_nullable_to_non_nullable
as int,categoryName: null == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String,quantitySold: null == quantitySold ? _self.quantitySold : quantitySold // ignore: cast_nullable_to_non_nullable
as int,totalSales: null == totalSales ? _self.totalSales : totalSales // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
