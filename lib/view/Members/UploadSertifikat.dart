import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class UploadSertifikat extends StatefulWidget {
  UploadSertifikat({Key key, this.namaPemilik, this.idRegister})
      : super(key: key);

  final String namaPemilik;
  final String idRegister;
  @override
  _UploadSertifikatState createState() => _UploadSertifikatState();
}

class _UploadSertifikatState extends State<UploadSertifikat> {
  String msg = '';
  Color warnapesan;
  Color _warnastatus=Colors.black12;
  File filesertifikat;
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  bool _hasValidMime = false;
  FileType _pickingType = FileType.ANY;
  TextEditingController _controller = TextEditingController();
    TextEditingController keteranganController = new TextEditingController();


  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  Future uploadsertifikat(var context) async {
    var responseJson;
    String url = "http://simadu.id/api/api_upload_sertifikat.php";
    // print(filesertifikat);
    var stream =
        http.ByteStream(DelegatingStream.typed(filesertifikat.openRead()));
    var len = await filesertifikat.length();
    var uri = Uri.parse(url);
    var req = http.MultipartRequest("POST", uri);
    var multifile = http.MultipartFile('file', stream, len,
        filename: basename(filesertifikat.path));
    req.fields['id_register'] = widget.idRegister;
    req.fields['keterangan'] = keteranganController.text == '' ? '' : keteranganController.text;
    req.fields['status'] = 'Sertifikat Anda Sudah Di Upload';
    req.files.add(multifile);

    responseJson = await req.send();

    if (responseJson.statusCode == '200') {
      setState(() {
        msg = "Maaf sertifikat gagal di upload";
        warnapesan = Colors.red;
      });
    } else {
      setState(() {
        msg = "Sertifikat Berhasil di Upload";
        warnapesan = Colors.lightBlue;
        _warnastatus = Colors.lightBlue;
        Future.delayed(
        Duration(seconds: 3),
        () {
          Navigator.pop(context);
        },
      );
      });
    }
  }

  void _openFileExplorer(var context) async {
    var temp;
    if (_pickingType != FileType.CUSTOM || _hasValidMime) {
      setState(() => _loadingPath = true);
      try {
        if (_multiPick) {
          _path = null;
          _paths = await FilePicker.getMultiFilePath(
              type: _pickingType, fileExtension: _extension);
          //  temp = await FilePicker.getFile(type: FileType.ANY);
        } else {
          _paths = null;
          // _path = await FilePicker.getFilePath(
          //     type: _pickingType, fileExtension: _extension);

          temp = await FilePicker.getFile(type: FileType.ANY);
        }
      } on PlatformException catch (e) {
        print("Unsupported operation" + e.toString());
      }
      if (!mounted) return;
      setState(() {
        _loadingPath = false;
        // _fileName = _path != null
        //     ? _path.split('/').last
        //     : _paths != null ? _paths.keys.toString() : '...';
        filesertifikat = temp;
      });

      uploadsertifikat(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Upload Sertifikat',
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        body: Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Padding(
              //   padding: const EdgeInsets.only(top: 20.0),
              //   child: DropdownButton(
              //       hint: Text('LOAD PATH FROM'),
              //       value: _pickingType,
              //       items: <DropdownMenuItem>[
              //         DropdownMenuItem(
              //           child: Text('FROM AUDIO'),
              //           value: FileType.AUDIO,
              //         ),
              //         DropdownMenuItem(
              //           child: Text('FROM IMAGE'),
              //           value: FileType.IMAGE,
              //         ),
              //         DropdownMenuItem(
              //           child: Text('FROM VIDEO'),
              //           value: FileType.VIDEO,
              //         ),
              //         DropdownMenuItem(
              //           child: Text('FROM ANY'),
              //           value: FileType.ANY,
              //         ),
              //         DropdownMenuItem(
              //           child: Text('CUSTOM FORMAT'),
              //           value: FileType.CUSTOM,
              //         ),
              //       ],
              //       onChanged: (value) => setState(() {
              //             _pickingType = value;
              //             // if (_pickingType != FileType.CUSTOM) {
              //             //   _controller.text = _extension = '';
              //             // }
              //           })),
              // ),
              // ConstrainedBox(
              //   constraints: BoxConstraints.tightFor(width: 100.0),
              //   child: _pickingType == FileType.CUSTOM
              //       ? TextFormField(
              //           maxLength: 15,
              //           autovalidate: true,
              //           controller: _controller,
              //           decoration:
              //               InputDecoration(labelText: 'File extension'),
              //           keyboardType: TextInputType.text,
              //           textCapitalization: TextCapitalization.none,
              //           validator: (value) {
              //             RegExp reg = RegExp(r'[^a-zA-Z0-9]');
              //             if (reg.hasMatch(value)) {
              //               _hasValidMime = false;
              //               return 'Invalid format';
              //             }
              //             _hasValidMime = true;
              //             return null;
              //           },
              //         )
              //       : Container(),
              // ),
              // ConstrainedBox(
              //   constraints: BoxConstraints.tightFor(width: 200.0),
              //   child: SwitchListTile.adaptive(
              //     title:
              //         Text('Pick multiple files', textAlign: TextAlign.right),
              //     onChanged: (bool value) => setState(() => _multiPick = value),
              //     value: _multiPick,
              //   ),
              // ),
              
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                child: Text('Keterangan :'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: TextField(
                  controller: keteranganController,
                  decoration: InputDecoration(
                    // icon: Text('Lainnya :'),
                    hintText: 'Keterangan Sertifikat',
                    labelText: 'Keterangan',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 15.0,bottom: 5),
                child: Text('File Sertifikat (.PDF, .PNG, .JPG, .JPEG)'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 0.0, left: 15.0),
                child: RaisedButton(
                  onPressed: () => _openFileExplorer(context),
                  child: Text("Upload Sertifikat"),
                  textColor: Colors.black,
                  color: Colors.lightBlue,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                child: Text('Status :'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 25.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12, width: 1)),
                  child: Container(
                    width: 250,
                    color: _warnastatus,
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('Sertifikat Anda Sudah Di Upload'),
                   ))),
              ),
              // Text(msg,style: TextStyle(color: warnapesan)),
              Builder(
                builder: (BuildContext context) => _loadingPath
                    ? Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: const CircularProgressIndicator())
                    : _path != null || _paths != null
                        ? Container(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            height: MediaQuery.of(context).size.height * 0.50,
                            child: Scrollbar(
                                child: ListView.separated(
                              itemCount: _paths != null && _paths.isNotEmpty
                                  ? _paths.length
                                  : 1,
                              itemBuilder: (BuildContext context, int index) {
                                final bool isMultiPath =
                                    _paths != null && _paths.isNotEmpty;
                                final String name = 'Sertifikat : ' +
                                    (isMultiPath
                                        ? _paths.keys.toList()[index]
                                        : _fileName ?? '...');
                                final path = isMultiPath
                                    ? _paths.values.toList()[index].toString()
                                    : _path;

                                return ListTile(
                                  title: Text(
                                    name,
                                  ),
                                  subtitle: Text(path),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      Divider(),
                            )),
                          )
                        : Container(),
              ),
            ],
          ),
        ),
      ),);
  }
}
