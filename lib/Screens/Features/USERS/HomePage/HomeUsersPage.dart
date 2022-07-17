import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/HomeUsers/HomeUsersScreeens.dart';
import 'package:toko_gitar_flutter/Components/headers_for_home.dart';

import '../../../../size_config.dart';

class HomeUsersPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HeadersForHome("Toko Gitar"),
      ),
      body: HomeUserComponent()
    );
  }
}
