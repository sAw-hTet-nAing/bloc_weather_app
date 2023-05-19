import 'package:bloc_weather_app/repos/home_repo.dart';
import 'package:bloc_weather_app/screens/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        // home: const HomeScreen(),
        home: RepositoryProvider(
          create: (contxt) => HomeRepo(),
          child: const HomeScreen(),
        )
        // )
        );
  }
}
