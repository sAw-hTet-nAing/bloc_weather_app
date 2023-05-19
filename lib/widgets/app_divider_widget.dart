import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:flutter/material.dart';

Widget appDividerWidget() {
  return Divider(
    height: Dimesion.height10,
    color: Colors.grey,
    thickness: 1,
    endIndent: Dimesion.width10,
    indent: Dimesion.width10,
  );
}
