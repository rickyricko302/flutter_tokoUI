part of 'store_cubit.dart';

abstract class StoreState extends Equatable {
  const StoreState();
}

class StoreInitial extends StoreState {
  @override
  List<Object> get props => [];
}

class StoreLoading extends StoreState {
  @override
  List<Object> get props => [];
}

class StoreSuccess extends StoreState {
  List<ModelToko> data;
  StoreSuccess(this.data);
  @override
  List<Object> get props => [data];
}

class StoreError extends StoreState {
  String error;
  StoreError(this.error);
  @override
  List<Object> get props => [error];
}
