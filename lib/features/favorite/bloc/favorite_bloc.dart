import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final GetMovies _getMovies;
  FavoriteBloc(this._getMovies) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
