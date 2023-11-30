// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tic_tac_game_app/src/domain/entities/game.dart';
import 'package:tic_tac_game_app/src/domain/entities/player.dart';

part 'tic_tac_event.dart';
part 'tic_tac_state.dart';

class TicTacBloc extends Bloc<TicTacEvent, TicTacState> {
  TicTacBloc() : super(TicTacInitialState()) {
    on<TicTacResetEvent>(_onTicTacResetEvent);
    on<TicTacOnTapPlayEvent>(_onTicTacOnTapPlayEvent);
    on<TicTacAutoPlayEvent>(_onTicTacAutoPlayEvent);
    on<TicTacSwitchEvent>(_onTicTacSwitchEvent);
  }

  FutureOr<void> _onTicTacResetEvent(
      TicTacResetEvent event, Emitter<TicTacState> emit) {
    emit(
      TicTacResetState(
        activePlayer: "X",
        result: 'XXXXXXXXXXXXXXX',
        turn: 0,
        gameOver: false,
      ),
    );
  }

  FutureOr<void> _onTicTacOnTapPlayEvent(
      TicTacOnTapPlayEvent event, Emitter<TicTacState> emit) {
    if (!Player.playerX.contains(event.index) ||
        !Player.playerO.contains(event.index)) {
      event.game.playGame(
        event.index,
        event.player,
      );
      emit(TicTacPlayingState(event.player == 'X' ? 'O' : 'X'));
    }
  }

  FutureOr<void> _onTicTacAutoPlayEvent(
      TicTacAutoPlayEvent event, Emitter<TicTacState> emit) async {
    if (!event.gameOver && !event.isSwitch) {
      await event.game.autoPlay(event.player);
      emit(TicTacAutoPlayState(event.player == 'X' ? 'O' : 'X'));
    }
  }

  FutureOr<void> _onTicTacSwitchEvent(
      TicTacSwitchEvent event, Emitter<TicTacState> emit) {
    emit(TicTacSwitchState());
  }
}
