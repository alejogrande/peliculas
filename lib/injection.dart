import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';
import 'package:peliculas/data/repositories/movies_repository_impl.dart';
import 'package:peliculas/domain/repositories/movies_repository.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';
import 'package:peliculas/features/home/bloc/home_bloc.dart';

import 'data/datasource/remote_data_source.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => HomeBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetMovies(locator()));

  // repository
  locator.registerLazySingleton<MoviesRepository>(
    () => MoviesRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data source
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(
      client: locator(),
    ),
  );

  // external
  locator.registerLazySingleton(() => http.Client());
}
