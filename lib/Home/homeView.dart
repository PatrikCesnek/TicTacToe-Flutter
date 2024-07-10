// import 'package:flutter/material.dart';
// import 'package:tic_tac_toe/Home/CellGroup/cellGroupView.dart';
// import 'package:tic_tac_toe/Home/Score/ScoreView.dart';
// import 'package:tic_tac_toe/Home/SubViews/RestartButton.dart';
// import 'package:tic_tac_toe/Extensions/BoolToggleExtension.dart';
//
// class HomeView extends StatefulWidget {
//   const HomeView({super.key});
//
//   @override
//   State<HomeView> createState() => _HomeViewState();
// }
//
// class _HomeViewState extends State<HomeView> {
//   int player1Score = 0;
//   int player2Score = 0;
//   bool isPlayer1 = true;
//   bool gameStarted = false;
//
//   @override
//   void initState() {
//     super.initState();
//     // Run after the first frame is rendered
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       setState(() {
//         gameStarted = true;
//       });
//     });
//   }
//
//   void pressTileAction() {
//     print(isPlayer1);
//     setState(() {
//       gameStarted = true;
//       isPlayer1 = isPlayer1.toggle();
//     });
//     print('Action performed!');
//     print(isPlayer1);
//   }
//
//   void restartGame() {
//     setState(() {
//       gameStarted = false;
//     });
//     print('Game restarted!');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text("TicTacToe"),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Expanded(
//                 child: CellGroupView(
//                   gameStarted: gameStarted,
//                   isPlayer1: isPlayer1,
//                   pressTileAction: pressTileAction,
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: ScoreView(
//                   player1Score: player1Score,
//                   player2Score: player2Score,
//                 ),
//               ),
//             ),
//             Center(
//               child: RestartButton(onRestart: restartGame),
//             ),
//             SizedBox(height: 50),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: HomeView(),
//   ));
// }

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
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
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
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          RestartButton(onRestart: () {
            print("Restart");
          }),
        ],
      ),
    );
  }
}
