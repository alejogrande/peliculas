import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetMovies _getMovies;
  SearchBloc(this._getMovies) : super(SearchEmpty()) {
    on<SearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
