import 'package:bloc_weather_app/repos/home_repo.dart';
import 'package:bloc_weather_app/repos/splash_repo.dart';

import 'package:bloc_weather_app/screens/splash_screen/splash_screen.dart';
import 'package:bloc_weather_app/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBService.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<HomeRepo>(create: (context) => HomeRepo()),
        RepositoryProvider<SplashRepo>(create: (context) => SplashRepo()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        // home: const HomeScreen(),

        home: const SplashScreen(),

        // )
      ),
    );
  }
}
