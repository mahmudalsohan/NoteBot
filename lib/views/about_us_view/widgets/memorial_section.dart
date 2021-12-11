import 'package:butex_notebot/constants/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

Widget memorialSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
        height: 40,
        width: Get.width * 0.5,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(40),
            topLeft: Radius.circular(40),
            topRight: Radius.circular(3),
            bottomLeft: Radius.circular(3),
          ),
        ),
        child: Center(
          child: Text(
            "Forever in Our Heart",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
      SizedBox(height: 20),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: networkController.memorialList.length,
        itemBuilder: (context, index) {
          var memoryOf = networkController.memorialList[index];
          return Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: "${memoryOf.name}, ",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    TextSpan(
                      text: memoryOf.about,
                      style: TextStyle(color: Colors.grey.shade800),
                    ),
                    TextSpan(
                      text: " (${memoryOf.diedIn})",
                      style: TextStyle(color: Colors.grey.shade800),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
      SizedBox(height: 30),
      Text(
        "- May This List Ends Here...",
        style: TextStyle(fontSize: 16),
      ),
      SizedBox(height: 50),
    ],
  );
}
