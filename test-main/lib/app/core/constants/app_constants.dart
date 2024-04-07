import 'package:mobile_test/app/utils/images.dart';
import 'package:mobile_test/data/model/language/language_model.dart';

class AppConstants {
  static const String appName = 'Mobile Test';



  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.vn,
        languageName: 'Vietnamese',
        countryCode: 'VN',
        languageCode: 'vi'),
    LanguageModel(
        imageUrl: Images.en,
        languageName: 'English',
        countryCode: 'US',
        languageCode: 'en'),
  ];
}
