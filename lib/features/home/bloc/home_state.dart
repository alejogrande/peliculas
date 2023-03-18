part of 'home_bloc.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  String? message;
  HomeError(this.message);
}

class HomeEmpty extends HomeState {}

class HomeHasData extends HomeState {
  Movies? data;
  HomeHasData(this.data);
}
