import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:toko_gitar_flutter/Response/Transaksi.dart';
import 'package:toko_gitar_flutter/Screens/Features/USERS/Transaksi/DetailTransaksi.dart';
import 'package:quantity_input/quantity_input.dart';
import '../../API/RestApi.dart';
import '../../Response/Keranjang.dart';
import '../../main.dart';
import '../../utils/constants.dart';

class TransaksiScreens extends StatefulWidget {
  @override
  _TransaksiScreens createState() => _TransaksiScreens();
}

class _TransaksiScreens extends State<TransaksiScreens> {
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataTransaksi = [];
  late bool status = false;
  var user = jsonDecode(dataUserLogin);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
          child: Text(
            "Data Transaksi Anda",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        // tarok disini
        isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListView.separated(
                    itemCount: dataTransaksi == null ? 0 : dataTransaksi.length,
                    shrinkWrap: true,
                    primary: false,
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return _transaksi(
                        dataTransaksi[index]['_id'],
                        dataTransaksi[index]['grandTotal'],
                        dataTransaksi[index],
                        index,
                      );
                    },
                  ),
                  SizedBox(height: 15.0)
                ],
              ),
      ],
    );
  }

  Widget _transaksi(String id, total, data, int index) {
    return FadeInDown(
      duration: Duration(milliseconds: 350 * index),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  id,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Total " + CurrencyFormat.convertToIdr(total, 2),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DetailTransaksiPage.routeName, arguments: data);
                  },
                  child: Chip(
                    padding: EdgeInsets.all(0),
                    backgroundColor: kPrimaryColor,
                    avatar: Icon(
                      Icons.remove_red_eye_sharp,
                      color: Colors.white,
                    ),
                    label:
                        Text('Detail', style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }

  // mengambil data barang dari API
  Future<String> getData() async {
    setState(() {
      isLoading = true;
    });

    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8',
    };
    try {
      final response =
          await http.get("${getTransaksi}/${user['_id']}", headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        if (status == true) {
          dataTransaksi = List<Map<String, dynamic>>.from(
              json.decode(response.body)['data']);
          print(dataTransaksi);
        } else {
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.WARNING,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: responseJson['msg'],
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.cancel,
                  onDissmissCallback: (type) {
                    SystemNavigator.pop();
                  },
                  btnOkColor: kColorYellow)
              .show();
        }
      });
    } catch (e) {
      print(e);
      if (mounted) {
        setState(() {
          status = false;
          isLoading = false;
          AwesomeDialog(
                  context: context,
                  dialogType: DialogType.ERROR,
                  animType: AnimType.RIGHSLIDE,
                  headerAnimationLoop: true,
                  title: 'Peringatan',
                  desc: "Tidak dapat terhububg ke server",
                  btnOkOnPress: () {},
                  btnOkIcon: Icons.cancel,
                  onDissmissCallback: (type) async {
                    SystemNavigator.pop();
                  },
                  btnOkColor: kColorRedSlow)
              .show();
        });
      }
    }
    return 'success';
  }
}
