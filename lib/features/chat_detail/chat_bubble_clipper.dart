import 'package:flutter/material.dart';

class ChatBubbleClipperLeft extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double radius = 16;
    double tailWidth = 28;   // Wider tail
    double tailHeight = 44;  // Longer tail

    Path path = Path();
    path.moveTo(radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(size.width, size.height, size.width - radius, size.height);
    path.lineTo(radius + tailWidth, size.height);

    // Longer, more curved WhatsApp-like tail
    path.cubicTo(
      radius + tailWidth * 0.7, size.height, // control point 1
      radius - tailWidth * 0.8, size.height + tailHeight * 0.7, // control point 2 (move left and down)
      radius - 36, size.height + tailHeight // end point (move left and down)
    );
    path.quadraticBezierTo(
      radius - 48, size.height + tailHeight * 0.7,
      -16, size.height // tail tip
    );

    path.lineTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}