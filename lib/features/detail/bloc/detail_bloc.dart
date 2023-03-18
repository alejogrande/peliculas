import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final GetMovies _getMovies;
  DetailBloc(this._getMovies) : super(DetailInitial()) {
    on<DetailEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
