import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<List<ListTahunLaporanBulanan>> fetchListTahunLaporanBulanan() async {
  var responseJson;
  String url = "http://simadu.id/api/list_tahun_laporan_bulanan.php";
  final response = await http.post(url);
  if (response.statusCode == 200) {
    responseJson = json.decode(response.body);
    responseJson =
        (responseJson as List).map((p) => ListTahunLaporanBulanan.fromJson(p)).toList();
  } else {
    responseJson = null;
  }

  return responseJson;
}

class ListTahunLaporanBulanan {
  final String tahun;

  ListTahunLaporanBulanan({
    this.tahun,

  });

  factory ListTahunLaporanBulanan.fromJson(Map<String, dynamic> json) {
    return ListTahunLaporanBulanan(
      tahun: json['tahun'],

    );
  }
}