import 'package:http/http.dart' as http;
import 'package:peliculas/data/exception.dart';
import 'package:peliculas/data/models/genres_model.dart';
import 'package:peliculas/data/models/movies_model.dart';

abstract class RemoteDataSource {
  Future<Movies> getDiscover();
  Future<Genres> getGenres();
  Future<Movies> getMoviesGenres(
      {required String page, required String genres});
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;
  RemoteDataSourceImpl({required this.client});

  @override
  Future<Movies> getDiscover() async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?primary_release_date.lte=2023-03-18&page=2&api_key=d203d786addf2668c1a40424e7d8ae1a&language=es-ES'));

    if (response.statusCode == 200) {
      return moviesFromJson((response.body));
    } else {
      throw ServerException();
    }
  }

  Future<Genres> getGenres() async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=d203d786addf2668c1a40424e7d8ae1a&language=es-ES'));

    if (response.statusCode == 200) {
      return genresFromJson((response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Movies> getMoviesGenres(
      {required String page, required String genres}) async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/discover/movie?api_key=d203d786addf2668c1a40424e7d8ae1a&language=es-ES&sort_by=popularity.desc&page=$page&with_genres=$genres'));

    if (response.statusCode == 200) {
      return moviesFromJson((response.body));
    } else {
      throw ServerException();
    }
  }
}
