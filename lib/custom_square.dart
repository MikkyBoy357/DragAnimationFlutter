import 'package:flutter/material.dart';

class CustomSquare extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomSquare({
    Key? key,
    required this.width,
    required this.height,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            width: width,
            height: height,
            duration: Duration(seconds: 3),
            decoration: BoxDecoration(
              border: Border.all(
                color: color,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
