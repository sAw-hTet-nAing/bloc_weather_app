import 'dart:async';

import 'package:bloc_weather_app/modles/db_model.dart';
import 'package:bloc_weather_app/repos/home_repo.dart';
import 'package:bloc_weather_app/services/db_services.dart';

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
      bool isFav = event.isFav;
      emit(HomeLoadingState());

      try {
        final currentWeather = await homeRepo.getCurrentWeather(
            q: "${event.position.latitude}, ${event.position.longitude}");
        final focastWeather = await homeRepo.getForcast(
            q: "${event.position.latitude}, ${event.position.longitude}");
        isFav = await toggleFav(
            city: currentWeather.location!.name!,
            country: currentWeather.location!.country!,
            lat: currentWeather.location!.lat,
            long: currentWeather.location!.lon,
            time: "");

        emit(HomeLoadedState(currentWeather, focastWeather, isFav));
      } catch (e) {
        emit(HomeErrorState(e.toString()));
      }
    });
  }

  Future<void> addFav({DB? fav}) async {
    await DBService.insert(fav);
  }

  addTaskToDB({
    required String city,
    required String country,
    required dynamic lat,
    required dynamic long,
    required String time,
  }) async {
    await addFav(
        fav: DB(
      city: city,
      country: country,
      lat: lat,
      long: long,
      time: time,
    ));
    print("added");
  }

  List<DB> downloadList = <DB>[];
  Future<void> getDownload() async {
    List<Map<String, dynamic>> fav = await DBService.query();
    downloadList.clear();
    downloadList.addAll(fav.map((data) => new DB.fromJson(data)).toList());

    print(downloadList);
  }

  Future<bool> toggleFav({
    required String city,
    required String country,
    required dynamic lat,
    required dynamic long,
    required String time,
  }) async {
    await getDownload();
    if (downloadList.contains(city)) {
      return false;
    } else {
      addTaskToDB(
          city: city, country: country, lat: lat, long: long, time: time);
      return true;
    }
  }
}
