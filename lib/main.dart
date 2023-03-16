import 'package:flutter/material.dart';
import 'package:peliculas/data/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // LocalDatabase.viewCourts();
    // DBSqlLite().createDatabase();
    return MaterialApp(
      title: 'Agendamientos',
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}
