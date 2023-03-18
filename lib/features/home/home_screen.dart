import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:peliculas/data/constans.dart';
import 'package:peliculas/data/models/genres_model.dart';
import 'package:peliculas/data/models/movies_model.dart';
import 'package:peliculas/features/detail/bloc/detail_bloc.dart';

import 'package:peliculas/features/home/bloc/home_bloc/home_bloc.dart';
import 'package:peliculas/features/home/bloc/movies_genres_bloc/movies_genres_bloc.dart';
import 'package:peliculas/resources/colors.dart';

import 'package:peliculas/shared_library/shared_widgets/background_custom.dart';

part './widgets/carousel_custom.dart';
part './widgets/list_genders.dart';
part './widgets/gridview_movies.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHome());
  }

  @override
  Widget build(BuildContext context) {
    // context.read<HomeBloc>().add(LoadHome());
    return Scaffold(
        appBar: AppBar(
          title: const Text("Seeri-Movie"),
        ),
        body: Stack(
          children: [
            const BackgroundCustom(),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state is HomeHasData
                    ? Column(
                        children: [
                          CarouselSliderCustom(items: state.data?.results),
                          const SizedBox(
                            height: 10,
                          ),
                          ListGenres(list: state.genres!.genres!),
                          BlocBuilder<MoviesGenresBloc, MoviesGenresState>(
                            builder: (context, state) {
                              return state is MoviesGenreHasData
                                  ? Expanded(
                                      child: Column(
                                        children: [
                                          GridViewMovies(
                                              items: state.data?.results),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          // ListGenres(list: state.genres!.genres!),
                                        ],
                                      ),
                                    )
                                  : Container();
                            },
                          )
                        ],
                      )
                    : Container();
              },
            )
          ],
        ));
  }
}
