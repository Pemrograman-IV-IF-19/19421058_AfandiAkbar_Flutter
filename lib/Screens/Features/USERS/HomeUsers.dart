import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/BottomNavigationBar/bottom_navigation_users.dart';
import 'package:toko_gitar_flutter/Screens/Features/USERS/Transaksi/Transaksi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../size_config.dart';
import '../../../main.dart';
import 'HomePage/HomeUsersPage.dart';
import 'Keranjang/Keranjang.dart';
import 'Profile/ProfilePage.dart';

class HomeUsers extends StatefulWidget {
  static String routeName = "/home_users";

  @override
  _HomeUsers createState() => _HomeUsers();
}

class _HomeUsers extends State<HomeUsers> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _selectedIndex;
  var lastIndex;
  var args;

  _getDataUsers() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    dataUserLogin = sharedPreferences.getString("dataUser");
  }

  getCurrentPage(int index) {
    if (index == null || index == "null") {
      index = 0;
      _selectedIndex = 0;
      return HomeUsersPage();
    }
    if (index == 0) {
      return HomeUsersPage();
    } else if (index == 1) {
      return KerangjangPage();
    } else if (index == 2) {
      return TransaksiPage();
    } else if (index == 3) {
      return ProfilePage();
    } else {
      index = 0;
      return HomeUsersPage();
    }

  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)?.settings.arguments;
        if (args != null) {
          // int to = args['to'];
          _selectedIndex = args['index'];
        }else {
          _selectedIndex = 0;
        }
      });
    });
    setState(() {
      this._getDataUsers();
      _selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      // Setting up AppBar
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          getCurrentPage(_selectedIndex),
        ],
      ),
      bottomNavigationBar:
          BottomNavigationUsers(_selectedIndex, onTabChange: (index) {
        _selectedIndex = index;
        setState(() {});
        if (_selectedIndex == 3 && _selectedIndex == lastIndex) {}
        lastIndex = index;
      }),
    );
  }
}
