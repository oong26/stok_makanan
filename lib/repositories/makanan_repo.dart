import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:stok_makanan/models/list_makanan_model.dart';
import 'package:stok_makanan/models/response_model.dart';
import 'package:stok_makanan/utils/constants.dart';

class MakananRepository {
  MakananRepository();

  Future<ListMakananModel> fetch() async {
    var url = Uri.http(DOMAIN, '/stok_makanan_api/list.php');
    var res = await http.get(url);

    try {
      return listMakananModelFromJson(res.body);
    } catch (e) {
      debugPrint('Response error : $e');

      return listMakananModelFromJson(res.body);
    }
  }

  Future<ResponseModel> store({required String body}) async {
    var url = Uri.http(DOMAIN, '/stok_makanan_api/insert.php');
    var res = await http.post(url, body: body, headers: defaultHeader);

    try {
      return responseModelFromJson(res.body);
    } catch (e) {
      debugPrint('Response error : $e');

      return responseModelFromJson(res.body);
    }
  }
}
