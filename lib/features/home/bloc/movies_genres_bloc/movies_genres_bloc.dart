import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'movies_genres_event.dart';
part 'movies_genres_state.dart';

class MoviesGenresBloc extends Bloc<MoviesGenresEvent, MoviesGenresState> {
  final GetMovies _getMovies;
  MoviesGenresBloc(this._getMovies) : super(MoviesGenresInitial()) {
    on<MoviesGenresEvent>((event, emit) async {
      if (event is LoadMoviesGenres) {
        emit(MoviesGenreLoading());

        final resultRecently =
            await _getMovies.getMoviesGenres(genres: event.idGenres, page: '1');
        resultRecently.fold(
          (failure) {
            emit(MoviesGenreError(failure.message));
          },
          (data) {
            emit(MoviesGenreHasData(data: data));
          },
        );
      }
    });
  }
}
