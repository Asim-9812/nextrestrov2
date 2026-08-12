import 'package:equatable/equatable.dart';

abstract class ProductTypeEvent extends Equatable {
  const ProductTypeEvent();

  @override
  List<Object> get props => [];
}

class GetAllProductTypesEvent extends ProductTypeEvent {}
