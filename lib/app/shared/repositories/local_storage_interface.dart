abstract class ILocalStorage {
  Future<String> getTheme();
  Future<void> setTheme(String value);
  
  
  Future<String> getCountry();
  Future<void> setCountry(String country);
  
}