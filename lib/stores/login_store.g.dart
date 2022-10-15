// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_LoginStore.isFormValid'))
          .value;

  final _$emailAtom = Atom(name: '_LoginStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$tokenAtom = Atom(name: '_LoginStore.token');

  @override
  String get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(String value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$rememberAtom = Atom(name: '_LoginStore.remember');

  @override
  bool get remember {
    _$rememberAtom.reportRead();
    return super.remember;
  }

  @override
  set remember(bool value) {
    _$rememberAtom.reportWrite(value, super.remember, () {
      super.remember = value;
    });
  }

  final _$emailValidAtom = Atom(name: '_LoginStore.emailValid');

  @override
  bool get emailValid {
    _$emailValidAtom.reportRead();
    return super.emailValid;
  }

  @override
  set emailValid(bool value) {
    _$emailValidAtom.reportWrite(value, super.emailValid, () {
      super.emailValid = value;
    });
  }

  final _$passAtom = Atom(name: '_LoginStore.pass');

  @override
  String get pass {
    _$passAtom.reportRead();
    return super.pass;
  }

  @override
  set pass(String value) {
    _$passAtom.reportWrite(value, super.pass, () {
      super.pass = value;
    });
  }

  final _$passValidAtom = Atom(name: '_LoginStore.passValid');

  @override
  bool get passValid {
    _$passValidAtom.reportRead();
    return super.passValid;
  }

  @override
  set passValid(bool value) {
    _$passValidAtom.reportWrite(value, super.passValid, () {
      super.passValid = value;
    });
  }

  final _$rememberCredentialsAsyncAction =
      AsyncAction('_LoginStore.rememberCredentials');

  @override
  Future<dynamic> rememberCredentials() {
    return _$rememberCredentialsAsyncAction
        .run(() => super.rememberCredentials());
  }

  final _$_LoginStoreActionController = ActionController(name: '_LoginStore');

  @override
  dynamic toggleRemember() {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.toggleRemember');
    try {
      return super.toggleRemember();
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(dynamic value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkEmailValid(bool check) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.checkEmailValid');
    try {
      return super.checkEmailValid(check);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(dynamic value) {
    final _$actionInfo =
        _$_LoginStoreActionController.startAction(name: '_LoginStore.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkPassValid(bool check) {
    final _$actionInfo = _$_LoginStoreActionController.startAction(
        name: '_LoginStore.checkPassValid');
    try {
      return super.checkPassValid(check);
    } finally {
      _$_LoginStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
token: ${token},
remember: ${remember},
emailValid: ${emailValid},
pass: ${pass},
passValid: ${passValid},
isFormValid: ${isFormValid}
    ''';
  }
}
