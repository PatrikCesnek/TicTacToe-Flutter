import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Home/homeView.dart';
import 'package:tic_tac_toe/ViewModel/TicTacToeViewModel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TicTacToeViewModel(),
      child: TicTacToeApp(),
    ),
  );
}