import 'package:flutter/material.dart';
import 'package:peliculas/data/constans.dart';
import 'package:peliculas/features/detail/home_screen.dart';
import 'package:peliculas/features/favorite/home_screen.dart';
import 'package:peliculas/features/home/home_screen.dart';
import 'package:peliculas/features/serch/home_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.favorite: (_) => const FavoriteScreen(),
  Routes.home: (_) => const HomeScreen(),
  Routes.detail: (_) => const DetailScreen(),
  Routes.search: (_) => const SearchScreen(),
};
