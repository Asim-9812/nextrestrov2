// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_order_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlaceOrderState implements DiagnosticableTreeMixin {

 TableModel? get selectedTable; List<PlaceOrderItem> get items; CustomerModel? get selectedCustomer; AsyncValue<PlaceOrderResponse?> get orderPlacementStatus; bool get isExpanded;
/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceOrderStateCopyWith<PlaceOrderState> get copyWith => _$PlaceOrderStateCopyWithImpl<PlaceOrderState>(this as PlaceOrderState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PlaceOrderState'))
    ..add(DiagnosticsProperty('selectedTable', selectedTable))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('selectedCustomer', selectedCustomer))..add(DiagnosticsProperty('orderPlacementStatus', orderPlacementStatus))..add(DiagnosticsProperty('isExpanded', isExpanded));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceOrderState&&(identical(other.selectedTable, selectedTable) || other.selectedTable == selectedTable)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.orderPlacementStatus, orderPlacementStatus) || other.orderPlacementStatus == orderPlacementStatus)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTable,const DeepCollectionEquality().hash(items),selectedCustomer,orderPlacementStatus,isExpanded);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PlaceOrderState(selectedTable: $selectedTable, items: $items, selectedCustomer: $selectedCustomer, orderPlacementStatus: $orderPlacementStatus, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class $PlaceOrderStateCopyWith<$Res>  {
  factory $PlaceOrderStateCopyWith(PlaceOrderState value, $Res Function(PlaceOrderState) _then) = _$PlaceOrderStateCopyWithImpl;
@useResult
$Res call({
 TableModel? selectedTable, List<PlaceOrderItem> items, CustomerModel? selectedCustomer, AsyncValue<PlaceOrderResponse?> orderPlacementStatus, bool isExpanded
});


$TableModelCopyWith<$Res>? get selectedTable;$CustomerModelCopyWith<$Res>? get selectedCustomer;

}
/// @nodoc
class _$PlaceOrderStateCopyWithImpl<$Res>
    implements $PlaceOrderStateCopyWith<$Res> {
  _$PlaceOrderStateCopyWithImpl(this._self, this._then);

  final PlaceOrderState _self;
  final $Res Function(PlaceOrderState) _then;

/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTable = freezed,Object? items = null,Object? selectedCustomer = freezed,Object? orderPlacementStatus = null,Object? isExpanded = null,}) {
  return _then(_self.copyWith(
selectedTable: freezed == selectedTable ? _self.selectedTable : selectedTable // ignore: cast_nullable_to_non_nullable
as TableModel?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<PlaceOrderItem>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,orderPlacementStatus: null == orderPlacementStatus ? _self.orderPlacementStatus : orderPlacementStatus // ignore: cast_nullable_to_non_nullable
as AsyncValue<PlaceOrderResponse?>,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TableModelCopyWith<$Res>? get selectedTable {
    if (_self.selectedTable == null) {
    return null;
  }

  return $TableModelCopyWith<$Res>(_self.selectedTable!, (value) {
    return _then(_self.copyWith(selectedTable: value));
  });
}/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get selectedCustomer {
    if (_self.selectedCustomer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.selectedCustomer!, (value) {
    return _then(_self.copyWith(selectedCustomer: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaceOrderState].
extension PlaceOrderStatePatterns on PlaceOrderState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceOrderState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceOrderState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceOrderState value)  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceOrderState value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceOrderState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TableModel? selectedTable,  List<PlaceOrderItem> items,  CustomerModel? selectedCustomer,  AsyncValue<PlaceOrderResponse?> orderPlacementStatus,  bool isExpanded)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceOrderState() when $default != null:
return $default(_that.selectedTable,_that.items,_that.selectedCustomer,_that.orderPlacementStatus,_that.isExpanded);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TableModel? selectedTable,  List<PlaceOrderItem> items,  CustomerModel? selectedCustomer,  AsyncValue<PlaceOrderResponse?> orderPlacementStatus,  bool isExpanded)  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderState():
return $default(_that.selectedTable,_that.items,_that.selectedCustomer,_that.orderPlacementStatus,_that.isExpanded);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TableModel? selectedTable,  List<PlaceOrderItem> items,  CustomerModel? selectedCustomer,  AsyncValue<PlaceOrderResponse?> orderPlacementStatus,  bool isExpanded)?  $default,) {final _that = this;
switch (_that) {
case _PlaceOrderState() when $default != null:
return $default(_that.selectedTable,_that.items,_that.selectedCustomer,_that.orderPlacementStatus,_that.isExpanded);case _:
  return null;

}
}

}

/// @nodoc


class _PlaceOrderState with DiagnosticableTreeMixin implements PlaceOrderState {
  const _PlaceOrderState({this.selectedTable, final  List<PlaceOrderItem> items = const [], this.selectedCustomer, this.orderPlacementStatus = const AsyncValue.data(null), this.isExpanded = false}): _items = items;
  

@override final  TableModel? selectedTable;
 final  List<PlaceOrderItem> _items;
@override@JsonKey() List<PlaceOrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  CustomerModel? selectedCustomer;
@override@JsonKey() final  AsyncValue<PlaceOrderResponse?> orderPlacementStatus;
@override@JsonKey() final  bool isExpanded;

/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceOrderStateCopyWith<_PlaceOrderState> get copyWith => __$PlaceOrderStateCopyWithImpl<_PlaceOrderState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PlaceOrderState'))
    ..add(DiagnosticsProperty('selectedTable', selectedTable))..add(DiagnosticsProperty('items', items))..add(DiagnosticsProperty('selectedCustomer', selectedCustomer))..add(DiagnosticsProperty('orderPlacementStatus', orderPlacementStatus))..add(DiagnosticsProperty('isExpanded', isExpanded));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceOrderState&&(identical(other.selectedTable, selectedTable) || other.selectedTable == selectedTable)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.selectedCustomer, selectedCustomer) || other.selectedCustomer == selectedCustomer)&&(identical(other.orderPlacementStatus, orderPlacementStatus) || other.orderPlacementStatus == orderPlacementStatus)&&(identical(other.isExpanded, isExpanded) || other.isExpanded == isExpanded));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTable,const DeepCollectionEquality().hash(_items),selectedCustomer,orderPlacementStatus,isExpanded);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PlaceOrderState(selectedTable: $selectedTable, items: $items, selectedCustomer: $selectedCustomer, orderPlacementStatus: $orderPlacementStatus, isExpanded: $isExpanded)';
}


}

