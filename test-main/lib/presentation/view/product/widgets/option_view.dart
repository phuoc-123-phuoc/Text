import 'package:flutter/material.dart';
import 'package:mobile_test/app/core/common/divider/common_divider.dart';
import 'package:mobile_test/app/utils/images.dart';
import 'package:mobile_test/app/utils/price_converter.dart';

typedef void OptionSelectedCallback(int? index);

class OptionView extends StatefulWidget {
  final OptionSelectedCallback onOptionSelected;

  const OptionView({Key? key, required this.onOptionSelected})
      : super(key: key);

  @override
  State<OptionView> createState() => _OptionViewState();
}

class _OptionViewState extends State<OptionView> {
  final List<Map<String, dynamic>> options = [
    {"id": 0, "name": "Không đường", "price": 0.0},
    {"id": 1, "name": "Ít đường", "price": 0.0},
    {"id": 2, "name": "Nhiều đường", "price": 0.0},
    {"id": 3, "name": "Không đá", "price": 0.0},
    {"id": 4, "name": "Ít đá", "price": 0.0},
    {"id": 5, "name": "Nhiều đá", "price": 0.0}
  ];
  int? selectedOptionIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              "Yêu cầu thành phần",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Semibold",
              ),
            ),
            SizedBox(width: 10),
            Text(
              "( Không bắt buộc )",
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
          separatorBuilder: (context, index) => CommonDivider(),
          physics: NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (BuildContext context, int index) {
            final option = options[index];
            return ListTile(
              onTap: () {
                setState(() {
                  if (selectedOptionIndex == option['id']) {
                    // Nếu tùy chọn đang được chọn là tùy chọn hiện tại,
                    // thì hủy chọn bằng cách gán selectedOptionIndex = null
                    selectedOptionIndex = null;
                  } else {
                    selectedOptionIndex = option['id'];
                  }
                });
                widget.onOptionSelected(selectedOptionIndex);
              },
              leading: selectedOptionIndex == option['id']
                  ? Image.asset(Images.chooseAddons2)
                  : Image.asset(Images.chooseAddons),
              title: Text(
                '${option["name"]}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: "Regular",
                ),
              ),
              trailing: Text(
                PriceConverter.formatDong(option["price"].toString()),
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
