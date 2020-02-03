// import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:simadu/model/ChartAPI.dart';

// class Summary extends StatefulWidget {
//   final Widget child;

//   Summary({Key key, this.child}) : super(key: key);

//   _SummaryState createState() => _SummaryState();
// }

// class _SummaryState extends State<Summary> {
//   List<charts.Series<Pollution, String>> _seriesData;
//   List<charts.Series<Pollution, String>> _seriesData2;
//   List<charts.Series<Pollution, String>> _seriesData3;
//   int totalbln1=0;
//   int totalbln2=0;
//   int totalbln3=0;
//   int totalbln4=0;
//   int totalbln5=0;
//   int totalbln6=0;
//   int totalbln7=0;
//   int totalbln8=0;
//   int totalbln9=0;
//   int totalbln10=0;
//   int totalbln11=0;
//   int totalbln12=0;

//   _generateData(int totalblnjan,int totalblnfeb,int totalblnmar,int totalblnapr,int totalblnmei,int totalblnjun,int totalblnjul,int totalblnagu,int totalblnsep,int totalblnokt,int totalblnnov,int totalblndes) {
//     var dataJanuari = [
//       new Pollution(1, 'Januari', 120),
//     ];
//     var dataFebruari = [
//       new Pollution(2, 'Februari', 220),
//     ];
//     var dataMaret = [
//       new Pollution(3, 'Maret', 320),
//     ];
//     var dataApril = [
//       new Pollution(4, 'April', 420),
//     ];
//     // var dataMei = [
//     //   new Pollution(5, 'Mei', 120),
//     // ];
//     // var dataJuni = [
//     //   new Pollution(6, 'Juni', 120),
//     // ];
//     // var dataJuli = [
//     //   new Pollution(7, 'Juli', 120),
//     // ];
//     // var dataAgustus = [
//     //   new Pollution(8, 'Agustus', 120),
//     // ];
//     // var dataSeptember = [
//     //   new Pollution(9, 'September', 120),
//     // ];
//     // var dataOktober = [
//     //   new Pollution(10, 'Oktober', 120),
//     // ];
//     // var dataNovember = [
//     //   new Pollution(11, 'November', 120),
//     // ];
//     // var dataDesember = [
//     //   new Pollution(12, 'Desember', 120),
//     // ];

//     _seriesData.add(
//       charts.Series(
//         domainFn: (Pollution pollution, _) => pollution.place,
//         measureFn: (Pollution pollution, _) => pollution.quantity,
//         id: '1',
//         data: dataJanuari,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (Pollution pollution, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xffaa7777)),
//       ),
//     );

//     _seriesData.add(
//       charts.Series(
//         domainFn: (Pollution pollution, _) => pollution.place,
//         measureFn: (Pollution pollution, _) => pollution.quantity,
//         id: '1',
//         data: dataFebruari,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (Pollution pollution, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xccba8810)),
//       ),
//     );

