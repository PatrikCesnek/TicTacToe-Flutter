import 'package:flutter/material.dart';

class CellView extends StatefulWidget {
  final bool gameStarted;
  final bool isPlayer1;
  final VoidCallback pressTileAction;

  const CellView({
    super.key,
    required this.gameStarted,
    required this.isPlayer1,
    required this.pressTileAction
  });

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
          child: InkWell(
              onTap: () {
                // Handle tap event
                setState(() {
                  widget.pressTileAction;
                });
              },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                color: Colors.blue,
              ),
              child: Center(
                child: widget.gameStarted
                    ? Text(
                    widget.isPlayer1 ? "X" : "O",
                    style: TextStyle(
                    fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: widget.isPlayer1 ? Colors.white : Colors.black
                      ),
                    )
                    : Text("")
              ),
            ),
          ),
        ),
      ),
    );
  }
}
