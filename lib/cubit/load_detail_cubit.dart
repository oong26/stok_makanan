import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stok_makanan/models/makanan_model.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';

part 'load_detail_state.dart';

class LoadDetailCubit extends Cubit<LoadDetailState> {
  MakananRepository repo;
  LoadDetailCubit(this.repo) : super(LoadDetailInitial());

  void fetch({required int id}) async {
    if (state is LoadDetailLoading) return;

    emit(LoadDetailLoading());

    var res = await repo.edit(id: id.toString());

    if (res.status == 1) {
      if (res.data != null) {
        emit(LoadDetailSuccess(data: res.data!));
      } else {
        emit(const LoadDetailError(message: 'Data tidak ditemukan'));
      }
    } else {
      emit(LoadDetailError(message: res.message));
    }
  }
}
