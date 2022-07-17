import 'package:flutter/material.dart';

import '../../../size_config.dart';
import '../../Components/Login/LoginComponent.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: LoginComponent(),
    );
  }
}
