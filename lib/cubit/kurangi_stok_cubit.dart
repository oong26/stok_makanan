import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';

part 'kurangi_stok_state.dart';

class KurangiStokCubit extends Cubit<KurangiStokState> {
  MakananRepository repo;
  KurangiStokCubit(this.repo) : super(KurangiStokInitial());

  void subtract({required int id}) async {
    if (state is KurangiStokLoading) return;

    emit(KurangiStokLoading());

    var res = await repo.subtractStock(id: '$id');

    if (res.status == 1) {
      emit(KurangiStokSuccess());
    } else {
      print('Cubit error : ${res.message}');
      emit(const KurangiStokError(message: 'Terjadi kesalahan'));
    }
  }
}
