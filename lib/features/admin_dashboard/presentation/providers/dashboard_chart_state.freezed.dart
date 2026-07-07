// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_chart_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardChartState {

 List<ChartDataPoint> get dataPoints; String get interval; bool get isLoading; String? get errorMessage;
/// Create a copy of DashboardChartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardChartStateCopyWith<DashboardChartState> get copyWith => _$DashboardChartStateCopyWithImpl<DashboardChartState>(this as DashboardChartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardChartState&&const DeepCollectionEquality().equals(other.dataPoints, dataPoints)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(dataPoints),interval,isLoading,errorMessage);

@override
String toString() {
  return 'DashboardChartState(dataPoints: $dataPoints, interval: $interval, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DashboardChartStateCopyWith<$Res>  {
  factory $DashboardChartStateCopyWith(DashboardChartState value, $Res Function(DashboardChartState) _then) = _$DashboardChartStateCopyWithImpl;
@useResult
$Res call({
 List<ChartDataPoint> dataPoints, String interval, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$DashboardChartStateCopyWithImpl<$Res>
    implements $DashboardChartStateCopyWith<$Res> {
  _$DashboardChartStateCopyWithImpl(this._self, this._then);

  final DashboardChartState _self;
  final $Res Function(DashboardChartState) _then;

/// Create a copy of DashboardChartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dataPoints = null,Object? interval = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
dataPoints: null == dataPoints ? _self.dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DashboardChartState].
extension DashboardChartStatePatterns on DashboardChartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardChartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardChartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardChartState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardChartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardChartState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardChartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChartDataPoint> dataPoints,  String interval,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardChartState() when $default != null:
return $default(_that.dataPoints,_that.interval,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChartDataPoint> dataPoints,  String interval,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DashboardChartState():
return $default(_that.dataPoints,_that.interval,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChartDataPoint> dataPoints,  String interval,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DashboardChartState() when $default != null:
return $default(_that.dataPoints,_that.interval,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardChartState implements DashboardChartState {
  const _DashboardChartState({final  List<ChartDataPoint> dataPoints = const [], this.interval = 'Week', this.isLoading = false, this.errorMessage}): _dataPoints = dataPoints;
  

 final  List<ChartDataPoint> _dataPoints;
@override@JsonKey() List<ChartDataPoint> get dataPoints {
  if (_dataPoints is EqualUnmodifiableListView) return _dataPoints;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_dataPoints);
}

@override@JsonKey() final  String interval;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of DashboardChartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardChartStateCopyWith<_DashboardChartState> get copyWith => __$DashboardChartStateCopyWithImpl<_DashboardChartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardChartState&&const DeepCollectionEquality().equals(other._dataPoints, _dataPoints)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_dataPoints),interval,isLoading,errorMessage);

@override
String toString() {
  return 'DashboardChartState(dataPoints: $dataPoints, interval: $interval, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DashboardChartStateCopyWith<$Res> implements $DashboardChartStateCopyWith<$Res> {
  factory _$DashboardChartStateCopyWith(_DashboardChartState value, $Res Function(_DashboardChartState) _then) = __$DashboardChartStateCopyWithImpl;
@override @useResult
$Res call({
 List<ChartDataPoint> dataPoints, String interval, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$DashboardChartStateCopyWithImpl<$Res>
    implements _$DashboardChartStateCopyWith<$Res> {
  __$DashboardChartStateCopyWithImpl(this._self, this._then);

  final _DashboardChartState _self;
  final $Res Function(_DashboardChartState) _then;

/// Create a copy of DashboardChartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dataPoints = null,Object? interval = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_DashboardChartState(
dataPoints: null == dataPoints ? _self._dataPoints : dataPoints // ignore: cast_nullable_to_non_nullable
as List<ChartDataPoint>,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
