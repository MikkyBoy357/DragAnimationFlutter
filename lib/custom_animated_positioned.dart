import 'package:flutter/material.dart';

import 'custom_square.dart';

class CustomAnimatedPositioned extends StatelessWidget {
  final Function(DragStartDetails)? onPanStart;
  final Function(DragUpdateDetails)? onPanUpdate;
  final Function(DragEndDetails)? onPanEnd;
  final Offset? currentDragOffset;
  final Duration duration;
  final double size;
  final Color color;

  const CustomAnimatedPositioned({
    Key? key,
    required this.onPanStart,
    required this.onPanUpdate,
    required this.onPanEnd,
    required this.currentDragOffset,
    required this.duration,
    required this.size,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      // curve: Interval(0.06, 1.0),
      left: currentDragOffset?.dx,
      top: currentDragOffset?.dy,
      duration: duration,
      child: GestureDetector(
        onPanStart: onPanStart,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: CustomSquare(
          width: size,
          height: size,
          color: color,
        ),
      ),
    );
  }
}
