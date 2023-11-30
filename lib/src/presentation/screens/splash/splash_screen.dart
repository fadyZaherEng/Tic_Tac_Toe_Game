import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tic_tac_game_app/src/presentation/screens/start/start_game_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () async {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const StartGameScreen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 300,
            width: 300,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/tic.png'),
                fit: BoxFit.fill,
                alignment: Alignment.center,
                filterQuality: FilterQuality.high,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(150),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurple,
                  blurRadius: 10,
                  spreadRadius: 1,
                  blurStyle: BlurStyle.normal,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
