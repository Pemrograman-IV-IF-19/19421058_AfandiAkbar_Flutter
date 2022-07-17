import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:toko_gitar_flutter/Components/Register/RegisterForm.dart';
import 'package:toko_gitar_flutter/size_config.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

class RegisterComponent extends StatefulWidget{
  @override
  _RegisterComponent createState() => _RegisterComponent();
}

class _RegisterComponent extends State<RegisterComponent>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
             horizontal: getProportionateScreenHeight(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04
                ),
                Padding(padding: EdgeInsets.only(left: 10),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Registrasi', style: mTitleStyle18),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Registerform()
              ],
            ),
          ),
        ),
      ),
        
    );
  }
}