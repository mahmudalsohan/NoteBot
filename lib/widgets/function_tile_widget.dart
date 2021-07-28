import 'package:flutter/material.dart';

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
      child: Card(
        elevation: 10,
        color: isDarkTheme ? Colors.blueGrey : Colors.blue,
        shadowColor: isDarkTheme ? Colors.grey : Colors.black,
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
                color: isDarkTheme ? Colors.blueGrey.shade900 : Colors.white,
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
