import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game_app/src/presentation/bloc/tic_tac_bloc.dart';
import 'package:tic_tac_game_app/src/presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TicTacBloc>(
      create: (context) => TicTacBloc(),
      child: BlocConsumer<TicTacBloc, TicTacState>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.deepPurple,
                  brightness: Brightness.dark,
                ),
                primaryColor: const Color(0xFF001456),
                shadowColor: const Color(0xFF00061a),
                splashColor: const Color(0xFF001456),
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              home: const SplashScreen(),
            );
          }),
    );
  }
}
