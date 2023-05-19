import 'package:bloc_weather_app/screens/home_screen/home_widgets/percent_widget.dart';

import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:bloc_weather_app/utils/text_style.dart';
import 'package:flutter/material.dart';

Widget currentWeatherWidget(
    {required String cityName,
    required double temp,
    required int humidity,
    required String conditionText,
    required int cloud,
    required String icon}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.center,
        child: Text(
          cityName,
          style: MyTextStyle.titleText,
        ),
      ),
      SizedBox(
        height: Dimesion.height10,
      ),
      Text(
        "${double.parse(temp.toString()).toStringAsFixed(0)} \u2103",
        style: MyTextStyle.tempText,
      ),
      SizedBox(
        height: Dimesion.height10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            conditionText,
            style: MyTextStyle.labelText,
          ),
          SizedBox(
              height: Dimesion.height20,
              width: Dimesion.height20,
              child: Image.network("https:$icon")),
        ],
      ),
      SizedBox(
        height: Dimesion.height10,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          percentWidget(value: humidity, title: "Humidity"),
          SizedBox(
            width: Dimesion.width10,
          ),
          Container(
            width: 2,
            height: Dimesion.height30,
            decoration: const BoxDecoration(
                border: Border(left: BorderSide(color: Colors.grey))),
          ),
          SizedBox(
            width: Dimesion.width10,
          ),
          percentWidget(value: cloud, title: "Cloud"),
        ],
      )
    ],
  );
}