//     _seriesData.add(
//       charts.Series(
//         domainFn: (Pollution pollution, _) => pollution.place,
//         measureFn: (Pollution pollution, _) => pollution.quantity,
//         id: '1',
//         data: dataMaret,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (Pollution pollution, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xabbb9911)),
//       ),
//     );
//     _seriesData.add(
//       charts.Series(
//         domainFn: (Pollution pollution, _) => pollution.place,
//         measureFn: (Pollution pollution, _) => pollution.quantity,
//         id: '1',
//         data: dataApril,
//         fillPatternFn: (_, __) => charts.FillPatternType.solid,
//         fillColorFn: (Pollution pollution, _) =>
//             charts.ColorUtil.fromDartColor(Color(0xaabd5444)),
//       ),
//     );
//     // _seriesData2.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '5',
//     //     data: dataMei,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xffbb9999)),
//     //   ),
//     // );
//     // _seriesData2.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '6',
//     //     data: dataJuni,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xfbba6754)),
//     //   ),
//     // );
//     // _seriesData2.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '7',
//     //     data: dataJuli,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xbffd0981)),
//     //   ),
//     // );
//     // _seriesData2.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '8',
//     //     data: dataAgustus,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xdbcd1100)),
//     //   ),
//     // );
//     // _seriesData3.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '9',
//     //     data: dataSeptember,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xbbcd9900)),
//     //   ),
//     // );
//     // _seriesData3.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '10',
//     //     data: dataOktober,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xabcdef123)),
//     //   ),
//     // );
//     // _seriesData3.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '11',
//     //     data: dataNovember,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xffff7000)),
//     //   ),
//     // );
//     // _seriesData3.add(
//     //   charts.Series(
//     //     domainFn: (Pollution pollution, _) => pollution.place,
//     //     measureFn: (Pollution pollution, _) => pollution.quantity,
//     //     id: '12',
//     //     data: dataDesember,
//     //     fillPatternFn: (_, __) => charts.FillPatternType.solid,
//     //     fillColorFn: (Pollution pollution, _) =>
//     //         charts.ColorUtil.fromDartColor(Color(0xaaaa8888)),
//     //   ),
//     // );
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _seriesData = List<charts.Series<Pollution, String>>();
//     // _seriesData2 = List<charts.Series<Pollution, String>>();
//     // _seriesData3 = List<charts.Series<Pollution, String>>();
//     _generateData(totalbln1,totalbln2,totalbln3,totalbln4,totalbln5,totalbln6,totalbln7,totalbln8,totalbln9,totalbln10,totalbln11,totalbln12);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   backgroundColor: Color(0xff1976d2),
//       //   //backgroundColor: Color(0xff308e1c),
//       //   title: Text('LAporan Bulanan'),
//       // ),
//       body: FutureBuilder<List<ChartAPI>>(
//           future: fetchChartAPI(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               var dataJanuari=snapshot.data.where((a)=>a.bulan_penjualan=='Januari').map((f){
//                 return f.total;
//               }).toList();
//               var dataFebruari=snapshot.data.where((a)=>a.bulan_penjualan=='Februari').map((f){
//                 return f.total;
//               }).toList();
//               var dataMaret=snapshot.data.where((a)=>a.bulan_penjualan=='Maret').map((f){
//                 return f.total;
//               }).toList();
//               var dataApril=snapshot.data.where((a)=>a.bulan_penjualan=='April').map((f){
//                 return f.total;
//               }).toList();
//               var dataMei=snapshot.data.where((a)=>a.bulan_penjualan=='Mei').map((f){
//                 return f.total;
//               }).toList();
//               var dataJuni=snapshot.data.where((a)=>a.bulan_penjualan=='Juni').map((f){
//                 return f.total;
//               }).toList();
//               var dataJuli=snapshot.data.where((a)=>a.bulan_penjualan=='Juli').map((f){
//                 return f.total;
//               }).toList();
//               var dataAgustus=snapshot.data.where((a)=>a.bulan_penjualan=='Agustus').map((f){
//                 return f.total;
//               }).toList();
//               var dataSeptember=snapshot.data.where((a)=>a.bulan_penjualan=='September').map((f){
//                 return f.total;
//               }).toList();
//               var dataOktober=snapshot.data.where((a)=>a.bulan_penjualan=='Oktober').map((f){
//                 return f.total;
//               }).toList();
//               var dataNovember=snapshot.data.where((a)=>a.bulan_penjualan=='November').map((f){
//                 return f.total;
//               }).toList();
//               var dataDesember=snapshot.data.where((a)=>a.bulan_penjualan=='Desember').map((f){
//                 return f.total;
//               }).toList();
//               for (var i = 0; i < dataJanuari.length; i++) {
//                 if(i<dataJanuari.length){
//                   totalbln1+= (dataJanuari.toString()=='[]')?0:int.parse(dataJanuari[i]);
//                 }
//               }
//               for (var i = 0; i < dataFebruari.length; i++) {
//                 if(i<dataFebruari.length){
//                   totalbln2+= (dataFebruari.toString()=='[]')?0:int.parse(dataFebruari[i]);
//                 }
//               }
//               for (var i = 0; i < dataMaret.length; i++) {
//                 if(i<dataMaret.length){

//                   totalbln3+= (dataMaret.toString()=='[]')?0:int.parse(dataMaret[i]);
//                 }
//               }
//               for (var i = 0; i < dataApril.length; i++) {
//                 if(i<dataApril.length){

//                   totalbln4+= (dataApril.toString()=='[]')?0:int.parse(dataApril[i]);
//                 }
//               }
//               for (var i = 0; i < dataMei.length; i++) {
//                 if(i<dataMei.length){

//                   totalbln5+= (dataMei.toString()=='[]')?0:int.parse(dataMei[i]);
//                 }
//               }
//               for (var i = 0; i < dataJuni.length; i++) {
//                 if(i<dataJuni.length){

