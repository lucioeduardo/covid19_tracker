// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsController on _SettingsControllerBase, Store {
  final _$formErrorsAtom = Atom(name: '_SettingsControllerBase.formErrors');

  @override
  ObservableMap<String, String> get formErrors {
    _$formErrorsAtom.context.enforceReadPolicy(_$formErrorsAtom);
    _$formErrorsAtom.reportObserved();
    return super.formErrors;
  }

  @override
  set formErrors(ObservableMap<String, String> value) {
    _$formErrorsAtom.context.conditionallyRunInAction(() {
      super.formErrors = value;
      _$formErrorsAtom.reportChanged();
    }, _$formErrorsAtom, name: '${_$formErrorsAtom.name}_set');
  }

  final _$_SettingsControllerBaseActionController =
      ActionController(name: '_SettingsControllerBase');

  @override
  void addError(String field, String msg) {
    final _$actionInfo =
        _$_SettingsControllerBaseActionController.startAction();
    try {
      return super.addError(field, msg);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cleanError(String field) {
    final _$actionInfo =
        _$_SettingsControllerBaseActionController.startAction();
    try {
      return super.cleanError(field);
    } finally {
      _$_SettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'formErrors: ${formErrors.toString()}';
    return '{$string}';
  }
}
