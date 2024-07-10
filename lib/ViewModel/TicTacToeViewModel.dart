import 'package:flutter/material.dart';
import '../Model/Model.dart';

class TicTacToeViewModel with ChangeNotifier {
  TicTacToe _game = TicTacToe();
  Player _currentPlayer = Player.x;

  List<List<Player>> get board => _game.board;
  Player get currentPlayer => _currentPlayer;

  void makeMove(int row, int column) {
    _game.makeMove(row, column, _currentPlayer);
    if (_currentPlayer == Player.x) {
      _currentPlayer = Player.o;
    } else {
      _currentPlayer = Player.x;
    }
    notifyListeners();
  }

  Player checkWinner() {
    return _determineWinner(_game.board);
  }

  Player _determineWinner(List<List<Player>> board) {
    for (int row = 0; row < 3; row++) {
      if (board[row][0] != Player.none &&
          board[row][0] == board[row][1] &&
          board[row][1] == board[row][2]) {
        return board[row][0];
      }
    }

    for (int col = 0; col < 3; col++) {
      if (board[0][col] != Player.none &&
          board[0][col] == board[1][col] &&
          board[1][col] == board[2][col]) {
        return board[0][col];
      }
    }

    if (board[0][0] != Player.none &&
        board[0][0] == board[1][1] &&
        board[1][1] == board[2][2]) {
      return board[0][0];
    }
    if (board[0][2] != Player.none &&
        board[0][2] == board[1][1] &&
        board[1][1] == board[2][0]) {
      return board[0][2];
    }

    return Player.none;
  }
}
