import 'package:butex_notebot/constants/asset_path.dart';
import 'package:flutter/material.dart';

class TopContainer extends StatelessWidget {
  final String title;
  const TopContainer({Key? key, required this.title, imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Image.asset(
              logoNotebot,
              width: 200,
            ),
          ),
          SizedBox(height: 50),
          Text(
            title,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
