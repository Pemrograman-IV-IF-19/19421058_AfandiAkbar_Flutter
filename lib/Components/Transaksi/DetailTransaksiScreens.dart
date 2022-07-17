import 'dart:convert';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../API/RestApi.dart';
import '../../Screens/Features/USERS/Transaksi/DetailTransaksi.dart';
import '../../utils/constants.dart';

class DetailTransaksiScreens extends StatefulWidget {
  @override
  _DetailTransaksiScreens createState() => _DetailTransaksiScreens();
}

class _DetailTransaksiScreens extends State<DetailTransaksiScreens> {
  var detailTransaksi = [];

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
    detailTransaksi = DetailTransaksiPage.dataTransaksi['detailTransaksi'];
  }

  Widget getBody() {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 30),
          child: Text(
            "ID ${DetailTransaksiPage.dataTransaksi['_id']}",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        // tarok disini
        ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListView.separated(
              itemCount: detailTransaksi == null ? 0 : detailTransaksi.length,
              shrinkWrap: true,
              primary: false,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 5,
                );
              },
              itemBuilder: (context, index) {
                return _detailTransaksi(
                  "$baseUrl/gambar-barang/${detailTransaksi[index]['barang']['gambar']}",
                  detailTransaksi[index]['barang']['namaBarang'],
                  detailTransaksi[index]['barang']['harga'],
                  detailTransaksi[index]['jumlahBeli'],
                  detailTransaksi[index]['subtotal'],
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

  Widget _detailTransaksi(
      String gambar, String nama, harga, jumlahBeli, subTotal, int index) {
    return FadeInDown(
      duration: Duration(milliseconds: 350 * index),
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 0.5,
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 1)
                  ],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 25, right: 25, bottom: 25),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        width: 110,
                        height: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                          image: NetworkImage(gambar),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  CurrencyFormat.convertToIdr(harga, 2),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Jumlah Beli $jumlahBeli',
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Total " + CurrencyFormat.convertToIdr(subTotal, 2),
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
