import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:bloc_weather_app/utils/text_style.dart';
import 'package:flutter/material.dart';

Widget mainButton(
    {required String text,
    required double width,
    required VoidCallback ontap,
    required Color color,
    required double radius,
    required double height}) {
  return MaterialButton(
    onPressed: ontap,
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)),
    child: Container(
        height: height,
        padding: EdgeInsets.symmetric(
            horizontal: Dimesion.width10, vertical: Dimesion.height10),
        width: width,
        alignment: Alignment.center,
        child: Text(
          text,
          style: MyTextStyle.normalText,
        )),
  );
}
