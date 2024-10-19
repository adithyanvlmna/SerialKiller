import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Widget child;

  const Customcontainer(
      {super.key,
      required this.child,
      required this.color,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(30)),
      child: child,
    );
  }
}
