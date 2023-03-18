import 'package:bloc/bloc.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/domain/usecases/get_movies.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetMovies _getMovies;
  HomeBloc(this._getMovies) : super(HomeEmpty()) {
    on<HomeEvent>((event, emit) async {
      if (event is LoadHome) {
        emit(HomeLoading());
        final result = await _getMovies.getDiscover();
        result.fold(
          (failure) {
            emit(HomeError(failure.message));
          },
          (data) {
            emit(HomeHasData(data));
          },
        );
      }
    });
  }
}
