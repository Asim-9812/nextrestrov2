import 'package:equatable/equatable.dart';

abstract class BrandEvent extends Equatable {
  const BrandEvent();

  @override
  List<Object> get props => [];
}

class GetAllBrandsEvent extends BrandEvent {}
