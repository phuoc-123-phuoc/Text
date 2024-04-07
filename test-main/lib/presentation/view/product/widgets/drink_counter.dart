// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';
import 'package:mobile_test/app/utils/images.dart';

class DrinkCounter extends StatelessWidget {
  final ValueNotifier<int> currentNumberNotifier;
  final Function() onAdd;
  final Function() onRemove;
  final Function(int) onUpdatePrice; // Add this parameter to the constructor
  final List<Map<String, dynamic>>
      selectedToppings; // Add this parameter to the constructor

  const DrinkCounter({
    Key? key,
    required this.currentNumberNotifier,
    required this.onAdd,
    required this.onRemove,
    required this.onUpdatePrice,
    required this.selectedToppings, // Add this parameter to the constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            if (currentNumberNotifier.value > 1) {
              currentNumberNotifier.value--;
              onUpdatePrice(currentNumberNotifier.value); // Update parameter
            }
          },
          icon: Image.asset(Images.remove),
        ),
        const SizedBox(width: 10),
        ValueListenableBuilder<int>(
          valueListenable: currentNumberNotifier,
          builder: (context, currentNumber, _) {
            return Text(
              "$currentNumber",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        IconButton(
          onPressed: () {
            currentNumberNotifier.value++;
            onUpdatePrice(currentNumberNotifier.value); // Update parameter
          },
          icon: Image.asset(Images.add),
        ),
      ],
    );
  }
}
