abstract class ILocalStorage {
  Future<bool> isThemeDark();
  Future<void> setTheme(bool value);
}