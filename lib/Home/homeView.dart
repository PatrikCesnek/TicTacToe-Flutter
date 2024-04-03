import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Home/CellGroup/cellGroupView.dart';
import 'package:tic_tac_toe/Home/Score/ScoreView.dart';
import 'package:tic_tac_toe/Home/SubViews/RestartButton.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
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
              child: Expanded(child: CellGroupView()),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16
                ),
                child: ScoreView(),
              ),
            ),
            Center(
              child: RestartButton(),
            ),
            SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
