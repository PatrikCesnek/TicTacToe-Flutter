import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Home/Cell/CellView.dart';

class CellGroupView extends StatelessWidget {
  final bool gameStarted;
  final bool isPlayer1;
  final VoidCallback pressTileAction;

  const CellGroupView({
    super.key,
    required this.gameStarted,
    required this.isPlayer1,
    required this.pressTileAction
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: List.generate(
            3, (index) => Row(
              children: List.generate(
                3, (index) => CellView(
                gameStarted: gameStarted,
                isPlayer1: isPlayer1,
                pressTileAction: pressTileAction,
              ),
              ),
            ),
          ),
        ),
      );
  }
}
