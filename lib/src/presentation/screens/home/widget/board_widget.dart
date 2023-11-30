import 'package:flutter/material.dart';
import 'package:tic_tac_game_app/src/domain/entities/player.dart';

class GameBoardWidget extends StatefulWidget {
  final bool gameOver;
  void Function(int index) onTap;

  GameBoardWidget({
    super.key,
    required this.onTap,
    required this.gameOver,
  });

  @override
  State<GameBoardWidget> createState() => _GameBoardWidgetState();
}

class _GameBoardWidgetState extends State<GameBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(16.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        childAspectRatio: 1.0,
        children: List.generate(
          9,
          (index) {
            return InkWell(
              onTap: widget.gameOver ? null : () => widget.onTap(index),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).shadowColor,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                  color: Theme.of(context).primaryColor,
                ),
                child: Center(
                  child: Text(
                    Player.playerX.contains(index)
                        ? 'X'.toUpperCase()
                        : Player.playerO.contains(index)
                            ? 'O'.toUpperCase()
                            : Player.empty,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Player.playerX.contains(index)
                          ? Colors.deepPurple
                          : Colors.blueAccent,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
