enum Player { none, x, o }

class TicTacToe {
  List<List<Player>> board;

  TicTacToe() : board = List.generate(3, (_) => List.generate(3, (_) => Player.none));

  void makeMove(int row, int column, Player player) {
    if (board[row][column] == Player.none) {
      board[row][column] = player;
    }
  }
}
