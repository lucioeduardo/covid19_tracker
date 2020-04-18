abstract class ILocalStorage {
  Future<bool> isThemeDark();
  Future<void> setTheme(bool value);
  
  Future<String> getCountry();
  Future<void> setCountry(String country);
  
}