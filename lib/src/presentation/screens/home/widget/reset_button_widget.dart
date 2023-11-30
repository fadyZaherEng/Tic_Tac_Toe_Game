import 'package:flutter/material.dart';

class ResetButtonWidget extends StatefulWidget {
  String activePlayer;
  String result;
  int turn;
  bool gameOver;
  void Function() onPressed;

  ResetButtonWidget({
    super.key,
    required this.activePlayer,
    required this.result,
    required this.turn,
    required this.gameOver,
    required this.onPressed,
  });

  @override
  State<ResetButtonWidget> createState() => _ResetButtonWidgetState();
}

class _ResetButtonWidgetState extends State<ResetButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: widget.onPressed,
          icon: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
          label: const Text(
            'Reset',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.pink,
          ),
        ),
      ),
    );
  }
}
