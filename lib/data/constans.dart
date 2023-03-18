class Routes {
  static const String home = 'home';
  static const String detail = 'detail';
  static const String search = 'search';
  static const String favorite = 'favorite';
}

class Urls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'd203d786addf2668c1a40424e7d8ae1a';
  static const String sesionId = '7d446ada90741ed7bf099412e1839b83a13ecd42';

  static String movieImage(String imageCode) =>
      'https://image.tmdb.org/t/p/w500/${imageCode}';
}

class Assets {}

class Const {}
