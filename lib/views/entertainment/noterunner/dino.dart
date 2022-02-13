import 'package:butex_notebot/constants/asset_path.dart';
import 'package:flutter/material.dart';

class MyDino extends StatelessWidget {
  final double dinoX;
  final double dinoY;
  final double dinoWidth;
  final double dinoHeight;

  MyDino({
    required this.dinoX,
    required this.dinoY,
    required this.dinoWidth,
    required this.dinoHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * dinoX + dinoWidth) / (2 - dinoWidth),
          (2 * dinoY + dinoHeight) / (2 - dinoHeight)),
      child: Container(
        height: MediaQuery.of(context).size.height * 2 / 3 * dinoHeight / 2,
        width: MediaQuery.of(context).size.width * dinoWidth / 2,
        child: Image.asset(
          logoNoteRunner,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
