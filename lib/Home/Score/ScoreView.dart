import 'package:flutter/material.dart';

class ScoreView extends StatefulWidget {
  final int player1Score;
  final int player2Score;

  const ScoreView({
    super.key,
    required this.player1Score,
    required this.player2Score,
  });

  @override
  State<ScoreView> createState() => _ScoreViewState();
}

class _ScoreViewState extends State<ScoreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Score",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 16),
          Text(
              "Player 1: ${widget.player1Score.toString().padLeft(3, '0')}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              )
          ),
          SizedBox(height: 8),
          Text(
              "Player 2: ${widget.player2Score.toString().padLeft(3, '0')}",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500
              )
          ),
        ],
      ),
    );
  }
}
