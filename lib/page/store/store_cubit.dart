import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/model/model_toko.dart';
import 'package:e_commerce/data/repository.dart';
import 'package:equatable/equatable.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  Repository repository;
  StoreCubit(this.repository) : super(StoreInitial());

  void getData() async {
    try {
      emit(StoreLoading());
      var res = await repository.getDataToko();
      emit(StoreSuccess(res));
    } catch (e) {
      emit(StoreError(e.toString()));
    }
  }
}
