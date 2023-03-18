import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetMovies _getMovies;
  SearchBloc(this._getMovies) : super(SearchEmpty()) {
    on<SearchEvent>((event, emit) async {
      if (event is LoadSearch) {
        emit(SearchLoading());
        await _startSearchTimer(event.search);
      }
    });
  }
  Timer? _searchTimer;
  _startSearchTimer(String query) async {
    _searchTimer?.cancel();
    _searchTimer = Timer(Duration(milliseconds: 500), () async {
      final resultRecently =
          await _getMovies.getMoviesSearch(query: query, page: '1');
      resultRecently.fold(
        (failure) {
          emit(SearchError(failure.message));
        },
        (data) {
          emit(SearchHasData(data: data));
        },
      );
    });
  }
}
