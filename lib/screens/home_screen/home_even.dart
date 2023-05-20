import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class HomeLoadingEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class LoadedHomeEvent extends HomeEvent {
  const LoadedHomeEvent(this.position);
  final Position position;
  @override
  List<Object> get props => [position];
}
