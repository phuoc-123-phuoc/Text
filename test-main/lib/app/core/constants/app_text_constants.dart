import 'package:flutter/material.dart';
import 'package:mobile_test/app/resources/dimens/dimensions.dart';
import 'package:mobile_test/app/utils/color_resources.dart';

class AppTextConstants {
  static TextStyle textLabel = const TextStyle(
    fontFamily: "SemiBold",
    fontSize: Dimensions.fontSizeWallet,
    fontWeight: FontWeight.bold,
  );
  static TextStyle textPrice = const TextStyle(
    fontFamily: "SemiBold",
    fontSize: Dimensions.fontSizeWallet,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textTitle = const TextStyle(
    fontFamily: "Regular",
    fontSize: Dimensions.fontSizeDefault,
    fontWeight: FontWeight.normal,
  );
  static TextStyle textTitlelineThrough = const TextStyle(
    fontFamily: "Regular",
    fontSize: Dimensions.fontSizeDefault,
    fontWeight: FontWeight.normal,
    decoration: TextDecoration.lineThrough,
  );

  static TextStyle textSubTitle = const TextStyle(
    fontFamily: "Regular",
    fontSize: Dimensions.fontSizeDefault,
    fontWeight: FontWeight.normal,
    color: ColorResources.noteSub,
  );
}
