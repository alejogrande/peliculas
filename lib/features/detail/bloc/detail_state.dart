part of 'detail_bloc.dart';

@immutable
abstract class DetailState {}

class DetailLoading extends DetailState {}

class DetailError extends DetailState {
  String? message;
  DetailError(this.message);
}

class DetailEmpty extends DetailState {}

class DetailHasData extends DetailState {
  Details? data;
  DetailHasData({this.data});
}
