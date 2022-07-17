import 'package:flutter/material.dart';
import 'package:toko_gitar_flutter/utils/constants.dart';

class BottomNavigationUsers extends StatefulWidget {
  var _currentIndex = 0;
  Function onTabChange;

  BottomNavigationUsers(this._currentIndex, {required this.onTabChange});

  @override
  _BottomNavigationUsers createState() => _BottomNavigationUsers();
}

class _BottomNavigationUsers extends State<BottomNavigationUsers> {
  void _onItemTapped(int index) {
    setState(() {
      widget._currentIndex = index;
      widget.onTabChange(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    // print(widget._currentIndex);
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: mFillColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 15,
              offset: Offset(0, 5))
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: widget._currentIndex == 0
                ? Icon(Icons.home, color: kPrimaryColor)
                : Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 1
                ? Icon(Icons.add_shopping_cart_rounded, color: kPrimaryColor)
                : Icon(Icons.add_shopping_cart_rounded),
              label: "Keranjang"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 2
                ? Icon(Icons.shopping_cart, color: kPrimaryColor)
                : Icon(Icons.shopping_cart),
              label: "Transaksi"
          ),
          BottomNavigationBarItem(
            icon: widget._currentIndex == 3
                ? Icon(Icons.person, color: kPrimaryColor)
                : Icon(Icons.person),
            label: "Akun"
          ),
        ],
        currentIndex: widget._currentIndex,
        selectedItemColor: mBlueColor,
        unselectedItemColor: mSubtitleColor,
        onTap: _onItemTapped,
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        elevation: 0,
        showSelectedLabels: true,
      ),
    );
  }
}
