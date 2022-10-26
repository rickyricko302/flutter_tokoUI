import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/model/detail_model.dart';
import 'package:e_commerce/data/repository.dart';
import 'package:equatable/equatable.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  Repository repository;
  ProductDetailCubit(this.repository) : super(ProductDetailInitial());
}
