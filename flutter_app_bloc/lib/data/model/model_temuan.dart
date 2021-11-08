import 'dart:convert';

class Temuan {
  String id,
      nama,
      peran,
      namaBarang,
      jenisBarang,
      gambar,
      detailInformasi,
      tempatTemuan,
      waktuTemuan,
      nomorHp,
      idLine;

  Temuan(
      {this.id,
      this.nama,
      this.peran,
      this.namaBarang,
      this.jenisBarang,
      this.gambar,
      this.detailInformasi,
      this.tempatTemuan,
      this.waktuTemuan,
      this.nomorHp,
      this.idLine});

  factory Temuan.fromJson(Map<String, dynamic> map) {
    return Temuan(
      id: map["id"],
      nama: map["nama"],
      peran: map["peran"],
      namaBarang: map["nama_barang"],
      jenisBarang: map["jenis_barang"],
      gambar: map["gambar"],
      detailInformasi: map["detail_informasi"],
      tempatTemuan: map["tempat_temuan"],
      waktuTemuan: map["waktu_temuan"],
      nomorHp: map["nomor_hp"],
      idLine: map["id_line"],
    );
  }
}

List<Temuan> temuanFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Temuan>.from(data.map((item) => Temuan.fromJson(item)));
}

Temuan detailTemuan(String jsonData) {
  final data = json.decode(jsonData);
  return Temuan.fromJson(data[0]);
}
