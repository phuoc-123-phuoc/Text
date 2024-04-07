// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobile_test/app/core/constants/app_text_constants.dart';
import 'package:mobile_test/app/resources/dimens/dimensions.dart';
import 'package:mobile_test/data/model/drink_model.dart';
import 'package:mobile_test/presentation/view/product/widgets/custom_button_widget.dart';
import 'package:mobile_test/presentation/view/product/widgets/drink_counter.dart';
import 'package:mobile_test/presentation/view/product/widgets/note_view.dart';
import 'package:mobile_test/presentation/view/product/widgets/option_view.dart';
import 'package:mobile_test/presentation/view/product/widgets/product_images_view.dart';
import 'package:mobile_test/presentation/view/product/widgets/rating_view.dart';
import 'package:mobile_test/presentation/view/product/widgets/size_option_view.dart';
import 'package:mobile_test/presentation/view/product/widgets/topping_option_view.dart';

class ProductDetailsView extends StatefulWidget {
  final DrinkModel? food;

  const ProductDetailsView({Key? key, this.food}) : super(key: key);

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  late ValueNotifier<double> selectedSizePrice;
  ValueNotifier<int> currentNumberNotifier = ValueNotifier<int>(0);
  late ValueNotifier<double> totalPriceNotifier;
  double initialTotalPrice = 45000.0;
  List<Map<String, dynamic>> selectedToppings = [];

  @override
  void initState() {
    super.initState();
    selectedSizePrice = ValueNotifier<double>(45000.0);
    totalPriceNotifier = ValueNotifier<double>(0.0);
  }

  void increaseQuantity() {
    currentNumberNotifier.value++;
    print(currentNumberNotifier
        .value); // Thêm lệnh print để kiểm tra giá trị của currentNumberNotifier
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: SizedBox(
        height: 124,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                DrinkCounter(
                  currentNumberNotifier: currentNumberNotifier,
                  onAdd: () {},
                  onRemove: () {},
                  onUpdatePrice: (quantity) {
                    double toppingPrice = 0;
                    for (var topping in selectedToppings) {
                      toppingPrice += topping["price"];
                    }
                    if (quantity == 1) {
                      totalPriceNotifier.value = initialTotalPrice;
                    } else if (quantity > 1) {
                      totalPriceNotifier.value =
                          (selectedSizePrice.value + toppingPrice) * quantity +
                              initialTotalPrice;
                    }
                  },
                  selectedToppings: selectedToppings,
                ),
                ValueListenableBuilder<double>(
                  valueListenable: totalPriceNotifier,
                  builder: (context, totalPrice, _) {
                    final totalPriceDisplay = totalPrice + initialTotalPrice;
                    return CustomButtonWidget(
                      text: "Thêm vào đơn -",
                      onPressed: increaseQuantity,
                      price: "${(totalPriceDisplay).toStringAsFixed(0)}đ",
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImagesView(
              increaseQuantity: increaseQuantity,
              currentNumberNotifier: currentNumberNotifier,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimensions.paddingSizeSmall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Trà Đào mix Dâu",
                    style: AppTextConstants.textLabel,
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  Text(
                    "Thành phần: Cà phê nguyên chất, sữa, bột béo, đường, hương liệu, ...",
                    style: AppTextConstants.textTitle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const RatingView(),
                      Row(
                        children: [
                          Text(
                            "59.000đ",
                            style: AppTextConstants.textTitlelineThrough,
                          ),
                          const SizedBox(width: Dimensions.fontSizeExtraSmall),
                          Text(
                            "45.000đ",
                            style: AppTextConstants.textPrice,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  SizeOptionView(
                    onSizeSelected: (double price) {
                      selectedSizePrice.value = price;
                      totalPriceNotifier.value = price;
                    },
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  ToppingOptionView(
                    onToppingSelected: (selectedIndexes, selectedToppings) {
                      this.selectedToppings = selectedToppings;
                      double toppingPrice = 0;
                      for (var topping in selectedToppings) {
                        toppingPrice += topping["price"];
                      }
                      totalPriceNotifier.value =
                          selectedSizePrice.value + toppingPrice;
                    },
                    totalPriceNotifier: totalPriceNotifier,
                    selectedSizePrice: selectedSizePrice,
                    toppingOptionList: const [
                      {"id": 1, "name": "Bánh quy", "price": 26000.0},
                      {
                        "id": 2,
                        "name": "Bánh Bông Lan Trứng Muối",
                        "price": 26000.0
                      },
                      {"id": 3, "name": "Bánh quy bơ", "price": 26000.0}
                    ],
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  OptionView(
                    onOptionSelected: (index) {
                      print(index);
                    },
                  ),
                  const SizedBox(height: Dimensions.paddingSizeSmall),
                  const NoteView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
