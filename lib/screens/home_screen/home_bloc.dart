import 'dart:async';

import 'package:bloc_weather_app/repos/home_repo.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_even.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  final BuildContext context;

  late final StreamSubscription otherBlocSubscription;

  HomeBloc({
    required this.homeRepo,
    required this.context,
  }) : super(HomeLoadingState()) {
    on<LoadedHomeEvent>((event, emit) async {
      emit(HomeLoadingState());
      // print(event.position);

      try {
        final currentWeather = await homeRepo.getCurrentWeather(
            q: "${event.position.latitude}, ${event.position.longitude}");
        final focastWeather = await homeRepo.getForcast(
            q: "${event.position.latitude}, ${event.position.longitude}");
        emit(HomeLoadedState(currentWeather, focastWeather));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }
}
