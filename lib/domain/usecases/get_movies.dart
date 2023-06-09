import 'package:dartz/dartz.dart';
import 'package:peliculas/data/failure.dart';
import 'package:peliculas/data/models/details_model.dart';
import 'package:peliculas/data/models/genres_model.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/repositories/movies_repository.dart';

class GetMovies {
  final MoviesRepository repository;

  GetMovies(this.repository);

  Future<Either<Failure, Movies>> getDiscover() {
    return repository.getDiscover();
  }

  Future<Either<Failure, Genres>> getGeders() {
    return repository.getGenres();
  }

  Future<Either<Failure, Movies>> getMoviesGenres(
      {required String page, required String genres}) {
    return repository.getMoviesGenres(page: page, genres: genres);
  }

  Future<Either<Failure, Movies>> getMoviesSearch(
      {required String page, required String query}) {
    return repository.getMoviesSearch(page: page, query: query);
  }

  Future<Either<Failure, Details>> getMovieDetails({required String idMovie}) {
    return repository.getMovieDetails(idMovie: idMovie);
  }
}
