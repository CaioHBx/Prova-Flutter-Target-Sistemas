// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on HomeStoreAbstract, Store {
  late final _$textosAtom =
      Atom(name: 'HomeStoreAbstract.textos', context: context);

  @override
  ObservableList<String> get textos {
    _$textosAtom.reportRead();
    return super.textos;
  }

  @override
  set textos(ObservableList<String> value) {
    _$textosAtom.reportWrite(value, super.textos, () {
      super.textos = value;
    });
  }

  late final _$HomeStoreAbstractActionController =
      ActionController(name: 'HomeStoreAbstract', context: context);

  @override
  void carregarLista(List<String> lista) {
    final _$actionInfo = _$HomeStoreAbstractActionController.startAction(
        name: 'HomeStoreAbstract.carregarLista');
    try {
      return super.carregarLista(lista);
    } finally {
      _$HomeStoreAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void adicionarTexto(String texto) {
    final _$actionInfo = _$HomeStoreAbstractActionController.startAction(
        name: 'HomeStoreAbstract.adicionarTexto');
    try {
      return super.adicionarTexto(texto);
    } finally {
      _$HomeStoreAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void editTexto(int index, String novoTexto) {
    final _$actionInfo = _$HomeStoreAbstractActionController.startAction(
        name: 'HomeStoreAbstract.editTexto');
    try {
      return super.editTexto(index, novoTexto);
    } finally {
      _$HomeStoreAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removerTexto(int index) {
    final _$actionInfo = _$HomeStoreAbstractActionController.startAction(
        name: 'HomeStoreAbstract.removerTexto');
    try {
      return super.removerTexto(index);
    } finally {
      _$HomeStoreAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
textos: ${textos}
    ''';
  }
}
