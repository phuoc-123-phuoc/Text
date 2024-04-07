import 'package:flutter/material.dart';
import 'package:mobile_test/app/utils/images.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.price,
  }) : super(key: key);

  final String text;
  final String price;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
              Size(239, 52)), // Điều chỉnh kích thước của nút
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromRGBO(254, 114, 76, 1)),
          padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
              vertical: 10, horizontal: 20)), // Điều chỉnh padding
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.order),
            const SizedBox(width: 5), // Khoảng cách giữa hình ảnh và văn bản
            Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 5), // Khoảng cách giữa văn bản và giá
            Text(
              price,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
