// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile_test/app/core/common/divider/common_divider.dart';
import 'package:mobile_test/app/utils/images.dart';
import 'package:mobile_test/app/utils/price_converter.dart';

typedef void SizeSelectedCallback(double price);

class SizeOptionView extends StatefulWidget {
  final SizeSelectedCallback onSizeSelected;

  const SizeOptionView({Key? key, required this.onSizeSelected})
      : super(key: key);

  @override
  State<SizeOptionView> createState() => _SizeOptionViewState();
}

class _SizeOptionViewState extends State<SizeOptionView> {
  final List<Map<String, dynamic>> sizes = [
    {"id": 1, "name": "S", "price": 0.0},
    {"id": 2, "name": "M", "price": 5000.0},
    {"id": 3, "name": "L", "price": 10000.0}
  ];

  late ValueNotifier<double?> selectedSizePrice;

  @override
  void initState() {
    super.initState();
    selectedSizePrice = ValueNotifier<double?>(null);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Chọn Size",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Semibold",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "(Bắt buộc)",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontFamily: "Semibold",
              ),
            ),
          ],
        ),

        const SizedBox(height: 8), // Thêm một khoảng cách từ dưới lên
        ListView.separated(
          padding: EdgeInsets.zero, // Xóa bỏ padding mặc định của ListView
          shrinkWrap: true,
          separatorBuilder: (context, index) => const CommonDivider(),
          physics: const NeverScrollableScrollPhysics(),
          itemCount: sizes.length,
          itemBuilder: (BuildContext context, int index) {
            final size = sizes[index];
            return ListTile(
              onTap: () {
                selectedSizePrice.value =
                    size["price"]; // Update value directly
                widget.onSizeSelected(size["price"]);
              },
              leading: ValueListenableBuilder<double?>(
                valueListenable: selectedSizePrice,
                builder: (context, price, _) {
                  return index ==
                          sizes.indexWhere(
                              (element) => element["price"] == price)
                      ? Image.asset(Images.chooseAddons2)
                      : Image.asset(Images.chooseAddons);
                },
              ),
              title: Text(
                '${size["name"]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Regular",
                ),
              ),
              trailing: Text(
                PriceConverter.formatDong(size["price"].toString()),
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Regular",
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
