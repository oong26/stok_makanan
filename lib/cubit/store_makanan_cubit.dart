import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:stok_makanan/repositories/makanan_repo.dart';

part 'store_makanan_state.dart';

class StoreMakananCubit extends Cubit<StoreMakananState> {
  MakananRepository repo;
  StoreMakananCubit(this.repo) : super(StoreMakananInitial());

  void store({
    required String shift,
    required String kategori,
    required String stok,
    required String nama,
    required String detail,
    required String filename,
    required String fileBase64,
    required String fileExt,
  }) async {
    if (state is StoreMakananLoading) return;

    emit(StoreMakananLoading());

    try {
      var params = {
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

      var res = await repo.store(body: body);

      if (res.status == 1) {
        emit(StoreMakananSuccess());
      } else {
        emit(StoreMakananError(message: res.message));
      }
    } catch (e) {
      debugPrint('Cubit error : $e');

      if (e.toString().contains('FormatException: SyntaxError')) {
        emit(StoreMakananSuccess());
      } else {
        emit(const StoreMakananError(message: 'Terjadi kesalahan'));
      }
    }
  }
}
