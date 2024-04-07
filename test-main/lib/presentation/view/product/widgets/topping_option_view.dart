import 'package:flutter/material.dart';
import 'package:mobile_test/app/core/common/divider/common_divider.dart';
import 'package:mobile_test/app/utils/images.dart';
import 'package:mobile_test/app/utils/price_converter.dart';

typedef void ToppingSelectedCallback(
    List<int> selectedIndexes, List<Map<String, dynamic>> selectedToppings);

class ToppingOptionView extends StatefulWidget {
  final ToppingSelectedCallback onToppingSelected;
  final ValueNotifier<double> totalPriceNotifier;
  final ValueNotifier<double> selectedSizePrice;

  const ToppingOptionView({
    Key? key,
    required this.onToppingSelected,
    required this.totalPriceNotifier,
    required this.selectedSizePrice,
    required List<Map<String, dynamic>> toppingOptionList,
  }) : super(key: key);

  @override
  State<ToppingOptionView> createState() => _ToppingOptionViewState();
}

class _ToppingOptionViewState extends State<ToppingOptionView> {
  late List<bool> isToppingSelected;
  late List<Map<String, dynamic>> selectedToppings;

  final List<Map<String, dynamic>> toppings = [
    {"id": 1, "name": "Bánh quy", "price": 26000.0},
    {"id": 2, "name": "Bánh Bông Lan Trứng Muối", "price": 26000.0},
    {"id": 3, "name": "Bánh quy bơ", "price": 26000.0}
  ];

  late ValueNotifier<List<bool>> selectedNotifier;

  @override
  void initState() {
    super.initState();
    isToppingSelected = List.generate(toppings.length, (index) => false);
    selectedToppings = [];
    selectedNotifier = ValueNotifier<List<bool>>(isToppingSelected);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Chọn Topping",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Semibold",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "(Không bắt buộc)",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontFamily: "Semibold",
              ),
            ),
          ],
        ),
        ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (context, index) => const CommonDivider(),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: toppings.length,
          itemBuilder: (BuildContext context, int index) {
            final topping = toppings[index];
            return ValueListenableBuilder<List<bool>>(
              valueListenable: selectedNotifier,
              builder: (context, isSelected, _) {
                return ListTile(
                  onTap: () {
                    final List<bool> updatedSelected =
                        List<bool>.from(isSelected);
                    if (updatedSelected[index]) {
                      updatedSelected[index] = false;
                      selectedToppings.removeWhere(
                          (element) => element["id"] == topping["id"]);
                    } else {
                      updatedSelected[index] = true;
                      selectedToppings.add(topping);
                    }
                    selectedNotifier.value = updatedSelected;
                    _updateTotalPrice();
                    widget.onToppingSelected(
                        _getSelectedIndexes(updatedSelected), selectedToppings);
                  },
                  leading: isSelected[index]
                      ? Image.asset(Images.chooseAddons2)
                      : Image.asset(Images.chooseAddons),
                  title: Text(
                    '${topping["name"]}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      fontFamily: "Regular",
                    ),
                  ),
                  trailing: Text(
                    PriceConverter.formatDong(topping["price"].toString()),
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Regular",
                    ),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }

  List<int> _getSelectedIndexes(List<bool> isSelected) {
    List<int> indexes = [];
    for (int i = 0; i < isSelected.length; i++) {
      if (isSelected[i]) {
        indexes.add(i);
      }
    }
    return indexes;
  }

  void _updateTotalPrice() {
    double toppingPrice = 0;
    for (var topping in selectedToppings) {
      toppingPrice += topping["price"];
    }
    widget.totalPriceNotifier.value =
        widget.selectedSizePrice.value + toppingPrice;
  }
}
