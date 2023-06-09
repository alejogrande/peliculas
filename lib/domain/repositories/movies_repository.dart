import 'package:dartz/dartz.dart';
import 'package:peliculas/data/failure.dart';
import 'package:peliculas/data/models/details_model.dart';
import 'package:peliculas/data/models/genres_model.dart';
import 'package:peliculas/data/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure, Movies>> getDiscover();
  Future<Either<Failure, Genres>> getGenres();
  Future<Either<Failure, Movies>> getMoviesGenres(
      {required String page, required String genres});
  Future<Either<Failure, Movies>> getMoviesSearch(
      {required String page, required String query});

  Future<Either<Failure, Details>> getMovieDetails({required String idMovie});
}
