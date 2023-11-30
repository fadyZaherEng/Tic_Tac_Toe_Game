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
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'choose your Player X or O',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white60,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text(
                        'X',
                      ),
                      value: 0,
                      groupValue: radioValue,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          radioValue = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text(
                        'O',
                      ),
                      value: 1,
                      groupValue: radioValue,
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          radioValue = value!;
                        });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(
                            activePlayer: radioValue == 0 ? "X" : "O"),
                      ),
                    );
                  },
                  child: const Text(
                    'Start Game',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
