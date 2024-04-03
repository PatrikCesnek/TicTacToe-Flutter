import 'package:flutter/material.dart';

class CellView extends StatefulWidget {
  const CellView({super.key});

  @override
  State<CellView> createState() => _CellViewState();
}

class _CellViewState extends State<CellView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "X",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
