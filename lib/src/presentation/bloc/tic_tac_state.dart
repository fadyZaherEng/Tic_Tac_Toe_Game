part of 'tic_tac_bloc.dart';

@immutable
abstract class TicTacState {}

class TicTacInitialState extends TicTacState {}

class TicTacSwitchState extends TicTacState {}

class TicTacAutoPlayState extends TicTacState {
  String player;

  TicTacAutoPlayState(this.player);
}

class TicTacResetState extends TicTacState {
  String activePlayer;
  String result;
  int turn;
  bool gameOver;

  TicTacResetState({
    required this.activePlayer,
    required this.result,
    required this.turn,
    required this.gameOver,
  });
}

class TicTacPlayingState extends TicTacState {
  String activePlayer;

  TicTacPlayingState(this.activePlayer);
}
