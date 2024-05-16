import 'package:flutter/material.dart';

class CellView extends StatefulWidget {
  const CellView({super.key});

  @override
  State<CellView> createState() => _CellViewState();
}

class _CellViewState extends State<CellView> {
  bool isPlayer1 = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
              onTap: () {
                // Handle tap event
                setState(() {
                  isPlayer1 = !isPlayer1;
                });
              },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  isPlayer1 ? "X" : "O",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isPlayer1 ? Colors.white : Colors.black
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
