import 'package:butex_notebot/constants/colors.dart';
import 'package:butex_notebot/constants/controller.dart';
import 'package:butex_notebot/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FunctionTile extends StatelessWidget {
  final String title;
  final ImageProvider image;
  final Function onPress;

  FunctionTile({
    Key? key,
    required this.onPress,
    required this.title,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPress();
      },
      child: Container(
        decoration: BoxDecoration(
          color: themeController.isDarkMode.value
              ? Color(0xff1a2d3d)
              : Theme.of(context).colorScheme.background,
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
                padding: const EdgeInsets.all(12.0),
                child: Image(
                  image: image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
                right: 5,
                left: 5,
              ),
              child: Text(
                title,
                style: AppTextStyles().kFunctionTileTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
