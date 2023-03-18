import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas/features/home/home_screen.dart';
import 'package:peliculas/features/serch/bloc/search_bloc.dart';
import 'package:peliculas/resources/colors.dart';
import 'package:peliculas/shared_library/shared_widgets/background_custom.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    context.read<SearchBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Buscador"),
        ),
        body: Stack(
          children: [
            const BackgroundCustom(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      context.read<SearchBloc>().add(LoadSearch(value));
                    },
                    // textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      filled: true,
                      fillColor: AppColors.black3,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    return state is SearchHasData
                        ? GridViewMovies(items: state.data?.results)
                        : Container();
                  },
                ),
              ],
            )
          ],
        ));
  }
}
