import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:toko_gitar_flutter/Components/extentions.dart';
import 'package:toko_gitar_flutter/Components/title_text.dart';
import 'package:toko_gitar_flutter/Screens/Features/USERS/HomeUsers.dart';
import 'package:toko_gitar_flutter/theme.dart';
import '../../API/RestApi.dart';
import '../../Screens/Features/USERS/DetailProduct/DetailScreens.dart';
import '../../utils/constants.dart';
import 'package:http/http.dart' as http;

class HomeUserComponent extends StatefulWidget {
  @override
  _HomeUserComponent createState() => _HomeUserComponent();
}

class _HomeUserComponent extends State<HomeUserComponent> {
  var isLoading = false;
  var responseJson;
  List<Map<String, dynamic>> dataBarang = [];
  List<Map<String, dynamic>> _foundBarang = [];
  late bool status = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      height: MediaQuery.of(context).size.height - 100,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 25),
            _title(),
            SizedBox(
              height: 10,
            ),
            _search(),
            Container(
              padding: EdgeInsets.only(left: 15, top: 15, right: 15),
              child: Row(
                children: [
                  TitleText(text: "Produk", fontSize: 14),
                  Spacer(),
                  TitleText(text: "Semua Produk", fontSize: 14)
                ],
              ),
            ),
            _productWidget(),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    ));
  }

  _title() {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                TitleText(
                  text: 'Produk',
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: 'Kami',
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            SizedBox()
          ],
        ));
  }

  Widget _icon(IconData icon, {Color color = iconColor}) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(13)),
          color: Colors.white,
          boxShadow: shadow),
      child: Icon(
        icon,
        color: color,
      ),
    ).ripple(() {}, borderRadius: BorderRadius.all(Radius.circular(13)));
  }

  Widget _productWidget() {
    return Container(
        width: fullWidth(context),
        height: fullHeight(context),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _foundBarang.isEmpty
                ? GridView.builder(
                    itemCount: dataBarang == null ? 0 : dataBarang.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return _productCard(
                          dataBarang[index]['namaBarang'],
                          // "assets/images/ibanez_product.jpg",
                          "$baseUrl/gambar-barang/${dataBarang[index]['gambar']}",
                          dataBarang[index]['kategoriBarang']['namaKategori'],
                          CurrencyFormat.convertToIdr(
                              dataBarang[index]['harga'], 2),
                          dataBarang[index]);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 5),
                  )
                : GridView.builder(
                    itemCount: _foundBarang == null ? 0 : _foundBarang.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (context, index) {
                      return _productCard(
                          _foundBarang[index]['namaBarang'],
                          // "assets/images/ibanez_product.jpg",
                          "$baseUrl/gambar-barang/${_foundBarang[index]['gambar']}",
                          _foundBarang[index]['kategoriBarang']['namaKategori'],
                          CurrencyFormat.convertToIdr(
                              _foundBarang[index]['harga'], 2),
                          dataBarang[index]);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.7,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 5),
                  ));
  }

  _productCard(name, image, category, price, data) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailProductscreens.routeName, arguments: data);
      },
      child: Container(
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xfff8f8f8), blurRadius: 15, spreadRadius: 10),
            ],
          ),
          margin: EdgeInsets.only(top: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Expanded(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: kPrimaryColor.withAlpha(40),
                          ),
                          Image.network(image)
                        ],
                      ),
                    ),
                    // SizedBox(height: 5),
                    TitleText(
                      text: name,
                      fontSize: 16,
                    ),
                    TitleText(
                      text: category,
                      fontSize: 14,
                      color: kPrimaryColor,
                    ),
                    TitleText(
                      text: price.toString(),
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }

  Widget _search() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: lightGrey.withAlpha(100),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: TextField(
                onChanged: (value) => {
                  // print(value)
                  _runFilter(value)
                },
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Cari Produk",
                    hintStyle: TextStyle(fontSize: 12),
                    contentPadding:
                        EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 5),
                    prefixIcon: Icon(Icons.search, color: Colors.black54)),
              ),
            ),
          ),
          SizedBox(width: 20),
          _icon(Icons.filter_list, color: Colors.black54)
        ],
      ),
    );
  }

  // search func
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = dataBarang;
    } else {
      results = dataBarang
          .where((data) => data["namaBarang"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();

      // we use the toLowerCase() method to make it case-insensitive
    }
    // Refresh the UI
    setState(() {
      _foundBarang = results;
    });
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
      final response = await http.get("${dataBarangRes}", headers: headers);
      responseJson = json.decode(response.body);

      setState(() {
        isLoading = false;
        status = responseJson['status'];
        if (status == true) {
          dataBarang = List<Map<String, dynamic>>.from(
              json.decode(response.body)['data']);
          print(dataBarang);
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
