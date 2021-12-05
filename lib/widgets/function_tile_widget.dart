import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FunctionTile extends StatelessWidget {
  final String title;
  final String imagePath;
  final Function onPress;

  final Color kTenBlackColor = Colors.black12; // alpha = 0.2

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
              //offset: Offset(8.0, 8.0),
              blurRadius: 25,
              spreadRadius: 5,
              color: kTenBlackColor,
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
