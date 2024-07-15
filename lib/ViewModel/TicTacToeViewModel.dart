import 'package:flutter/material.dart';
import '../Model/Model.dart';

class TicTacToeViewModel with ChangeNotifier {
  TicTacToe _game = TicTacToe();
  Player _currentPlayer = Player.x;
  bool _isDraw = false;

  List<List<Player>> get board => _game.board;
  Player get currentPlayer => _currentPlayer;
  bool get isDraw => _isDraw;

  void makeMove(int row, int column) {
    _game.makeMove(row, column, _currentPlayer);
    if (_currentPlayer == Player.x) {
      _currentPlayer = Player.o;
    } else {
      _currentPlayer = Player.x;
    }
    notifyListeners();

    Player winner = checkWinner();
    if (winner != Player.none) {
      // Winner found, do something like showing an alert
    } else if (isBoardFull()) {
      // It's a draw
      _isDraw = true;
      notifyListeners();
      // Show draw alert
    }
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

  bool isBoardFull() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        if (board[row][col] == Player.none) {
          return false;
        }
      }
    }
    return true;
  }

  void restartGame() {
    _game = TicTacToe();
    _currentPlayer = Player.x;
    _isDraw = false;
    notifyListeners();
  }
}
