import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stok_makanan/models/makanan_model.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';

part 'fetch_makanan_state.dart';

class FetchMakananCubit extends Cubit<FetchMakananState> {
  MakananRepository repo;
  FetchMakananCubit(this.repo) : super(FetchMakananInitial());

  void fetch({String q = ''}) async {
    if (state is FetchMakananLoading) return;

    emit(FetchMakananLoading());

    var res = await repo.fetch(q: q);

    if (res.status == 1) {
      emit(FetchMakananSuccess(data: res.data!));
    } else {
      emit(FetchMakananError(message: res.message));
    }
  }
}
