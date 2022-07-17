import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/custom_surfix_icon.dart';
import 'package:toko_gitar_flutter/Components/default_button-custom_color.dart';
import 'package:toko_gitar_flutter/Screens/Login/LoginScreens.dart';
import 'package:toko_gitar_flutter/Screens/Register/Registrasi.dart';
import 'package:toko_gitar_flutter/Response/UsersResponse.dart';
import 'package:toko_gitar_flutter/size_config.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

class Registerform extends StatefulWidget {
  @override
  _Registerform createState() => _Registerform();
}

class _Registerform extends State<Registerform> {
  
  final _formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  bool? remember = false;

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController 
      txtNamalengkap = TextEditingController(),
      txtUsername = TextEditingController(),
      txtEmail = TextEditingController(),
      txtPassword = TextEditingController();


 
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildNamaLengkap(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildUserName(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmail(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPassword(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text:'Register',
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                LoginResponse.registerResponse({
                  "userName": txtUsername.text,
                  "password": txtPassword.text,
                  "namaLengkap": txtNamalengkap.text,
                  "email": txtEmail.text,
                  "role" : "user"
                }, context);
              }
            },
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LoginScreen.routeName);
            },
            child: const Text(
              "Sudah Punya Akun ? Masuk Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      )
    );
  }

  TextFormField buildNamaLengkap() {
    return TextFormField(
      controller: txtNamalengkap,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => username = newValue,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Nama Lengkap',
        hintText: 'Masukkan Nama Lengkap',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/User.svg",
            )
      ),
    );
  }

  TextFormField buildUserName() {
    return TextFormField(
      controller: txtUsername,
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      onSaved: (newValue) => username = newValue,
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

  TextFormField buildEmail() {
    return TextFormField(
      controller: txtEmail,
      keyboardType: TextInputType.text,
      onSaved: (newValue) => username = newValue,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'Masukkan Email Lengkap',
        labelStyle: TextStyle(
          color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
            )
      ),
    );
  }

  TextFormField buildPassword() {
    return TextFormField(
      controller: txtPassword,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
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