import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/custom_surfix_icon.dart';
import 'package:toko_gitar_flutter/Components/default_button-custom_color.dart';
import 'package:toko_gitar_flutter/Screens/Register/Registrasi.dart';
import 'package:toko_gitar_flutter/size_config.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

class SignInform extends StatefulWidget {
  @override
  _SignInform createState() => _SignInform();
}

class _SignInform extends State<SignInform> {
  
  final _formkey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;

  TextEditingController txtUsername = TextEditingController(),
      txtPassword = TextEditingController();

  FocusNode focusNode = new FocusNode();
 
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember, 
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                }
              ),
              Text('Tetap Masuk'),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Lupa Password?',
                  style: TextStyle(decoration: TextDecoration.underline),
                )
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text:'MASUK',
            press: () {},
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: Text(
              "Belum Punya Akun ? Daftar",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      )
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukkan Username Anda',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
            )
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukkan Password Anda',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
            )
      ),
    );
  }
}