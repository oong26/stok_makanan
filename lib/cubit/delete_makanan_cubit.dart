import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';

part 'delete_makanan_state.dart';

class DeleteMakananCubit extends Cubit<DeleteMakananState> {
  MakananRepository repo;
  DeleteMakananCubit(this.repo) : super(DeleteMakananInitial());

  void delete({required int id}) async {
    if (state is DeleteMakananLoading) return;

    emit(DeleteMakananLoading());

    var res = await repo.destroy(id: '$id');

    if (res.status == 1) {
      emit(DeleteMakananSuccess());
    } else {
      print('Cubit error : ${res.message}');
      emit(const DeleteMakananError(message: 'Terjadi kesalahan'));
    }
  }
}
