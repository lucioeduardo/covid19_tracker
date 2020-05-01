import 'package:corona_data/app/shared/utils/localization/localization_interface.dart';

class ENUSLocale extends ILocalization{
  @override
  String get countryCode => 'US';

  @override
  String get languageCode => 'en';

  @override
  String get name => 'United States';

  static const String key = "United States";

}