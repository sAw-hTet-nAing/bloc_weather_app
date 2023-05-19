// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:flutter/material.dart';

class RectangleCard extends StatelessWidget {
  const RectangleCard(
      {Key? key,
      required this.widget,
      this.color,
      this.width,
      this.vert,
      this.radius})
      : super(key: key);
  final Widget widget;
  final color;
  final width;
  final radius;
  final vert;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: width ?? Dimesion.width10, vertical: vert ?? 0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? Dimesion.radius15 / 2)),
      color: color ?? Colors.white,
      // shadowColor: Colors.white,
      child: widget,
    );
  }
}