/// @nodoc
abstract mixin class _$PlaceOrderStateCopyWith<$Res> implements $PlaceOrderStateCopyWith<$Res> {
  factory _$PlaceOrderStateCopyWith(_PlaceOrderState value, $Res Function(_PlaceOrderState) _then) = __$PlaceOrderStateCopyWithImpl;
@override @useResult
$Res call({
 TableModel? selectedTable, List<PlaceOrderItem> items, CustomerModel? selectedCustomer, AsyncValue<PlaceOrderResponse?> orderPlacementStatus, bool isExpanded
});


@override $TableModelCopyWith<$Res>? get selectedTable;@override $CustomerModelCopyWith<$Res>? get selectedCustomer;

}
/// @nodoc
class __$PlaceOrderStateCopyWithImpl<$Res>
    implements _$PlaceOrderStateCopyWith<$Res> {
  __$PlaceOrderStateCopyWithImpl(this._self, this._then);

  final _PlaceOrderState _self;
  final $Res Function(_PlaceOrderState) _then;

/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTable = freezed,Object? items = null,Object? selectedCustomer = freezed,Object? orderPlacementStatus = null,Object? isExpanded = null,}) {
  return _then(_PlaceOrderState(
selectedTable: freezed == selectedTable ? _self.selectedTable : selectedTable // ignore: cast_nullable_to_non_nullable
as TableModel?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<PlaceOrderItem>,selectedCustomer: freezed == selectedCustomer ? _self.selectedCustomer : selectedCustomer // ignore: cast_nullable_to_non_nullable
as CustomerModel?,orderPlacementStatus: null == orderPlacementStatus ? _self.orderPlacementStatus : orderPlacementStatus // ignore: cast_nullable_to_non_nullable
as AsyncValue<PlaceOrderResponse?>,isExpanded: null == isExpanded ? _self.isExpanded : isExpanded // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TableModelCopyWith<$Res>? get selectedTable {
    if (_self.selectedTable == null) {
    return null;
  }

  return $TableModelCopyWith<$Res>(_self.selectedTable!, (value) {
    return _then(_self.copyWith(selectedTable: value));
  });
}/// Create a copy of PlaceOrderState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CustomerModelCopyWith<$Res>? get selectedCustomer {
    if (_self.selectedCustomer == null) {
    return null;
  }

  return $CustomerModelCopyWith<$Res>(_self.selectedCustomer!, (value) {
    return _then(_self.copyWith(selectedCustomer: value));
  });
}
}

// dart format on
