import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SplashEvent extends Equatable {
  const SplashEvent();
  @override
  List<Object> get props => [];
}

class LoadSplashEvent extends SplashEvent {
  @override
  List<Object> get props => [];
}
