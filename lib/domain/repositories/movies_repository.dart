import 'package:dartz/dartz.dart';
import 'package:peliculas/data/failure.dart';
import 'package:peliculas/data/models/movies_model.dart';

abstract class MoviesRepository {
  Future<Either<Failure, Movies>> getDiscover();
}
