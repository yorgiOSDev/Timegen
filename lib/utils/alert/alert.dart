import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'awesome_snack_bar_utils.dart';

class Alert {
  static SnackBar awesomeSnackBar({
    String? title,
    String? message,
    required AWESOMESNACKBARTYPE type,
  }) =>
      SnackBar(
        elevation: 0,
        clipBehavior: Clip.none,
        margin: EdgeInsets.only(left: 0, right: 0),
        padding: const EdgeInsets.all(0),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
         content: Builder(
           builder: (context) {
             return Container(
              decoration: BoxDecoration(
              color:type.defaultColor ),
              child: Row(
                children: [
                  Flexible(child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                    child: Text(context.tr(message ?? type.defaultMessage,),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)))
                ],
             ),);
           }
         )
      );
}
