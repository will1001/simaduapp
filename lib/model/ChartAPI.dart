import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<ChartAPI>> fetchChartAPI() async {
  var responseJson;
  String url = "http://simadu.id/api/chart_api.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => ChartAPI.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class ChartAPI {
  final String id_laporan;
  final String id_register;
  final String tanggal;
  final String tahun;
  final String jenis_produk;
  final String nama_produk;
  final String jumlah;
  final String satuan;
  final String harga;
  final String total;
  final String jenis_pembelian;
  final String jenis_pembayaran;
  final String jenis_pengiriman;
  final String bulan_penjualan;
  

  ChartAPI({
    this.id_laporan,
    this.id_register,
    this.tanggal,
    this.tahun,
    this.jenis_produk,
    this.nama_produk,
    this.jumlah,
    this.satuan,
    this.harga,
    this.total,
    this.jenis_pembelian,
    this.jenis_pembayaran,
    this.jenis_pengiriman,
    this.bulan_penjualan,
  });

  factory ChartAPI.fromJson(Map<String, dynamic> json) {
    return ChartAPI(
      id_laporan: json['id_laporan'],
      id_register: json['id_register'],
      tanggal: json['tanggal'],
      tahun: json['tahun'],
      jenis_produk: json['jenis_produk'],
      nama_produk: json['nama_produk'],
      jumlah: json['jumlah'],
      satuan: json['satuan'],
      harga: json['harga'],
      total: json['total'],
      jenis_pembelian: json['jenis_pembelian'],
      jenis_pembayaran: json['jenis_pembayaran'],
      jenis_pengiriman: json['jenis_pengiriman'],
      bulan_penjualan: json['bulan_penjualan'],
    );
  }
}