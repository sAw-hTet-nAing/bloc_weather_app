import 'package:bloc_weather_app/repos/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'home_even.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepo homeRepo;
  final BuildContext context;
  HomeBloc({required this.homeRepo, required this.context})
      : super(HomeLoadingState()) {
    on<LoadUserLocationEvent>(
      (event, emit) async {
        emit(HomeLoadingState());
      },
    );
    on<LoadHomeEvent>(
      (event, emit) async {
        try {
          final currentWeather = await homeRepo.getCurrentWeather();
          final focastWeather = await homeRepo.getForcast();
          emit(HomeLoadedState(currentWeather, focastWeather));
        } catch (e) {
          emit(HomeErrorState(e.toString()));
        }
      },
    );
  }
}
