part of 'product_detail_cubit.dart';

abstract class ProductDetailState extends Equatable {
  const ProductDetailState();
}

class ProductDetailInitial extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailLoading extends ProductDetailState {
  @override
  List<Object> get props => [];
}

class ProductDetailSuccess extends ProductDetailState {
  ProductModel model;
  ProductDetailSuccess(this.model);
  @override
  List<Object> get props => [model];
}

class ProductDetailerror extends ProductDetailState {
  String error;
  ProductDetailerror(this.error);
  @override
  List<Object> get props => [error];
}
