import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final String imagePath;
  final bool isDarkTheme;
  final String? title;
  const TopContainer({
    Key? key,
    required this.imagePath,
    this.title,
    required this.isDarkTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Image.asset(imagePath),
          ),
          SizedBox(width: 15),
          title != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    title!,
                    style: TextStyle(
                        color: isDarkTheme ? Colors.white : Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                )
              : Text(""),
        ],
      ),
    );
  }
}
