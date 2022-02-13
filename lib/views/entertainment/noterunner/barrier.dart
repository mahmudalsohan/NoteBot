import 'package:flutter/material.dart';

import '../../../constants/asset_path.dart';

class MyBarrier extends StatelessWidget {
  final double barrierX;
  final double barrierY;
  final double barrierWidth;
  final double barrierHeight;

  MyBarrier({
    required this.barrierX,
    required this.barrierY,
    required this.barrierWidth,
    required this.barrierHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment((2 * barrierX + barrierWidth) / (2 - barrierWidth),
          (2 * barrierY + barrierHeight) / (2 - barrierHeight)),
      child: Container(
          height:
              MediaQuery.of(context).size.height * 2 / 3 * barrierHeight / 2,
          width: MediaQuery.of(context).size.width * barrierWidth / 2,
          child: Image.asset(
            imageCactus,
            fit: BoxFit.fill,
          )),
    );
  }
}
