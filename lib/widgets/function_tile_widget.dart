import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class FunctionTile extends StatelessWidget {
  final String title;
  final bool isDarkTheme;
  final String imagePath;
  final Function onPress;

  const FunctionTile({
    Key? key,
    required this.isDarkTheme,
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
          color: isDarkTheme ? Colors.blueGrey : Colors.white,
          borderRadius: BorderRadius.circular(40),
          boxShadow: [
            BoxShadow(
              color: Color(0xfff3e5f5),
              blurRadius: 5,
              spreadRadius: 0,
              offset: Offset.zero,
            )
          ],
        ),
        child: Column(
          children: [
            Container(
              height: 130,
              width: 100,
              child: Image(
                image: AssetImage(imagePath),
                fit: BoxFit.contain,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: isDarkTheme ? Colors.blueGrey.shade900 : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
