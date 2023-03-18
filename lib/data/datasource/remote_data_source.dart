import 'package:http/http.dart' as http;
import 'package:peliculas/data/exception.dart';
import 'package:peliculas/data/models/movies_model.dart';

abstract class RemoteDataSource {
  Future<Movies> getDiscover();
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

  Future<Movies> getGenders() async {
    final response = await client.get(Uri.parse(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=d203d786addf2668c1a40424e7d8ae1a&language=es-ES'));

    if (response.statusCode == 200) {
      return moviesFromJson((response.body));
    } else {
      throw ServerException();
    }
  }
}
