import 'package:flutter/material.dart';
import 'package:skeleton_text/skeleton_text.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                    bottom: 5.0,
                    left: 15,
                  ),
                  child: SkeletonAnimation(
                    borderRadius: BorderRadius.circular(10.0),
                    shimmerColor: Colors.white54,
                    child: Container(
                      height: 15,
                      width: MediaQuery.of(context).size.width * 0.55,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: SkeletonAnimation(
                    borderRadius: BorderRadius.circular(10.0),
                    shimmerColor: Colors.white54,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 5),
                  child: SkeletonAnimation(
                    borderRadius: BorderRadius.circular(10.0),
                    shimmerColor: Colors.white54,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey[300]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          Divider(color: Colors.white, height: 1),
    );
  }
}
