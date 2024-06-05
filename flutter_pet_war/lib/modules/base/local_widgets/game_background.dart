import 'package:flutter/material.dart';

class GameBackground extends StatelessWidget {
  final Widget child;
  const GameBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        image: const DecorationImage(
          fit: BoxFit.fill,
          opacity: 0.5,
          image: AssetImage("assets/images/forest.jpg"),
        ),
      ),
      child: child,
    );
  }
}
