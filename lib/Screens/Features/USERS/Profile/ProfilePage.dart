import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/headers_for_home.dart';

import '../../../../Components/Profile/ProfileScreens.dart';
import '../../../../size_config.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          // title: HeadersForHome("Profile"),
        ),
        body: ProfileScreen()
    );
  }
}
