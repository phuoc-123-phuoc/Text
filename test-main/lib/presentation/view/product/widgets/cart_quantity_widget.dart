// import 'package:flutter/material.dart';
// import 'package:mobile_test/presentation/view/product/product.dart';

// class CartQuantity extends StatefulWidget {
//   const CartQuantity({super.key, this.childOfNavBar = false});

//   final bool childOfNavBar;

//   static String state = "cart_quantity";

//   @override
//   _CartQuantityState createState() => _CartQuantityState();
// }

// class _CartQuantityState extends State<CartQuantity> {
//   Future<List<DrinkModel>> getCartItems() async {
//     List<DrinkModel> data = await DrinkModel(
//             id: 0,
//             name: '',
//             price: 0,
//             description: '',
//             rating: 0,
//             img: '',
//             favorite: 0,
//             salePrice: 0)
//         .getCartItems();
//     return Future.value(data);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<DrinkModel>>(
//       builder:
//           (BuildContext context, AsyncSnapshot<List<DrinkModel>> snapshot) {
//         String cartValue = "0";

//         if (snapshot.data == null) {
//           return SizedBox.shrink();
//         }
//         return Text(
//           cartValue,
//           style: Theme.of(context).textTheme.bodyMedium,
//           textAlign: TextAlign.center,
//         );
//       },
//       future: getCartItems(),
//     );
//   }
// }
