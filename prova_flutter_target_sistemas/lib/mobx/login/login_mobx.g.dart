// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_mobx.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginStore on LoginStoreAbstract, Store {
  late final _$esconderSenhaAtom =
      Atom(name: 'LoginStoreAbstract.esconderSenha', context: context);

  @override
  bool get esconderSenha {
    _$esconderSenhaAtom.reportRead();
    return super.esconderSenha;
  }

  @override
  set esconderSenha(bool value) {
    _$esconderSenhaAtom.reportWrite(value, super.esconderSenha, () {
      super.esconderSenha = value;
    });
  }

  late final _$manterLoginAtom =
      Atom(name: 'LoginStoreAbstract.manterLogin', context: context);

  @override
  bool get manterLogin {
    _$manterLoginAtom.reportRead();
    return super.manterLogin;
  }

  @override
  set manterLogin(bool value) {
    _$manterLoginAtom.reportWrite(value, super.manterLogin, () {
      super.manterLogin = value;
    });
  }

  late final _$LoginStoreAbstractActionController =
      ActionController(name: 'LoginStoreAbstract', context: context);

  @override
  void alternarVisibilidade() {
    final _$actionInfo = _$LoginStoreAbstractActionController.startAction(
        name: 'LoginStoreAbstract.alternarVisibilidade');
    try {
      return super.alternarVisibilidade();
    } finally {
      _$LoginStoreAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  void alternarManterLogin() {
    final _$actionInfo = _$LoginStoreAbstractActionController.startAction(
        name: 'LoginStoreAbstract.alternarManterLogin');
    try {
      return super.alternarManterLogin();
    } finally {
      _$LoginStoreAbstractActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
esconderSenha: ${esconderSenha},
manterLogin: ${manterLogin}
    ''';
  }
}
