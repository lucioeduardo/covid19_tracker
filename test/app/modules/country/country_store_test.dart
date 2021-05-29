import 'package:flutter_test/flutter_test.dart';
import 'package:projeto_pp/app/modules/country/country_store.dart';
 
void main() {
  late CountryStore store;

  setUpAll(() {
    store = CountryStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}