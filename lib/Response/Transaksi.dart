import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toko_gitar_flutter/utils/utils_apps.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

import '../API/RestApi.dart';
import '../Screens/Features/USERS/HomeUsers.dart';

bool status = false;
int code = 0;
var responseJson;

class TransaksiResponse {

  //input keranjang
  static void inputTransaksiResponse(data, BuildContext context) async {
    utilsApps.showDialog(context);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map<String, String> headers = {
      'Content-Type': 'application/json;charset=UTF-8',
      'Charset': 'utf-8'
    };

    try {
      final response = await http.post(transaksiInput,
          headers: headers, body: jsonEncode(data));
      responseJson = json.decode(response.body);
      status = responseJson['status'];
      code = responseJson['code'];
      if (status == true) {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.SUCCES,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['msg'],
              btnOkOnPress: () {
                Navigator.pushNamed(context, HomeUsers.routeName,
                    arguments: {"index": 2});
              },
              btnOkIcon: Icons.check,
              btnOkColor: kPrimaryColor)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      } else {
        Future.delayed(Duration(seconds: 1)).then((value) {
          utilsApps.hideDialog(context);
          AwesomeDialog(
              context: context,
              dialogType: DialogType.WARNING,
              animType: AnimType.RIGHSLIDE,
              headerAnimationLoop: true,
              title: 'Peringatan',
              desc: responseJson['msg'],
              btnOkOnPress: () {},
              btnOkIcon: Icons.cancel,
              btnOkColor: kColorYellow)
              .show();
          // utilsApps.dengerSnack(context, responseJson['message']);
        });
      }
      // print(dataUser);
    } catch (e) {
      print(e);
      Future.delayed(Duration(seconds: 1)).then((value) {
        utilsApps.hideDialog(context);
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Peringatan',
            desc: "Terjadi kesalahan pada server",
            btnOkOnPress: () {},
            btnOkIcon: Icons.cancel,
            btnOkColor: kColorRedSlow)
            .show();
      });
    }
  }
}
