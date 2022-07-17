import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Screens/Features/USERS/HomeUsers.dart';

import '../../Response/UsersResponse.dart';
import '../../Screens/Register/Registrasi.dart';
import '../../size_config.dart';
import '../../utils/constants.dart';
import '../custom_surfix_icon.dart';
import '../default_button_custome_color.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;

  FocusNode focusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
  }

  TextEditingController txtUserName = TextEditingController(),
      txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildUserNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: mTitleColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Tetap Masuk"),
              const Spacer(),
              GestureDetector(
                onTap: () {},
                child: const Text(
                  "Lupa Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          DefaultButtonCustomeColor(
            color: kPrimaryColor,
            text: "MASUK",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                // Navigator.pushNamed(context, HomeUsers.routeName);
                LoginResponse.loginResponse({
                  "userName": txtUserName.text,
                  "password": txtPassword.text,
                }, context);
              }
            },
          ),
          SizedBox(height: 20,),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, RegisterScreen.routeName);
            },
            child: const Text(
              "Belum punya akun ? Daftar Disini",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: txtPassword,
      onSaved: (newValue) => password = newValue,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Masukan password anda",
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildUserNameFormField() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: txtUserName,
      onSaved: (newValue) => email = newValue,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: "Username",
        hintText: "Masukan username anda",
        labelStyle: TextStyle(
            color: focusNode.hasFocus ? mSubtitleColor : kPrimaryColor),
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
