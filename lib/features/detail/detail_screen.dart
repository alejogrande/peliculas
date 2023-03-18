import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:peliculas/data/constans.dart';
import 'package:peliculas/data/models/details_model.dart';
import 'package:peliculas/data/models/genres_model.dart';
import 'package:peliculas/features/detail/bloc/detail_bloc.dart';
import 'package:peliculas/features/home/home_screen.dart';
import 'package:peliculas/resources/colors.dart';
import 'package:peliculas/shared_library/shared_widgets/background_custom.dart';

part './widgets/genders_details.dart';
part './widgets/expanded_container.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocBuilder<DetailBloc, DetailState>(builder: (context, state) {
        return state is DetailHasData
            ? Stack(
                children: [
                  const BackgroundCustom(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: screenSize.height * .3,
                          // height: 100,
                          // height: double.maxFinite,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: NetworkImage(
                                Urls.movieImage(state.data!.backdropPath!)),
                            fit: BoxFit.cover,
                          )),
                        ),
                        GendersDetails(details: state.data!),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          child: Text(state.data!.title!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child:
                              ExpandableContainer(text: state.data!.overview!),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Text("Reseñas"),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Container();
      }),
    );
  }
}
