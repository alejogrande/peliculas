import 'package:dartz/dartz.dart';
import 'package:peliculas/data/failure.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/repositories/movies_repository.dart';

class GetMovies {
  final MoviesRepository repository;

  GetMovies(this.repository);

  Future<Either<Failure, Movies>> getDiscover() {
    return repository.getDiscover();
  }
}