//                   totalbln6+= (dataJuni.toString()=='[]')?0:int.parse(dataJuni[i]);
//                 }
//               }
//               for (var i = 0; i < dataJuli.length; i++) {
//                 if(i<dataJuli.length){

//                   totalbln7+= (dataJuli.toString()=='[]')?0:int.parse(dataJuli[i]);
//                 }
//               }
//               for (var i = 0; i < dataAgustus.length; i++) {
//                 if(i<dataAgustus.length){

//                   totalbln8+= (dataAgustus.toString()=='[]')?0:int.parse(dataAgustus[i]);
//                 }
//               }
//               for (var i = 0; i < dataSeptember.length; i++) {
//                 if(i<dataSeptember.length){

//                   totalbln9+= (dataSeptember.toString()=='[]')?0:int.parse(dataSeptember[i]);
//                 }
//               }
//               for (var i = 0; i < dataOktober.length; i++) {
//                 if(i<dataOktober.length){

//                   totalbln10+= (dataOktober.toString()=='[]')?0:int.parse(dataOktober[i]);
//                 }
//               }
//               for (var i = 0; i < dataNovember.length; i++) {
//                 if(i<dataNovember.length){

//                   totalbln11+= (dataNovember.toString()=='[]')?0:int.parse(dataNovember[i]);
//                 }
//               }
//               for (var i = 0; i < dataDesember.length; i++) {
//                 if(i<dataDesember.length){

//                   totalbln12+= (dataDesember.toString()=='[]')?0:int.parse(dataDesember[i]);

//                 }
//               }
//             // print(dataJanuari.length);
//             // print(dataFebruari.length);
//             // print(dataMaret.length);
//             // print(dataApril.length);
//             // print(dataMei.length);
//             // print(dataJuni.length);
//             // print(dataJuli.length);
//             // print(dataAgustus.length);
//             // print(dataSeptember.length);
//             // print(dataOktober.length);
//             // print(dataNovember.length);
//             print(totalbln10);
//             _generateData(totalbln1,totalbln2,totalbln3,totalbln4,totalbln5,totalbln6,totalbln7,totalbln8,totalbln9,totalbln10,totalbln11,totalbln12);
//               return Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: Container(
//                   child: Center(
//                     child: Column(
//                       children: <Widget>[
//                         Expanded(
//                           child: charts.BarChart(
//                             _seriesData,
//                             animate: true,
//                             barGroupingType: charts.BarGroupingType.grouped,
//                             //behaviors: [new charts.SeriesLegend()],
//                             animationDuration: Duration(seconds: 1),
//                           ),
//                         ),
//                         // Expanded(
//                         //   child: charts.BarChart(
//                         //     _seriesData2,
//                         //     animate: true,
//                         //     barGroupingType: charts.BarGroupingType.grouped,
//                         //     //behaviors: [new charts.SeriesLegend()],
//                         //     animationDuration: Duration(seconds: 1),
//                         //   ),
//                         // ),
//                         // Expanded(
//                         //   child: charts.BarChart(
//                         //     _seriesData3,
//                         //     animate: true,
//                         //     barGroupingType: charts.BarGroupingType.grouped,
//                         //     //behaviors: [new charts.SeriesLegend()],
//                         //     animationDuration: Duration(seconds: 1),
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             }
//             return CircularProgressIndicator();
//           }),
//     );
//   }
// }

// class Pollution {
//   String place;
//   int year;
//   int quantity;

//   Pollution(this.year, this.place, this.quantity);
// }

// class Task {
//   String task;
//   double taskvalue;
//   Color colorval;

//   Task(this.task, this.taskvalue, this.colorval);
// }

// class Sales {
//   int yearval;
//   int salesval;

//   Sales(this.yearval, this.salesval);
// }

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:simadu/model/APIProvider.dart';
import 'package:simadu/model/ChartAPI.dart';

class Summary extends StatefulWidget {
  Summary({Key key, this.namaPemilik, this.namaUsaha, this.idRegister, this.tahunchart})
      : super(key: key);

  final String namaPemilik;
  final String namaUsaha;
  final String idRegister;
  final String tahunchart;

