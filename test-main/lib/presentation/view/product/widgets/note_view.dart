import 'package:flutter/material.dart';
import 'package:mobile_test/app/core/common/input/common_form_field_widget.dart';
import 'package:mobile_test/app/utils/color_resources.dart';
import 'package:mobile_test/presentation/view/product/product.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              "Thêm lưu ý cho quán",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Semibold",
              ),
            ),
            const SizedBox(width: 10),
            Text(
              "( không bắt buộc )",
              style: AppTextConstants.textSubTitle,
            ),
          ],
        ),
        const SizedBox(height: 10),
        CommonFormFieldWidget(
          labelText: "Ghi chú ở đây",
          setValueFunc: (value) {},
        ),
        const SizedBox(height: 10),
        const Text(
          "Việc thực hiện yêu cầu còn tùy thuộc vào khả năng của quán",
          softWrap: true,
        )
      ],
    );
  }
}
