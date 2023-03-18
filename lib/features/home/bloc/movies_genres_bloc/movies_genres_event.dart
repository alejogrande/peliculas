part of 'movies_genres_bloc.dart';

abstract class MoviesGenresEvent {
  const MoviesGenresEvent();
}

class LoadMoviesGenres extends MoviesGenresEvent {
  String idGenres;
  LoadMoviesGenres(this.idGenres);
}
