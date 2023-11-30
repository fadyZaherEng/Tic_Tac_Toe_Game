import 'package:flutter/material.dart';

class PlayerTurnWidget extends StatefulWidget {
  final String activePlayer;
  const PlayerTurnWidget({super.key, required this.activePlayer});

  @override
  State<PlayerTurnWidget> createState() => _PlayerTurnWidgetState();
}

class _PlayerTurnWidgetState extends State<PlayerTurnWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "it's".toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
        Text(
          " ${widget.activePlayer} ".toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25.0,
            color: Colors.deepPurple,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "turn".toUpperCase(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 18.0,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
