import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peliculas/data/constans.dart';
import 'package:peliculas/features/home/bloc/home_bloc.dart';
import 'package:peliculas/shared_library/routes/routes.dart';
import 'injection.dart' as di;

void main() {
  di.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (_) => di.locator<HomeBloc>()),
  ], child: const MyApp()));
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
