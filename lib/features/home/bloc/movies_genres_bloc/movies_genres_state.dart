part of 'movies_genres_bloc.dart';

abstract class MoviesGenresState {
  const MoviesGenresState();
}

class MoviesGenresInitial extends MoviesGenresState {}

class MoviesGenreLoading extends MoviesGenresState {}

class MoviesGenreError extends MoviesGenresState {
  String? message;
  MoviesGenreError(this.message);
}

class MoviesGenreEmpty extends MoviesGenresState {}

class MoviesGenreHasData extends MoviesGenresState {
  Movies? data;
  MoviesGenreHasData({this.data});
}
