import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas/data/constans.dart';
import 'package:peliculas/features/detail/bloc/detail_bloc.dart';
import 'package:peliculas/features/favorite/bloc/favorite_bloc.dart';
import 'package:peliculas/features/home/bloc/home_bloc/home_bloc.dart';
import 'package:peliculas/features/home/bloc/movies_genres_bloc/movies_genres_bloc.dart';
import 'package:peliculas/features/root/navigation_bloc/navigation_cubit.dart';
import 'package:peliculas/features/root/root_screen.dart';
import 'package:peliculas/features/serch/bloc/search_bloc.dart';
import 'package:peliculas/resources/theme/theme.dart';
import 'package:peliculas/shared_library/routes/routes.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => NavigationCubit(),
    ),
    BlocProvider(create: (_) => di.locator<DetailBloc>()),
    BlocProvider(create: (_) => di.locator<FavoriteBloc>()),
    BlocProvider(create: (_) => di.locator<SearchBloc>()),
    BlocProvider(create: (_) => di.locator<MoviesGenresBloc>()),
    BlocProvider(create: (_) => di.locator<HomeBloc>()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seeri-Movie',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      // initialRoute: ,
      theme: theme(context),
      home: RootScreen(),
    );
  }
}
