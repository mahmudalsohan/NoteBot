import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color buttonColor;
  final double borderRadius;
  final double height;
  const ReusableButton({
    required this.onTap,
    required this.buttonColor,
    this.borderRadius: 4.0,
    this.height: 50.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),
        onPressed: () {
          onTap();
        },
        child: child,
      ),
    );
  }
}
