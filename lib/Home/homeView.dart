import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Home/CellGroup/cellGroupView.dart';
import 'package:tic_tac_toe/Home/Score/ScoreView.dart';
import 'package:tic_tac_toe/Home/SubViews/RestartButton.dart';
import 'package:tic_tac_toe/Extensions/BoolToggleExtension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int player1Score = 0;
  int player2Score = 0;
  bool isPlayer1 = true;
  bool gameStarted = false;

  @override
  void initState() {
    super.initState();
    // Run after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        gameStarted = true;
      });
    });
  }

  void pressTileAction() {
    print(isPlayer1);
    setState(() {
      gameStarted = true;
      isPlayer1 = isPlayer1.toggle();
    });
    print('Action performed!');
    print(isPlayer1);
  }

  void restartGame() {
    setState(() {
      gameStarted = false;
    });
    print('Game restarted!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("TicTacToe"),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Expanded(
                child: CellGroupView(
                  gameStarted: gameStarted,
                  isPlayer1: isPlayer1,
                  pressTileAction: pressTileAction,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ScoreView(
                  player1Score: player1Score,
                  player2Score: player2Score,
                ),
              ),
            ),
            Center(
              child: RestartButton(onRestart: restartGame),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeView(),
  ));
}
