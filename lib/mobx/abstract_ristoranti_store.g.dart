// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_ristoranti_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Ristoranti on _Ristoranti, Store {
  late final _$ristorantiListAtom = Atom(
    name: '_Ristoranti.ristorantiList',
    context: context,
  );

  @override
  ObservableList<RistoranteDto> get ristorantiList {
    _$ristorantiListAtom.reportRead();
    return super.ristorantiList;
  }

  @override
  set ristorantiList(ObservableList<RistoranteDto> value) {
    _$ristorantiListAtom.reportWrite(value, super.ristorantiList, () {
      super.ristorantiList = value;
    });
  }

  late final _$toShowAtom = Atom(name: '_Ristoranti.toShow', context: context);

  @override
  ObservableList<RistoranteDto> get toShow {
    _$toShowAtom.reportRead();
    return super.toShow;
  }

  @override
  set toShow(ObservableList<RistoranteDto> value) {
    _$toShowAtom.reportWrite(value, super.toShow, () {
      super.toShow = value;
    });
  }

  late final _$fetchGaveErrorAtom = Atom(
    name: '_Ristoranti.fetchGaveError',
    context: context,
  );

  @override
  bool get fetchGaveError {
    _$fetchGaveErrorAtom.reportRead();
    return super.fetchGaveError;
  }

  @override
  set fetchGaveError(bool value) {
    _$fetchGaveErrorAtom.reportWrite(value, super.fetchGaveError, () {
      super.fetchGaveError = value;
    });
  }

  late final _$fetchIsLoadingAtom = Atom(
    name: '_Ristoranti.fetchIsLoading',
    context: context,
  );

  @override
  bool get fetchIsLoading {
    _$fetchIsLoadingAtom.reportRead();
    return super.fetchIsLoading;
  }

  @override
  set fetchIsLoading(bool value) {
    _$fetchIsLoadingAtom.reportWrite(value, super.fetchIsLoading, () {
      super.fetchIsLoading = value;
    });
  }

  late final _$fetchRistorantiListAsyncAction = AsyncAction(
    '_Ristoranti.fetchRistorantiList',
    context: context,
  );

  @override
  Future<void> fetchRistorantiList() {
    return _$fetchRistorantiListAsyncAction.run(
      () => super.fetchRistorantiList(),
    );
  }

  late final _$_RistorantiActionController = ActionController(
    name: '_Ristoranti',
    context: context,
  );

  @override
  void initToShow() {
    final _$actionInfo = _$_RistorantiActionController.startAction(
      name: '_Ristoranti.initToShow',
    );
    try {
      return super.initToShow();
    } finally {
      _$_RistorantiActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterToShow(bool Function(RistoranteDto) test) {
    final _$actionInfo = _$_RistorantiActionController.startAction(
      name: '_Ristoranti.filterToShow',
    );
    try {
      return super.filterToShow(test);
    } finally {
      _$_RistorantiActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ristorantiList: ${ristorantiList},
toShow: ${toShow},
fetchGaveError: ${fetchGaveError},
fetchIsLoading: ${fetchIsLoading}
    ''';
  }
}
