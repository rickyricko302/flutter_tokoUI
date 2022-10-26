import 'package:bloc/bloc.dart';
import 'package:e_commerce/data/model/detail_model.dart';
import 'package:e_commerce/data/repository.dart';
import 'package:equatable/equatable.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  Repository repository;
  DetailCubit(this.repository) : super(DetailInitial());

  void getData(id) async {
    emit(DetailLoading());
    try {
      var res = await repository.getProducts(id);
      emit(DetailSuccess(res));
    } catch (e) {
      emit(DetailError(e.toString()));
    }
  }
}
