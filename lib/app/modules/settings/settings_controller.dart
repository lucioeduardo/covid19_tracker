import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'settings_controller.g.dart';

class SettingsController = _SettingsControllerBase with _$SettingsController;

abstract class _SettingsControllerBase with Store implements Disposable {

  @observable
  ObservableMap<String,String> formErrors=ObservableMap();

  @action
  void addError(String field, String msg){
    
    formErrors[field]=msg;
    
  }
  @action
  void cleanError(String field){
    formErrors.remove(field);
  }

  @override
  void dispose() {
    // print("Settings dispose");
  }
}
