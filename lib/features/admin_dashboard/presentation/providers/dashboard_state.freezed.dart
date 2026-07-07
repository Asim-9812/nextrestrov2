// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DashboardState {

 DashboardDateRange get dateRange; DateTime? get fromDate; DateTime? get toDate; DashboardSummaryModel? get currentSummary; DashboardSummaryModel? get previousSummary; bool get isLoading; String? get errorMessage;
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DashboardStateCopyWith<DashboardState> get copyWith => _$DashboardStateCopyWithImpl<DashboardState>(this as DashboardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DashboardState&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.currentSummary, currentSummary) || other.currentSummary == currentSummary)&&(identical(other.previousSummary, previousSummary) || other.previousSummary == previousSummary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,fromDate,toDate,currentSummary,previousSummary,isLoading,errorMessage);

@override
String toString() {
  return 'DashboardState(dateRange: $dateRange, fromDate: $fromDate, toDate: $toDate, currentSummary: $currentSummary, previousSummary: $previousSummary, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $DashboardStateCopyWith<$Res>  {
  factory $DashboardStateCopyWith(DashboardState value, $Res Function(DashboardState) _then) = _$DashboardStateCopyWithImpl;
@useResult
$Res call({
 DashboardDateRange dateRange, DateTime? fromDate, DateTime? toDate, DashboardSummaryModel? currentSummary, DashboardSummaryModel? previousSummary, bool isLoading, String? errorMessage
});


$DashboardSummaryModelCopyWith<$Res>? get currentSummary;$DashboardSummaryModelCopyWith<$Res>? get previousSummary;

}
/// @nodoc
class _$DashboardStateCopyWithImpl<$Res>
    implements $DashboardStateCopyWith<$Res> {
  _$DashboardStateCopyWithImpl(this._self, this._then);

  final DashboardState _self;
  final $Res Function(DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateRange = null,Object? fromDate = freezed,Object? toDate = freezed,Object? currentSummary = freezed,Object? previousSummary = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DashboardDateRange,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,currentSummary: freezed == currentSummary ? _self.currentSummary : currentSummary // ignore: cast_nullable_to_non_nullable
as DashboardSummaryModel?,previousSummary: freezed == previousSummary ? _self.previousSummary : previousSummary // ignore: cast_nullable_to_non_nullable
as DashboardSummaryModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<$Res>? get currentSummary {
    if (_self.currentSummary == null) {
    return null;
  }

  return $DashboardSummaryModelCopyWith<$Res>(_self.currentSummary!, (value) {
    return _then(_self.copyWith(currentSummary: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<$Res>? get previousSummary {
    if (_self.previousSummary == null) {
    return null;
  }

  return $DashboardSummaryModelCopyWith<$Res>(_self.previousSummary!, (value) {
    return _then(_self.copyWith(previousSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [DashboardState].
extension DashboardStatePatterns on DashboardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DashboardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DashboardState value)  $default,){
final _that = this;
switch (_that) {
case _DashboardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DashboardState value)?  $default,){
final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DashboardDateRange dateRange,  DateTime? fromDate,  DateTime? toDate,  DashboardSummaryModel? currentSummary,  DashboardSummaryModel? previousSummary,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.dateRange,_that.fromDate,_that.toDate,_that.currentSummary,_that.previousSummary,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DashboardDateRange dateRange,  DateTime? fromDate,  DateTime? toDate,  DashboardSummaryModel? currentSummary,  DashboardSummaryModel? previousSummary,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _DashboardState():
return $default(_that.dateRange,_that.fromDate,_that.toDate,_that.currentSummary,_that.previousSummary,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DashboardDateRange dateRange,  DateTime? fromDate,  DateTime? toDate,  DashboardSummaryModel? currentSummary,  DashboardSummaryModel? previousSummary,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _DashboardState() when $default != null:
return $default(_that.dateRange,_that.fromDate,_that.toDate,_that.currentSummary,_that.previousSummary,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _DashboardState implements DashboardState {
  const _DashboardState({this.dateRange = DashboardDateRange.today, this.fromDate, this.toDate, this.currentSummary, this.previousSummary, this.isLoading = false, this.errorMessage});
  

@override@JsonKey() final  DashboardDateRange dateRange;
@override final  DateTime? fromDate;
@override final  DateTime? toDate;
@override final  DashboardSummaryModel? currentSummary;
@override final  DashboardSummaryModel? previousSummary;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DashboardStateCopyWith<_DashboardState> get copyWith => __$DashboardStateCopyWithImpl<_DashboardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DashboardState&&(identical(other.dateRange, dateRange) || other.dateRange == dateRange)&&(identical(other.fromDate, fromDate) || other.fromDate == fromDate)&&(identical(other.toDate, toDate) || other.toDate == toDate)&&(identical(other.currentSummary, currentSummary) || other.currentSummary == currentSummary)&&(identical(other.previousSummary, previousSummary) || other.previousSummary == previousSummary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,dateRange,fromDate,toDate,currentSummary,previousSummary,isLoading,errorMessage);

@override
String toString() {
  return 'DashboardState(dateRange: $dateRange, fromDate: $fromDate, toDate: $toDate, currentSummary: $currentSummary, previousSummary: $previousSummary, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$DashboardStateCopyWith<$Res> implements $DashboardStateCopyWith<$Res> {
  factory _$DashboardStateCopyWith(_DashboardState value, $Res Function(_DashboardState) _then) = __$DashboardStateCopyWithImpl;
@override @useResult
$Res call({
 DashboardDateRange dateRange, DateTime? fromDate, DateTime? toDate, DashboardSummaryModel? currentSummary, DashboardSummaryModel? previousSummary, bool isLoading, String? errorMessage
});


@override $DashboardSummaryModelCopyWith<$Res>? get currentSummary;@override $DashboardSummaryModelCopyWith<$Res>? get previousSummary;

}
/// @nodoc
class __$DashboardStateCopyWithImpl<$Res>
    implements _$DashboardStateCopyWith<$Res> {
  __$DashboardStateCopyWithImpl(this._self, this._then);

  final _DashboardState _self;
  final $Res Function(_DashboardState) _then;

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateRange = null,Object? fromDate = freezed,Object? toDate = freezed,Object? currentSummary = freezed,Object? previousSummary = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_DashboardState(
dateRange: null == dateRange ? _self.dateRange : dateRange // ignore: cast_nullable_to_non_nullable
as DashboardDateRange,fromDate: freezed == fromDate ? _self.fromDate : fromDate // ignore: cast_nullable_to_non_nullable
as DateTime?,toDate: freezed == toDate ? _self.toDate : toDate // ignore: cast_nullable_to_non_nullable
as DateTime?,currentSummary: freezed == currentSummary ? _self.currentSummary : currentSummary // ignore: cast_nullable_to_non_nullable
as DashboardSummaryModel?,previousSummary: freezed == previousSummary ? _self.previousSummary : previousSummary // ignore: cast_nullable_to_non_nullable
as DashboardSummaryModel?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<$Res>? get currentSummary {
    if (_self.currentSummary == null) {
    return null;
  }

  return $DashboardSummaryModelCopyWith<$Res>(_self.currentSummary!, (value) {
    return _then(_self.copyWith(currentSummary: value));
  });
}/// Create a copy of DashboardState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DashboardSummaryModelCopyWith<$Res>? get previousSummary {
    if (_self.previousSummary == null) {
    return null;
  }

  return $DashboardSummaryModelCopyWith<$Res>(_self.previousSummary!, (value) {
    return _then(_self.copyWith(previousSummary: value));
  });
}
}

// dart format on
