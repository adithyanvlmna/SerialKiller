import 'package:flutter/material.dart';

class CustomAppBarClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Start at the top left of the AppBar
    path.lineTo(0.0, size.height - 50); // Move down a bit to start the curve

    // Create an inward curve (concave curve)
    var controlPoint = Offset(
        size.width / 2,
        size.height -
            150); // Control point is above the bottom to make it concave
    var endPoint =
        Offset(size.width, size.height - 50); // End at the same height

    // Create a quadratic bezier curve with a concave shape
    path.quadraticBezierTo(
        controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    // Complete the path
    path.lineTo(size.width, 0.0); // Line to top right
    path.close(); // Close the path

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
