import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_test/app/core/constants/app_constants.dart';
import 'package:mobile_test/app/helper/custom_delegate.dart';
import 'package:mobile_test/presentation/view/product/product_details_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app/resources/localization/app_localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<Locale> locals = [];
    for (var language in AppConstants.languages) {
      locals.add(Locale(language.languageCode!, language.countryCode));
    }
    return MaterialApp(
      title: 'Flutter Mobile Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Raleway',
          textTheme: const TextTheme(
            bodyLarge: TextStyle(fontSize: 20),
          )),
      home: const ProductDetailsView(),
    );
  }
}
