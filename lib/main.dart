import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/Home/homeView.dart';
import 'package:tic_tac_toe/ViewModel/TicTacToeViewModel.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: "/home",
//       debugShowCheckedModeBanner: false,
//       routes: {
//         "/home": (context) => HomeView(),
//       },
//     );
//   }
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TicTacToeViewModel(),
      child: TicTacToeApp(),
    ),
  );
}