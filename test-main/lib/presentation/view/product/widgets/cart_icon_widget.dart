// import 'package:flutter/material.dart';

// class CartIconWidget extends StatefulWidget {
//   CartIconWidget({Key? key}) : super(key: key);

//   @override
//   _CartIconWidgetState createState() => _CartIconWidgetState();
// }

// class _CartIconWidgetState extends State<CartIconWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 70,
//       child: IconButton(
//         icon: Stack(
//           children: <Widget>[
//             Positioned.fill(
//               child: Align(
//                 child: Icon(Icons.shopping_cart, size: 20),
//                 alignment: Alignment.bottomCenter,
//               ),
//               bottom: 0,
//             ),
//             Positioned.fill(
//               child: Align(
//                 child: CartQuantity(),
//                 alignment: Alignment.topCenter,
//               ),
//               top: 0,
//             )
//           ],
//         ),
//         onPressed: () => Navigator.pushNamed(context, "/cart")
//             .then((value) => setState(() {})),
//       ),
//     );
//   }
// }