import 'package:butex_notebot/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FunctionTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function onPress;

  FunctionTile({
    Key? key,
    required this.onPress,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              offset: Offset(8.0, 8.0),
              blurRadius: 15,
              spreadRadius: 0.1,
              color: AppColors().kFunctionTileShadowColor,
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                //style: AppTextStyles().kFunctionTileTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
