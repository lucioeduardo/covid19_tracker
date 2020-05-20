// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_complete_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AutoCompleteFieldController on _AutoCompleteFieldControllerBase, Store {
  final _$latestSearchsAtom =
      Atom(name: '_AutoCompleteFieldControllerBase.latestSearchs');

  @override
  ObservableFuture<List<String>> get latestSearchs {
    _$latestSearchsAtom.context.enforceReadPolicy(_$latestSearchsAtom);
    _$latestSearchsAtom.reportObserved();
    return super.latestSearchs;
  }

  @override
  set latestSearchs(ObservableFuture<List<String>> value) {
    _$latestSearchsAtom.context.conditionallyRunInAction(() {
      super.latestSearchs = value;
      _$latestSearchsAtom.reportChanged();
    }, _$latestSearchsAtom, name: '${_$latestSearchsAtom.name}_set');
  }

  final _$_AutoCompleteFieldControllerBaseActionController =
      ActionController(name: '_AutoCompleteFieldControllerBase');

  @override
  void loadLatestSearchs() {
    final _$actionInfo =
        _$_AutoCompleteFieldControllerBaseActionController.startAction();
    try {
      return super.loadLatestSearchs();
    } finally {
      _$_AutoCompleteFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addToLatestSearchs(String search) {
    final _$actionInfo =
        _$_AutoCompleteFieldControllerBaseActionController.startAction();
    try {
      return super.addToLatestSearchs(search);
    } finally {
      _$_AutoCompleteFieldControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'latestSearchs: ${latestSearchs.toString()}';
    return '{$string}';
  }
}
