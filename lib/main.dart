import 'package:flutter/material.dart';
import 'package:peliculas/data/constans.dart';
import 'package:peliculas/data/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'peliculas',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
      initialRoute: Routes.home,
    );
  }
}
