import 'package:bloc_weather_app/utils/app_color.dart';
import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:flutter/material.dart';

Widget backButton(BuildContext context) {
  return IconButton(
      onPressed: () => Navigator.pop(context),
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: AppColor.primary,
        size: Dimesion.iconSize16,
      ));
}
