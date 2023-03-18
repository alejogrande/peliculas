import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:peliculas/data/datasource/remote_data_source.dart';
import 'package:peliculas/data/exception.dart';
import 'package:peliculas/data/failure.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RemoteDataSource remoteDataSource;

  MoviesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, Movies>> getDiscover() async {
    try {
      final result = await remoteDataSource.getDiscover();
      return Right(result);
    } on ServerException {
      return const Left(ServerFailure(''));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}