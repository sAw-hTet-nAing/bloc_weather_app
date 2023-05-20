// ignore_for_file: use_build_context_synchronously

import 'package:bloc_weather_app/repos/splash_repo.dart';

import 'package:bloc_weather_app/screens/home_screen/home_screen.dart';
import 'package:bloc_weather_app/screens/splash_screen/splash_event.dart';
import 'package:bloc_weather_app/screens/splash_screen/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class SplasBloc extends Bloc<SplashEvent, SplashState> {
  final SplashRepo splashRepo;
  final BuildContext context;
  SplasBloc({required this.splashRepo, required this.context})
      : super(SplashLoadingState()) {
    on<LoadSplashEvent>(
      (event, emit) async {
        emit(SplashLoadingState());
        bool hasPermison = await splashRepo.handleLocationPermission(context);
        if (hasPermison) {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);

          emit(SplashLoadedState());

          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => HomeScreen(
                        position: position,
                      )));
        } else {
          emit(SplashErrorState("No permission"));
        }
      },
    );
  }
  Future<void> getPosition(BuildContext context, Position position) async {}
}
