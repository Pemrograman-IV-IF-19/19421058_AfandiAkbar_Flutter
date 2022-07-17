import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/Components/title_text.dart';

class HeadersForSubMenu extends StatefulWidget {
  final String menu;
  HeadersForSubMenu(this.menu, {Key? key}) : super(key: key);
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<HeadersForSubMenu> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
              // size: 15,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          TitleText(
            text: widget.menu,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
