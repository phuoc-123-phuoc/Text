import 'package:flutter/material.dart';

class ProductImagesView extends StatelessWidget {
  final VoidCallback increaseQuantity; // Callback function to increase quantity
  final ValueNotifier<int>
      currentNumberNotifier; // Value notifier for current number

  const ProductImagesView({
    required this.increaseQuantity,
    required this.currentNumberNotifier, // Required parameter
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Container(
            height: MediaQuery.of(context).size.width - 20,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/product.jpg"),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 40,
          left: 10,
          right: 10,
          child: Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  fixedSize: const Size(50, 50),
                ),
                icon: const Icon(Icons.arrow_back),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {},
                icon: Row(
                  children: [
                    const Icon(Icons.shopping_cart_outlined),
                    const SizedBox(
                        width: 1), // Khoảng cách giữa biểu tượng và số lượng
                    ValueListenableBuilder<int>(
                      valueListenable: currentNumberNotifier,
                      builder: (context, value, _) {
                        return Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '$value',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          top: MediaQuery.of(context).size.width - 50,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
