// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auto_complete_field_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AutoCompleteFieldController on _AutoCompleteFieldControllerBase, Store {
  Computed<bool> _$isShowAutocompleteComputed;

  @override
  bool get isShowAutocomplete => (_$isShowAutocompleteComputed ??=
          Computed<bool>(() => super.isShowAutocomplete))
      .value;

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

  final _$forceShowAutocompleteAtom =
      Atom(name: '_AutoCompleteFieldControllerBase.forceShowAutocomplete');

  @override
  bool get forceShowAutocomplete {
    _$forceShowAutocompleteAtom.context
        .enforceReadPolicy(_$forceShowAutocompleteAtom);
    _$forceShowAutocompleteAtom.reportObserved();
    return super.forceShowAutocomplete;
  }

  @override
  set forceShowAutocomplete(bool value) {
    _$forceShowAutocompleteAtom.context.conditionallyRunInAction(() {
      super.forceShowAutocomplete = value;
      _$forceShowAutocompleteAtom.reportChanged();
    }, _$forceShowAutocompleteAtom,
        name: '${_$forceShowAutocompleteAtom.name}_set');
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
  void setForceShowAutocomplete(bool value) {
    final _$actionInfo =
        _$_AutoCompleteFieldControllerBaseActionController.startAction();
    try {
      return super.setForceShowAutocomplete(value);
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
    final string =
        'latestSearchs: ${latestSearchs.toString()},forceShowAutocomplete: ${forceShowAutocomplete.toString()},isShowAutocomplete: ${isShowAutocomplete.toString()}';
    return '{$string}';
  }
}
