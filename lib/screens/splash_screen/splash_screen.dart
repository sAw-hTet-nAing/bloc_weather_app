import 'package:bloc_weather_app/repos/splash_repo.dart';
import 'package:bloc_weather_app/screens/splash_screen/splash_bloc.dart';
import 'package:bloc_weather_app/screens/splash_screen/splash_event.dart';
import 'package:bloc_weather_app/screens/splash_screen/splash_state.dart';
import 'package:bloc_weather_app/utils/app_color.dart';
import 'package:bloc_weather_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplasBloc(
          splashRepo: RepositoryProvider.of<SplashRepo>(context),
          context: context)
        ..add(LoadSplashEvent()),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(gradient: AppColor.backGroundGr),
          child: BlocBuilder<SplasBloc, SplashState>(builder: (context, state) {
            if (state is SplashLoadingState) {
              return Center(
                child: Text(
                  "Loading......",
                  style: MyTextStyle.normalText,
                ),
              );
            } else if (state is SplashLoadedState) {
              return Container();
            } else if (state is SplashErrorState) {
              return Container();
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
