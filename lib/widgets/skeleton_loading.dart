import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonLoading extends StatelessWidget {
  SkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        int dur = (index % 5 + 5) * 200;
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SkeletonAnimation(
                        borderRadius: BorderRadius.circular(2.0),
                        shimmerDuration: dur,
                        shimmerColor: themeController.isDarkMode.value
                            ? Colors.black45
                            : Colors.white,
                        child: Container(
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.75,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: themeController.isDarkMode.value
                                ? Colors.white
                                : Colors.black12,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: themeController.isDarkMode.value
                            ? Colors.white
                            : Colors.black12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: themeController.isDarkMode.value ? Colors.white : Colors.grey,
      ),
    );
  }
}
