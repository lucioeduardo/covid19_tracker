String capitalize(String string) {
  if (string == null) {
    throw ArgumentError("string: $string");
  }

  if (string.isEmpty) {
    return string;
  }
  string = string.toLowerCase();

  return string[0].toUpperCase() + string.substring(1);
}