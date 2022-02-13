import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  bool gameOver;

  GameOverScreen({required this.gameOver});

  @override
  Widget build(BuildContext context) {
    return gameOver
        ? Stack(
            children: [
              Container(
                alignment: Alignment(0, -0.5),
                child: Text(
                  'G A M E  O V E R',
                  style: TextStyle(color: Colors.grey[800], fontSize: 40),
                ),
              ),
              Container(
                alignment: Alignment(0, -0.2),
                child: Text(
                  'tap to play again',
                  style: TextStyle(color: Colors.grey[500], fontSize: 25),
                ),
              )
            ],
          )
        : Container();
  }
}
