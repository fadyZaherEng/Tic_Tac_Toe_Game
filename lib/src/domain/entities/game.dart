import 'dart:math';

import 'package:tic_tac_game_app/src/domain/entities/player.dart';

class Game {
  void playGame(int index, String player) {
    if (player == 'X') {
      Player.playerX.add(index);
    } else if (player == 'O') {
      Player.playerO.add(index);
    }
  }

  String checkWinner() {
    String winner = 'it\'s Draw';
    //X wins
    if (Player.playerX.contains(0) &&
        Player.playerX.contains(1) &&
        Player.playerX.contains(2)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(3) &&
        Player.playerX.contains(4) &&
        Player.playerX.contains(5)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(6) &&
        Player.playerX.contains(7) &&
        Player.playerX.contains(8)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(0) &&
        Player.playerX.contains(3) &&
        Player.playerX.contains(6)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(1) &&
        Player.playerX.contains(4) &&
        Player.playerX.contains(7)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(2) &&
        Player.playerX.contains(5) &&
        Player.playerX.contains(8)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(0) &&
        Player.playerX.contains(4) &&
        Player.playerX.contains(8)) {
      winner = 'You are Win';
    }
    if (Player.playerX.contains(2) &&
        Player.playerX.contains(4) &&
        Player.playerX.contains(6)) {
      winner = 'You are Win';
    }
    // O wins
    if (Player.playerO.contains(0) &&
        Player.playerO.contains(1) &&
        Player.playerO.contains(2)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(3) &&
        Player.playerO.contains(4) &&
        Player.playerO.contains(5)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(6) &&
        Player.playerO.contains(7) &&
        Player.playerO.contains(8)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(0) &&
        Player.playerO.contains(3) &&
        Player.playerO.contains(6)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(1) &&
        Player.playerO.contains(4) &&
        Player.playerO.contains(7)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(2) &&
        Player.playerO.contains(5) &&
        Player.playerO.contains(8)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(0) &&
        Player.playerO.contains(4) &&
        Player.playerO.contains(8)) {
      winner = 'O is Winner';
    }
    if (Player.playerO.contains(2) &&
        Player.playerO.contains(4) &&
        Player.playerO.contains(6)) {
      winner = 'O is Winner';
    }
    return winner;
  }

  Future<void> autoPlay(String player) async {
    List emptyCells = [];
    int randomIndex = 0;
    for (int i = 0; i < 9; i++) {
      if (!(Player.playerX.contains(i) || Player.playerO.contains(i))) {
        emptyCells.add(i);
      }
    }
    Random random = Random();
    int index = random.nextInt(emptyCells.length);
    randomIndex = emptyCells[index];
    playGame(randomIndex, player);
  }
}
