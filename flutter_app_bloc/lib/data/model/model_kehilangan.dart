class Kehilangan {
  String id,
      nama,
      peran,
      namaBarang,
      jenisBarang,
      gambar,
      detailInformasi,
      tempatKehilangan,
      waktuKehilangan,
      nomorHp,
      idLine;

  Kehilangan(
      {this.id,
      this.nama,
      this.peran,
      this.namaBarang,
      this.jenisBarang,
      this.gambar,
      this.detailInformasi,
      this.tempatKehilangan,
      this.waktuKehilangan,
      this.nomorHp,
      this.idLine});

  factory Kehilangan.fromJson(Map<String, dynamic> map) {
    return Kehilangan(
      id: map["id"],
      nama: map["nama"],
      peran: map["peran"],
      namaBarang: map["nama_barang"],
      jenisBarang: map["jenis_barang"],
      gambar: map["gambar"],
      detailInformasi: map["detail_informasi"],
      tempatKehilangan: map["tempat_kehilangan"],
      waktuKehilangan: map["waktu_kehilangan"],
      nomorHp: map["nomor_hp"],
      idLine: map["id_line"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nama": nama,
      "peran": peran,
      "nama_barang": namaBarang,
      "jenis_barang": jenisBarang,
      "gambar": gambar,
      "detail_informasi": detailInformasi,
      "tempat_kehilangan": tempatKehilangan,
      "waktu_kehilangan": waktuKehilangan,
      "nomor_hp": nomorHp,
      "id_line": idLine,
    };
  }

  // @override
  // String toString() {
  //   return 'Profile{nama: $nama, peran: $peran, nama_barang: $namaBarang}';
  // }
}

// List<Kehilangan> kehilanganFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<Kehilangan>.from(data.map((item) => Kehilangan.fromJson(item)));
// }

// Kehilangan detailkehilanganFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return Kehilangan.fromJson(data[0]);
// }

// String kehilanganToJson(Kehilangan data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }
