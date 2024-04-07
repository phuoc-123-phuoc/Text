import 'package:flutter/material.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/images/star.png'),
        const Text(
          "4.5",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
