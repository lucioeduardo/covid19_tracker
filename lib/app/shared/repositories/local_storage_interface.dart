abstract class ILocalStorage {
  Future<bool> isThemeDark();
  Future<String> getTheme();
  Future<void> setTheme(String value);
  
  
  Future<String> getCountry();
  Future<void> setCountry(String country);
  
}