  _SummaryState createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  String _filtertahun = DateTime.now().toString().substring(0, 4);
  List<charts.Series<Pollution, String>> _seriesData;
  List<charts.Series<Pollution, String>> _seriesData2;
  List<charts.Series<Task, String>> _seriesPieData;
  List<charts.Series<Sales, int>> _seriesLineData;
  int totalbln1 = 0;
  int totalbln2 = 0;
  int totalbln3 = 0;
  int totalbln4 = 0;
  int totalbln5 = 0;
  int totalbln6 = 0;
  int totalbln7 = 0;
  int totalbln8 = 0;
  int totalbln9 = 0;
  int totalbln10 = 0;
  int totalbln11 = 0;
  int totalbln12 = 0;

  _generateData(
      int totalblnjan,
      int totalblnfeb,
      int totalblnmar,
      int totalblnapr,
      int totalblnmei,
      int totalblnjun,
      int totalblnjul,
      int totalblnagu,
      int totalblnsep,
      int totalblnokt,
      int totalblnnov,
      int totalblndes) {
    var data1 = [
      new Pollution(Color(0xff3366cc), 'Jan', totalblnjan),
      new Pollution(Color(0xff990099), 'Febr', totalblnfeb),
      new Pollution(Color(0xff109618), 'Maret', totalblnmar),
      new Pollution(Color(0xacddbe19), 'April', totalblnapr),
      new Pollution(Color(0xfffd6789), 'Mei', totalblnmei),
      new Pollution(Color(0xabbcd455), 'Juni', totalblnjun),
    ];
    var data2 = [
      new Pollution(Color(0xaaddc555), 'July', totalblnjul),
      new Pollution(Color(0xbbbca222), 'Agust', totalblnagu),
      new Pollution(Color(0x3334abcd), 'Sept', totalblnsep),
      new Pollution(Color(0x1d2cbb55), 'Okt', totalblnokt),
      new Pollution(Color(0x3c3cbbdd), 'Nov', totalblnnov),
      new Pollution(Color(0xaaaccc21), 'Des', totalblndes),
    ];
    // var data3 = [
    //   new Pollution(1985, 'USA', 200),
    //   new Pollution(1980, 'Asia', 300),
    //   new Pollution(1985, 'Europe', 180),
    // ];

    var piedata = [
      new Task('Jan', 35.8, Color(0xff3366cc)),
      new Task('Febr', 8.3, Color(0xff990099)),
      new Task('Maret', 10.8, Color(0xff109618)),
      new Task('April', 15.6, Color(0xacddbe19)),
      new Task('Mei', 19.2, Color(0xfffd6789)),
      new Task('Juni', 10.3, Color(0xabbcd455)),
      new Task('July', 10.3, Color(0xaaddc555)),
      new Task('Agust', 10.3, Color(0xbbbca222)),
      new Task('Sept', 10.3, Color(0x3334abcd)),
      new Task('Okt', 10.3, Color(0x1d2cbb55)),
      new Task('Nov', 10.3, Color(0x3c3cbbdd)),
      new Task('Des', 10.3, Color(0xaaaccc21)),
    ];

    var linesalesdata = [
      new Sales(0, 45),
      new Sales(1, 56),
      new Sales(2, 55),
      new Sales(3, 60),
      new Sales(4, 61),
      new Sales(5, 70),
    ];
    var linesalesdata1 = [
      new Sales(0, 35),
      new Sales(1, 46),
      new Sales(2, 45),
      new Sales(3, 50),
      new Sales(4, 51),
      new Sales(5, 60),
    ];

    var linesalesdata2 = [
      new Sales(0, 20),
      new Sales(1, 24),
      new Sales(2, 25),
      new Sales(3, 40),
      new Sales(4, 45),
      new Sales(5, 60),
    ];

    _seriesData.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        // colorFn: (Pollution pollution, _) =>
        //     charts.ColorUtil.fromDartColor(pollution.year),
        id: '2017',
        data: data1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(pollution.year),
      ),
    );

    _seriesData2.add(
      charts.Series(
        domainFn: (Pollution pollution, _) => pollution.place,
        measureFn: (Pollution pollution, _) => pollution.quantity,
        id: '2018',
        data: data2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (Pollution pollution, _) =>
            charts.ColorUtil.fromDartColor(pollution.year),
      ),
    );

    _seriesPieData.add(
      charts.Series(
        domainFn: (Task task, _) => task.task,
        measureFn: (Task task, _) => task.taskvalue,
        colorFn: (Task task, _) =>
            charts.ColorUtil.fromDartColor(task.colorval),
        id: 'Air Pollution',
        data: piedata,
        labelAccessorFn: (Task row, _) => '${row.taskvalue}',
      ),
    );

    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff990099)),
        id: 'Air Pollution',
        data: linesalesdata,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xff109618)),
        id: 'Air Pollution',
        data: linesalesdata1,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
    _seriesLineData.add(
      charts.Series(
        colorFn: (__, _) => charts.ColorUtil.fromDartColor(Color(0xffff9900)),
        id: 'Air Pollution',
        data: linesalesdata2,
        domainFn: (Sales sales, _) => sales.yearval,
        measureFn: (Sales sales, _) => sales.salesval,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _seriesData = List<charts.Series<Pollution, String>>();
    _seriesData2 = List<charts.Series<Pollution, String>>();
    _seriesPieData = List<charts.Series<Task, String>>();
    _seriesLineData = List<charts.Series<Sales, int>>();
    _generateData(
        totalbln1,
        totalbln2,
        totalbln3,
        totalbln4,
        totalbln5,
        totalbln6,
        totalbln7,
        totalbln8,
        totalbln9,
        totalbln10,
        totalbln11,
        totalbln12);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<APIProvider>(
        builder: (context) => APIProvider(),
        child: Consumer<APIProvider>(
          builder: (context, apiprovider, _) => Scaffold(
        appBar: AppBar(
          // leading: Opacity(
          //   opacity: 0,
          // ),
          // backgroundColor: Color(0xff1976d2),
          // title: Text('Laporan Bulanan'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Container(
            child: Center(
              child: FutureBuilder<List<ChartAPI>>(
                  future: fetchChartAPI(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var dataJanuari = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Januari')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataFebruari = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Februari')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataMaret = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Maret')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataApril = snapshot.data
                          .where((a) => a.bulan_penjualan == 'April')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataMei = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Mei')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataJuni = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Juni')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataJuli = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Juli')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataAgustus = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Agustus')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataSeptember = snapshot.data
                          .where((a) => a.bulan_penjualan == 'September')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataOktober = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Oktober')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataNovember = snapshot.data
                          .where((a) => a.bulan_penjualan == 'November')
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      var dataDesember = snapshot.data
                          .where((a) => a.bulan_penjualan == 'Desember')
                          .toList()
                          .where((a) => a.id_register == widget.idRegister)
                          .where((a) => a.tahun == widget.tahunchart)
                          .map((f) {
                        return f.total;
                      }).toList();
                      for (var i = 0; i < dataJanuari.length; i++) {
                        if (i < dataJanuari.length) {
                          totalbln1 += (dataJanuari.toString() == '[]')
                              ? 0
                              : int.parse(dataJanuari[i]);
                        }
                      }
                      for (var i = 0; i < dataFebruari.length; i++) {
                        if (i < dataFebruari.length) {
                          totalbln2 += (dataFebruari.toString() == '[]')
                              ? 0
                              : int.parse(dataFebruari[i]);
                        }
                      }
                      for (var i = 0; i < dataMaret.length; i++) {
                        if (i < dataMaret.length) {
                          totalbln3 += (dataMaret.toString() == '[]')
                              ? 0
                              : int.parse(dataMaret[i]);
                        }
                      }
                      for (var i = 0; i < dataApril.length; i++) {
                        if (i < dataApril.length) {
                          totalbln4 += (dataApril.toString() == '[]')
                              ? 0
                              : int.parse(dataApril[i]);
                        }
                      }
                      for (var i = 0; i < dataMei.length; i++) {
                        if (i < dataMei.length) {
                          totalbln5 += (dataMei.toString() == '[]')
                              ? 0
                              : int.parse(dataMei[i]);
                        }
                      }
                      for (var i = 0; i < dataJuni.length; i++) {
                        if (i < dataJuni.length) {
                          totalbln6 += (dataJuni.toString() == '[]')
                              ? 0
                              : int.parse(dataJuni[i]);
                        }
                      }
                      for (var i = 0; i < dataJuli.length; i++) {
                        if (i < dataJuli.length) {
                          totalbln7 += (dataJuli.toString() == '[]')
                              ? 0
                              : int.parse(dataJuli[i]);
                        }
                      }
                      for (var i = 0; i < dataAgustus.length; i++) {
                        if (i < dataAgustus.length) {
                          totalbln8 += (dataAgustus.toString() == '[]')
                              ? 0
                              : int.parse(dataAgustus[i]);
                        }
                      }
                      for (var i = 0; i < dataSeptember.length; i++) {
                        if (i < dataSeptember.length) {
                          totalbln9 += (dataSeptember.toString() == '[]')
                              ? 0
                              : int.parse(dataSeptember[i]);
                        }
                      }
                      for (var i = 0; i < dataOktober.length; i++) {
                        if (i < dataOktober.length) {
                          totalbln10 += (dataOktober.toString() == '[]')
                              ? 0
                              : int.parse(dataOktober[i]);
                        }
                      }
                      for (var i = 0; i < dataNovember.length; i++) {
                        if (i < dataNovember.length) {
                          totalbln11 += (dataNovember.toString() == '[]')
                              ? 0
                              : int.parse(dataNovember[i]);
                        }
                      }
                      for (var i = 0; i < dataDesember.length; i++) {
                        if (i < dataDesember.length) {
                          totalbln12 += (dataDesember.toString() == '[]')
                              ? 0
                              : int.parse(dataDesember[i]);
                        }
                      }
                      var totalPenjualan=totalbln1+totalbln2+totalbln3+totalbln4+totalbln5+totalbln6+totalbln7+totalbln8+totalbln9+totalbln10+totalbln11+totalbln12;
                      var status;
                      var bintang;
                      if(totalPenjualan<=25000000){
                        status='Usaha Mikro';
                        bintang=Row(
                          children: <Widget>[
                            Icon(Icons.star,size: 15,),
                          ],
                        );

                      }if(totalPenjualan<=210000000 && totalPenjualan>=25000000){
                          status='Usaha Kecil';
                            bintang=Row(
                          children: <Widget>[
                            Icon(Icons.star,size: 15,),
                            Icon(Icons.star,size: 15,),
                          ],
                        );

                      }if(totalPenjualan<=4170000000 && totalPenjualan>=210000000){
                          status='Usaha Menengah';
                          bintang=Row(
                          children: <Widget>[
                            Icon(Icons.star,size: 15,),
                            Icon(Icons.star,size: 15,),
                            Icon(Icons.star,size: 15,),
                          ],
                        );

                      }
                      _generateData(
                          totalbln1,
                          totalbln2,
                          totalbln3,
                          totalbln4,
                          totalbln5,
                          totalbln6,
                          totalbln7,
                          totalbln8,
                          totalbln9,
                          totalbln10,
                          totalbln11,
                          totalbln12);

                      return Column(
                        children: <Widget>[
                          // DropdownButton<String>(
                          //   value: apiprovider.tahun,
                          //   icon: Icon(Icons.arrow_downward),
                          //   iconSize: 24,
                          //   elevation: 16,
                          //   style: TextStyle(color: Colors.black),
                          //   underline: Container(
                          //     height: 2,
                          //     color: Colors.black,
                          //   ),
                          //   onChanged: (String newValue) {
                          //     apiprovider.tahun = newValue.toString();
                          //   },
                          //   items: ['2019', '2020', '2021']
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                          // Text('${apiprovider.tahun}'),
                          Expanded(
                            child: charts.BarChart(
                              _seriesData,
                              animate: true,
                              barGroupingType: charts.BarGroupingType.grouped,
                              //behaviors: [new charts.SeriesLegend()],
                              animationDuration: Duration(seconds: 1),
                            ),
                          ),
                          Expanded(
                            child: charts.BarChart(
                              _seriesData2,
                              animate: true,
                              barGroupingType: charts.BarGroupingType.grouped,
                              //behaviors: [new charts.SeriesLegend()],
                              animationDuration: Duration(seconds: 1),
                            ),
                          ),
                         
                          ListTile(
                            title: Text('Total Penjualan : '),
                            trailing: Text('${totalPenjualan}'),
                          ),
                          // ListTile(
                          //   title:  Row(
                          //   children: <Widget>[
                          //     Text('${status}'),
                          //     Text(' ('),
                          //     bintang,
                          //     Text(' )'),

                          //   ],
                          // )
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(left:17.0),
                            child: Row(
                              children: <Widget>[
                                Text('${status}'),
                                Text(' ('),
                                bintang,
                                Text(' )'),

                              ],
                            ),
                          )
                         
                          
                           
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                  }),
            ),
          ),
        ),
      ),
    )
    );
  }
}

class Pollution {
  String place;
  Color year;
  int quantity;

  Pollution(this.year, this.place, this.quantity);
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}

class Sales {
  int yearval;
  int salesval;

  Sales(this.yearval, this.salesval);
}
