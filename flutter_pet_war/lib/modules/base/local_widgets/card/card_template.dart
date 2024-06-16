import 'package:flutter/material.dart';

class CardTemplate extends StatelessWidget {
  const CardTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
    );
  }
}
