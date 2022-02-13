import 'package:flutter/material.dart';

class TapToPlay extends StatelessWidget {
  final bool gameHasStarted;

  TapToPlay({required this.gameHasStarted});

  @override
  Widget build(BuildContext context) {
    return gameHasStarted
        ? Container()
        : Stack(
            children: [
              Container(
                alignment: Alignment(0, 0),
                child: Text(
                  'TAP TO PLAY',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                alignment: Alignment(0, -0.3),
                child: Text(
                  'N O T E D I N O',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          );
  }
}
