import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object> get props => [];
}

class LoadUserLocationEvent extends HomeEvent {
  const LoadUserLocationEvent();
  @override
  List<Object> get props => [];
}

class LoadHomeEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}
