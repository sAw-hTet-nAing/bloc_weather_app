import 'dart:convert';

import 'package:bloc_weather_app/modles/current_weather_model.dart';
import 'package:bloc_weather_app/modles/focast_weather_model.dart';
import 'package:bloc_weather_app/utils/app_constants.dart';

import 'package:http/http.dart';

class HomeRepo {
  Future<CurrentWeatherModel> getCurrentWeather({required String q}) async {
    String endPoint = "current.json?key=${AppConstant.apiKey}&q=$q&aqi=yes";
    Response response = await get(Uri.parse("${AppConstant.baseUrl}$endPoint"));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      final data = CurrentWeatherModel.fromJson(json);
      return data;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Future<FocastWeatherModel> getForcast({required String q}) async {
    String endPoint =
        "forecast.json?key=${AppConstant.apiKey}&q=$q&days=7&aqi=no&alerts=no";

    Response response = await get(Uri.parse("${AppConstant.baseUrl}$endPoint"));

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      final data = FocastWeatherModel.fromJson(json);
      return data;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
