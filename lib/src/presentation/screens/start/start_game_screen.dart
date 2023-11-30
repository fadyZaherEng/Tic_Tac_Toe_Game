import 'package:flutter/material.dart';
import 'package:tic_tac_game_app/src/presentation/screens/home/home_screen.dart';

class StartGameScreen extends StatefulWidget {
  const StartGameScreen({super.key});

  @override
  State<StartGameScreen> createState() => _StartGameScreenState();
}

class _StartGameScreenState extends State<StartGameScreen> {
  int radioValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tic Tac Toe',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Text(
              'choose your Player X or O',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RadioListTile(
                  value: radioValue,
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                ),
                RadioListTile(
                  value: radioValue,
                  groupValue: radioValue,
                  onChanged: (value) {
                    setState(() {
                      radioValue = value!;
                    });
                  },
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(activePlayer: "X"),
                  ),
                );
              },
              child: const Text(
                'Start Game',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
