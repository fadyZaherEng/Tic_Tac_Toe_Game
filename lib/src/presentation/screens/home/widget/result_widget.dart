import 'package:flutter/material.dart';

class ResultWidget extends StatefulWidget {
  final String result;
  const ResultWidget({super.key, required this.result});

  @override
  State<ResultWidget> createState() => _ResultWidgetState();
}

class _ResultWidgetState extends State<ResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.result == 'O is Winner'
          ? "Game Over \n${widget.result.toUpperCase()}"
          : widget.result.toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 20.0,
        color: Colors.white,
      ),
    );
  }
}
