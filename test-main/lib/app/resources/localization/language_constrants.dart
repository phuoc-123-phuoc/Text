import 'package:flutter/material.dart';
import 'package:mobile_test/app/resources/localization/app_localization.dart';

String? getTranslated(String? key, BuildContext context) {
  return AppLocalization.of(context)!.translate(key);
}