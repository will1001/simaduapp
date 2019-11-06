




class APIProfil {
  final String nama_usaha;
  final String nama_pemilik;
  final String no_ktp;
  final String kategori_usaha;
  final String email;
  final String no_hp;
  final String alamat;
  final String desa;
  final String kecamatan;
  final String provinsi;

  

  APIProfil({
    this.nama_usaha,
    this.nama_pemilik,
    this.no_ktp,
    this.kategori_usaha,
    this.email,
    this.no_hp,
    this.alamat,
    this.desa,
    this.kecamatan,
    this.provinsi,

  });

  factory APIProfil.fromJson(Map<String, dynamic> json) {
    return APIProfil(
      nama_usaha: json['nama_usaha'],
      nama_pemilik: json['nama_pemilik'],
      no_ktp: json['no_ktp'],
      kategori_usaha: json['kategori_usaha'],
      email: json['email'],
      no_hp: json['no_hp'],
      alamat: json['alamat'],
      desa: json['desa'],
      kecamatan: json['kecamatan'],
      provinsi: json['provinsi'],

    );
  }
}