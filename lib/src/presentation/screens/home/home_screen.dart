// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_game_app/src/domain/entities/game.dart';
import 'package:tic_tac_game_app/src/domain/entities/player.dart';
import 'package:tic_tac_game_app/src/presentation/bloc/tic_tac_bloc.dart';
import 'package:tic_tac_game_app/src/presentation/screens/home/widget/board_widget.dart';
import 'package:tic_tac_game_app/src/presentation/screens/home/widget/player_turn_widget.dart';
import 'package:tic_tac_game_app/src/presentation/screens/home/widget/reset_button_widget.dart';
import 'package:tic_tac_game_app/src/presentation/screens/home/widget/result_widget.dart';
import 'package:tic_tac_game_app/src/presentation/screens/home/widget/switch_player_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _activePlayer = 'X';
  String _winner = 'XXXXXXXXXXXXXXX';
  int _turn = 1;
  bool _gameOver = false;
  Game _game = Game();
  bool _isSwitch = false;

  TicTacBloc get _bloc => BlocProvider.of<TicTacBloc>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicTacBloc, TicTacState>(listener: (context, state) {
      if (state is TicTacResetState) {
        _gameOver = state.gameOver;
        _activePlayer = state.activePlayer;
        _winner = state.result;
        _turn = state.turn;
        Player.playerX = [];
        Player.playerO = [];
      } else if (state is TicTacPlayingState) {
        if (_game.checkWinner() != 'it\'s Draw') {
          _gameOver = true;
          _winner = _game.checkWinner();
        } else if (_turn == 9) {
          _gameOver = true;
          _winner = 'Nobody wins';
        } else {
          _turn++;
          _winner = _turn == 9 ? 'Nobody wins' : 'it\'s Draw';
          if (!_isSwitch) {
            _bloc.add(
              TicTacAutoPlayEvent(
                "O",
                _game,
                _gameOver,
                _isSwitch,
              ),
            );
          }
          if (_isSwitch) {
            _activePlayer = state.activePlayer;
          }
        }
      } else if (state is TicTacAutoPlayState) {
        if (_game.checkWinner() != 'it\'s Draw') {
          _gameOver = true;
          _winner = _game.checkWinner();
        } else if (_turn == 9) {
          _gameOver = true;
          _winner = 'Nobody wins';
        } else {
          _turn++;
          _winner = _turn == 9 ? 'Nobody wins' : 'it\'s Draw';
        }
      } else if (state is TicTacSwitchState) {
        _isSwitch = !_isSwitch;
      }
    }, builder: (context, state) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SwitchPlayerWidget(
                    isSwitch: _isSwitch,
                    onChanged: (value) {
                      _bloc.add(TicTacSwitchEvent());
                      _bloc.add(TicTacResetEvent());
                    }),
                const SizedBox(
                  height: 5,
                ),
                PlayerTurnWidget(
                  activePlayer: _activePlayer,
                ),
                GameBoardWidget(
                  onTap: (index) {
                    if (!_gameOver || _turn != 9) {
                      _bloc.add(
                        TicTacOnTapPlayEvent(
                          index,
                          _game,
                          _activePlayer,
                        ),
                      );
                    } else if (_turn == 9) {
                      setState(() {
                        _winner = 'Nobody wins';
                      });
                    }
                  },
                  gameOver: _gameOver,
                ),
                ResultWidget(result: _winner),
                const SizedBox(
                  height: 10,
                ),
                ResetButtonWidget(
                  activePlayer: _activePlayer,
                  result: _winner,
                  turn: _turn,
                  gameOver: _gameOver,
                  onPressed: () {
                    _bloc.add(TicTacResetEvent());
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
