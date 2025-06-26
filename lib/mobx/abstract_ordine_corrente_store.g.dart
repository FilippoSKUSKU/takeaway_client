// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'abstract_ordine_corrente_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrdineCorrente on _OrdineCorrente, Store {
  late final _$elementiOrdineCorrenteMapAtom = Atom(
    name: '_OrdineCorrente.elementiOrdineCorrenteMap',
    context: context,
  );

  @override
  ObservableMap<int, int> get elementiOrdineCorrenteMap {
    _$elementiOrdineCorrenteMapAtom.reportRead();
    return super.elementiOrdineCorrenteMap;
  }

  @override
  set elementiOrdineCorrenteMap(ObservableMap<int, int> value) {
    _$elementiOrdineCorrenteMapAtom.reportWrite(
      value,
      super.elementiOrdineCorrenteMap,
      () {
        super.elementiOrdineCorrenteMap = value;
      },
    );
  }

  late final _$_OrdineCorrenteActionController = ActionController(
    name: '_OrdineCorrente',
    context: context,
  );

  @override
  void aggiungiElemento(int portataId) {
    final _$actionInfo = _$_OrdineCorrenteActionController.startAction(
      name: '_OrdineCorrente.aggiungiElemento',
    );
    try {
      return super.aggiungiElemento(portataId);
    } finally {
      _$_OrdineCorrenteActionController.endAction(_$actionInfo);
    }
  }

  @override
  void rimuoviElemento(int portataId) {
    final _$actionInfo = _$_OrdineCorrenteActionController.startAction(
      name: '_OrdineCorrente.rimuoviElemento',
    );
    try {
      return super.rimuoviElemento(portataId);
    } finally {
      _$_OrdineCorrenteActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
elementiOrdineCorrenteMap: ${elementiOrdineCorrenteMap}
    ''';
  }
}
