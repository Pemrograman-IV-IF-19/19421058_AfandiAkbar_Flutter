// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Screens/Login/LoginScreens.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../main.dart';
import 'image_circle.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {

  var user = jsonDecode(dataUserLogin);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            toolbarHeight: 10,
          ),
          Center(
              child: Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor,
                    ),
                  ))),
          CircleAvatar(
            radius: 75,
            backgroundImage: AssetImage('assets/images/profile.png'),
            backgroundColor: Colors.transparent,
          ),
          SizedBox(
            height: 40,
          ),
          buildUserInfoDisplay(user['namaLengkap'], 'Nama Lengkap'),
          buildUserInfoDisplay(user['userName'], 'Username'),
          buildUserInfoDisplay(user['email'], 'Email'),
          GestureDetector(
            onTap: () {
              AwesomeDialog(
                context: context,
                dialogType: DialogType.WARNING,
                animType: AnimType.RIGHSLIDE,
                headerAnimationLoop: true,
                title: 'Peringatan',
                desc: "Yakin ingin keluar",
                btnOkOnPress: () async {
                  final pref = await SharedPreferences.getInstance();
                  await pref.clear();
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.routeName, (r) => false);
                },
                btnOkIcon: Icons.check,
                btnOkColor: kColorTealToSlow,
                btnCancelOnPress: () async {},
                btnCancelIcon: Icons.cancel,
                btnCancelColor: kColorRedSlow,
              ).show();
            },
            child: logOut("Keluar"),
          )
        ],
      ),
    );
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title) => Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
              width: 350,
              height: 40,
              child: Text(
                getValue,
                style: TextStyle(fontSize: 16, height: 1.4),
              )),
        ],
      ));

  Widget logOut(String title) => Padding(
      padding: EdgeInsets.only(bottom: 10, left: 16, right: 16),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: kFourthColor,
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            Spacer(),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
              size: 40.0,
            )
          ],
        ),
      ));
}
