import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Home/homeView.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/home",
      debugShowCheckedModeBanner: false,
      routes: {
        "/home": (context) => HomeView(),
      },
    );
  }
}