import 'package:bloc/bloc.dart';
import 'package:peliculas/data/models/genres_model.dart';
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
        final resultRecently = await _getMovies.getDiscover();
        resultRecently.fold(
          (failure) {
            emit(HomeError(failure.message));
          },
          (data) {
            loadGender(data);
          },
        );
      }
    });
  }

  void loadGender(Movies data) async {
    final resultGenres = await _getMovies.getGeders();
    resultGenres.fold((failureGenders) {
      emit(HomeError(failureGenders.message));
    }, (genres) {
      emit(HomeHasData(data: data, genres: genres));
    });
  }
}
