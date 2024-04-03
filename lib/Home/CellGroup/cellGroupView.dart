import 'package:flutter/material.dart';
import 'package:tic_tac_toe/Home/Cell/CellView.dart';

class CellGroupView extends StatelessWidget {
  const CellGroupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: List.generate(
            3, (index) => Row(
              children: List.generate(
                3, (index) => CellView(),
              ),
            ),
          ),
        ),
      );
  }
}
