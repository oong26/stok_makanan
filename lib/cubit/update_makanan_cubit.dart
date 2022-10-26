import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';

part 'update_makanan_state.dart';

class UpdateMakananCubit extends Cubit<UpdateMakananState> {
  MakananRepository repo;
  UpdateMakananCubit(this.repo) : super(UpdateMakananInitial());

  void update({
    required String id,
    required String shift,
    required String kategori,
    required String stok,
    required String nama,
    required String detail,
    String filename = '',
    String fileBase64 = '',
    String fileExt = '',
  }) async {
    if (state is UpdateMakananLoading) return;

    emit(UpdateMakananLoading());

    try {
      var params = {
        'id': id,
        'shift': shift,
        'kategori_menu': kategori,
        'stok': stok,
        'stok_temp': stok,
        'nama': nama,
        'detail': detail,
        'filename': filename,
        'tmpfile': fileBase64,
        'file_ext': fileExt,
      };

      String body = json.encode(params);

      var res = await repo.update(body: body);

      if (res.status == 1) {
        emit(UpdateMakananSuccess());
      } else {
        emit(UpdateMakananError(message: res.message));
      }
    } catch (e) {
      debugPrint('Cubit error : $e');

      if (e.toString().contains('FormatException: SyntaxError')) {
        emit(UpdateMakananSuccess());
      } else {
        emit(const UpdateMakananError(message: 'Terjadi kesalahan'));
      }
    }
  }
}
