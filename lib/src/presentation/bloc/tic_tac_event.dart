part of 'tic_tac_bloc.dart';

@immutable
abstract class TicTacEvent {}

class TicTacResetEvent extends TicTacEvent {}

class TicTacSwitchEvent extends TicTacEvent {}

class TicTacAutoPlayEvent extends TicTacEvent {
  String player;
  bool gameOver;
  bool isSwitch;
  Game game;
  TicTacAutoPlayEvent(this.player, this.game, this.gameOver, this.isSwitch);
}

class TicTacOnTapPlayEvent extends TicTacEvent {
  int index;
  Game game;
  String player;
  TicTacOnTapPlayEvent(this.index, this.game, this.player);
}
