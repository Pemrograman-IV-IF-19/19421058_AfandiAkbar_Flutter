import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/Register/RegisterComponent.dart';
import 'package:toko_gitar_flutter/size_config.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

class RegisterScreen extends StatelessWidget{

  static String routeName = '/sign_up';

  @override
  Widget build(BuildContext context){
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: RegisterComponent(),
    );
  }
}