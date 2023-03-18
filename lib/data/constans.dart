import 'package:flutter/material.dart';

class Routes {
  static const String home = 'home';
  static const String detail = 'detail';
  static const String search = 'search';
  static const String favorite = 'favorite';
  static const String root = 'root';
}

class Urls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'd203d786addf2668c1a40424e7d8ae1a';
  static const String sesionId = '7d446ada90741ed7bf099412e1839b83a13ecd42';

  static String movieImage(String imageCode) =>
      'https://image.tmdb.org/t/p/w500${imageCode}';
}

class Assets {
  static const String iconStart = 'lib/resources/icons/star.svg';
  static const String iconStartEmpty = 'lib/resources/icons/star_off.svg';
  static const String iconArrowLeft = 'lib/resources/icons/arrow_left.svg';
  static const String iconHomeEmpty = 'lib/resources/icons/home_off.svg';
  static const String iconHome = 'lib/resources/icons/home.svg';
  static const String iconFavoriteEmpty = 'lib/resources/icons/like_off.svg';
  static const String icoFavorite = 'lib/resources/icons/like.svg';
  static const String iconSearh = 'lib/resources/icons/search.svg';
  static const String iconSearchEmpty = 'lib/resources/icons/search_off.svg';
  static const String iconUser = 'lib/resources/icons/user.svg';
}

class Const {}
