import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Home/SubViews/RestartButton.dart';
import 'package:tic_tac_toe/ViewModel/TicTacToeViewModel.dart';
import '../Model/Model.dart';

class TicTacToeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TicTacToeScreen(),
    );
  }
}

class TicTacToeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TicTacToeViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Tic Tac Toe")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Current Player: ${viewModel.currentPlayer == Player.x ? "X" : "O"}",
            style: TextStyle(fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: 9,
              itemBuilder: (context, index) {
                int row = index ~/ 3;
                int col = index % 3;
                return GestureDetector(
                  onTap: () {
                    viewModel.makeMove(row, col);
                    Player winner = viewModel.checkWinner();
                    if (winner != Player.none) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("Winner!"),
                          content: Text("${winner == Player.x ? "X" : "O"} wins!"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                viewModel.restartGame();
                                Navigator.of(context).pop();
                              },
                              child: Text("Restart"),
                            ),
                          ],
                        ),
                      );
                    } else if (viewModel.isDraw) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("It's a draw!"),
                          content: Text("The game is a draw."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                viewModel.restartGame();
                                Navigator.of(context).pop();
                              },
                              child: Text("Restart"),
                            ),
                          ],
                        ),
                      );
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        viewModel.board[row][col] == Player.none
                            ? ""
                            : viewModel.board[row][col] == Player.x
                            ? "X"
                            : "O",
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          RestartButton(onRestart: () {
            viewModel.restartGame();
          }),
        ],
      ),
    );
  }
}
