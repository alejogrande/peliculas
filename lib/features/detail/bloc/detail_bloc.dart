import 'package:bloc/bloc.dart';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:peliculas/data/models/details_model.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetMovies _getMovies;
  DetailBloc(this._getMovies) : super(DetailEmpty()) {
    on<DetailEvent>((event, emit) async {
      if (event is LoadDetails) {
        emit(DetailLoading());
        final resultRecently =
            await _getMovies.getMovieDetails(idMovie: event.search);
        resultRecently.fold(
          (failure) {
            emit(DetailError(failure.message));
          },
          (data) {
            emit(DetailHasData(data: data));
          },
        );
      }
    });
  }
}
