import 'package:corona_data/app/shared/models/country_model.dart';

abstract class ILocalStorage {
  Future<String> getTheme();
  Future<void> setTheme(String value);
  
  
  Future<CountryModel> getCountry();
  Future<void> setCountry(CountryModel country);
  
}