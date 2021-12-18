import 'package:butex_notebot/constants/text_styles.dart';
import 'package:flutter/material.dart';

class LevelSelectionTile extends StatelessWidget {
  final Function onTap;
  final String title;
  const LevelSelectionTile({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2.0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles().kSelectLevelButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
