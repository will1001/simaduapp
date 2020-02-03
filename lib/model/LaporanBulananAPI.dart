import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<LaporanBulananAPI>> fetchLaporanBulananAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/get_api_laporanbulanan.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => LaporanBulananAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class LaporanBulananAPI {
  final String id_laporan;
  final String id_register;
  final String tanggal;
  final String jenis_produk;
  final String nama_produk;
  final String unit_penjualan;
  final String satuan;
  final String harga;
  final String total;

  

  LaporanBulananAPI({
    this.id_laporan,
    this.id_register,
    this.tanggal,
    this.jenis_produk,
    this.nama_produk,
    this.unit_penjualan,
    this.satuan,
    this.harga,
    this.total,

  });

  factory LaporanBulananAPI.fromJson(Map<String, dynamic> json) {
    return LaporanBulananAPI(
      id_laporan: json['id_laporan'],
      id_register: json['id_register'],
      tanggal: json['tanggal'],
      jenis_produk: json['jenis_produk'],
      nama_produk: json['nama_produk'],
      unit_penjualan: json['unit_penjualan'],
      satuan: json['satuan'],
      harga: json['harga'],
      total: json['total'],

    );
  }
}