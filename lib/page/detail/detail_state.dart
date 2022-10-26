part of 'detail_cubit.dart';

abstract class DetailState extends Equatable {
  const DetailState();
}

class DetailInitial extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailLoading extends DetailState {
  @override
  List<Object> get props => [];
}

class DetailSuccess extends DetailState {
  List<ProductModel> data;
  DetailSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class DetailError extends DetailState {
  String error;
  DetailError(this.error);
  @override
  List<Object> get props => [error];
}
