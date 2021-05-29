import 'package:mobx/mobx.dart';

part 'country_store.g.dart';

class CountryStore = _CountryStoreBase with _$CountryStore;
abstract class _CountryStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}