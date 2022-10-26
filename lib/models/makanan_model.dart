import 'package:stok_makanan/models/tanggal_model.dart';

class MakananModel {
    MakananModel({
        required this.id,
        required this.shift,
        required this.kategoriMenu,
        required this.stok,
        required this.stokTemp,
        required this.nama,
        required this.detail,
        required this.tanggal,
        required this.gambar,
    });

    int id;
    int shift;
    String kategoriMenu;
    int stok;
    int stokTemp;
    String nama;
    String detail;
    TanggalModel tanggal;
    dynamic gambar;

    factory MakananModel.fromJson(Map<String, dynamic> json) => MakananModel(
        id: json["id"] == null ? null : json["id"],
        shift: json["shift"] == null ? null : json["shift"],
        kategoriMenu: json["kategori_menu"] == null ? null : json["kategori_menu"],
        stok: json["stok"] == null ? null : json["stok"],
        stokTemp: json["stok_temp"] == null ? null : json["stok_temp"],
        nama: json["nama"] == null ? null : json["nama"],
        detail: json["detail"] == null ? null : json["detail"],
        tanggal: TanggalModel.fromJson(json["tanggal"]),
        gambar: json["gambar"],
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "shift": shift == null ? null : shift,
        "kategori_menu": kategoriMenu == null ? null : kategoriMenu,
        "stok": stok == null ? null : stok,
        "stok_temp": stokTemp == null ? null : stokTemp,
        "nama": nama == null ? null : nama,
        "detail": detail == null ? null : detail,
        "tanggal": tanggal == null ? null : tanggal.toJson(),
        "gambar": gambar,
    };
}