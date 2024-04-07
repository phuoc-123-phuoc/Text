import 'package:flutter/material.dart';

class CommonConstrainBoxButton extends StatelessWidget {
  const CommonConstrainBoxButton(
      {super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(width: 200, height: 50),
        child: ElevatedButton(
          style: ButtonStyle(
            minimumSize: const MaterialStatePropertyAll(Size(20, 60)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
                const Color.fromARGB(255, 40, 127, 60)),
            // padding: MaterialStateProperty.all(EdgeInsets.all(14)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
