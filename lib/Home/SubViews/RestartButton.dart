import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final VoidCallback onRestart;

  const RestartButton({
    super.key, required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onRestart,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
      ),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 32,
          ),
          child: Text(
            'Restart',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}