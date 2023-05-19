import 'package:bloc_weather_app/utils/app_color.dart';
import 'package:bloc_weather_app/utils/dimesions.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Widget appLoadingWidget() {
  return Center(
    child: LoadingAnimationWidget.inkDrop(
        color: AppColor.primary, size: Dimesion.iconSize16),
  );
}
