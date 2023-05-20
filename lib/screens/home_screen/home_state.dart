// ignore_for_file: use_build_context_synchronously

import 'package:bloc_weather_app/modles/current_weather_model.dart';
import 'package:bloc_weather_app/modles/focast_weather_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

@immutable
abstract class HomeState extends Equatable {}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class GetUserLocationState extends HomeState {
  GetUserLocationState(this.position);
  final Position position;
  @override
  List<Object?> get props => throw UnimplementedError();
}

class HomeLoadedState extends HomeState {
  HomeLoadedState(this.currentWeather, this.focastWeatherModel, this.isFav);
  final CurrentWeatherModel currentWeather;
  final FocastWeatherModel focastWeatherModel;
  final bool isFav;
  @override
  List<Object?> get props => [currentWeather, focastWeatherModel, isFav];
}

class HomeErrorState extends HomeState {
  HomeErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
