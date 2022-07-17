import 'package:flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

ProgressDialog? pr;

class utilsApps {
  static void dengerSnack(BuildContext context, String text) {
    Flushbar(
      message: text,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(color: Colors.red, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.black, Colors.blueGrey]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.error,
        color: Colors.red,
      ),
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Peringatan !",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.red,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    ).show(context);
  }

  static void dengerSnackWithDuration(
      BuildContext context, String text, var duration) {
    Flushbar(
      message: text,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(color: Colors.red, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.black, Colors.blueGrey]),
      isDismissible: false,
      duration: Duration(seconds: duration),
      icon: Icon(
        Icons.error,
        color: Colors.red,
      ),
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Peringatan !",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.red,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    ).show(context);
  }

  static String displayTimeAgoFromTimestamp(String dateString,
      {bool numericDates = true}) {
    //DateTime tempDate = new DateFormat("yyyy-MM-DDTHH:mm:ss").parse
    DateTime date = new DateFormat("yyyy-MM-DDTHH:mm:ss")
        .parse(dateString, numericDates)
        .toLocal();
    print(date);
    final date2 = DateTime.now().toLocal();
    final difference = date2.difference(date);

    if ((difference.inDays / 365).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} tahun lalu';
    } else if ((difference.inDays / 365).floor() >= 1) {
      return (numericDates) ? '1 tahun yang lalu' : 'Tahun lalu';
    } else if ((difference.inDays / 30).floor() >= 2) {
      return '${(difference.inDays / 365).floor()} bulan yang lalu';
    } else if ((difference.inDays / 30).floor() >= 1) {
      return (numericDates) ? '1 bulan yang lalu' : 'Sebulan yang lalu';
    } else if ((difference.inDays / 7).floor() >= 2) {
      return '${(difference.inDays / 7).floor()} minggu lalu';
    } else if ((difference.inDays / 7).floor() >= 1) {
      return (numericDates) ? '1 minggu yang lalu' : 'minggu lalu';
    } else if (difference.inDays >= 2) {
      return '${difference.inDays} hari yang lalu';
    } else if (difference.inDays >= 1) {
      return (numericDates) ? '1 hari yang lalu' : 'Kemarin';
    } else if (difference.inHours >= 2) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inHours >= 1) {
      return (numericDates) ? '1 jam yang lalu' : 'Sejam yang lalu';
    } else if (difference.inMinutes >= 2) {
      return '${difference.inMinutes} menit yang lalu';
    } else if (difference.inMinutes >= 1) {
      return (numericDates) ? '1 menit yang lalu' : 'Semenit yang lalu';
    } else if (difference.inSeconds >= 3) {
      return 'Beberapa detik yang lalu';
    } else {
      return 'Baru Saja';
    }
  }

  static void successSnack(BuildContext context, String text) {
    Flushbar(
      message: text,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(color: Colors.red, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient: LinearGradient(colors: [Colors.green, Colors.green]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.check,
        color: Colors.white,
      ),
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Peringatan !",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    ).show(context);
  }

  static void successDownloadSnack(
      BuildContext context, String text, String path) {
    Flushbar(
      message: text,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(color: Colors.red, offset: Offset(0.0, 2.0), blurRadius: 3.0)
      ],
      backgroundGradient: LinearGradient(colors: [Colors.green, Colors.green]),
      isDismissible: false,
      duration: Duration(seconds: 2),
      icon: Icon(
        Icons.check,
        color: Colors.white,
      ),
      showProgressIndicator: false,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Peringatan !",
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    ).show(context).then((r) => {
          // print(path)
          openFile(path)
        });
  }

  static void openFile(String path) async {
    // await OpenFile.open(path);
  }

  static void showDialog(BuildContext context) {
    pr = new ProgressDialog(context);
    pr!.show();
  }

  static void hideDialog(BuildContext context) {
    pr = new ProgressDialog(context);
    pr!.hide();
  }
}
