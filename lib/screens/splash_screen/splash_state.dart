import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SplashState extends Equatable {}

class SplashLoadingState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoadedState extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashErrorState extends SplashState {
  SplashErrorState(this.error);
  final String error;
  @override
  List<Object?> get props => [error];
}
