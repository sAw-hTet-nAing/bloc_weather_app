import 'package:bloc_weather_app/utils/app_color.dart';
import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:bloc_weather_app/utils/text_style.dart';
import 'package:bloc_weather_app/widgets/rectangle_cart.dart';
import 'package:flutter/material.dart';

Widget forecastTitleWidget() {
  return RectangleCard(
    color: AppColor.topGr,
    width: 0.0,
    widget: Container(
      width: Dimesion.screenWidth * 0.45,
      padding: EdgeInsets.all(Dimesion.width5),
      child: Row(
        children: [
          Icon(
            Icons.calendar_month_rounded,
            color: Colors.white,
            size: Dimesion.iconSize16,
          ),
          SizedBox(
            width: Dimesion.width10,
          ),
          Text(
            "WEEK FORECAST",
            style: MyTextStyle.normalText,
          )
        ],
      ),
    ),
  );
}
