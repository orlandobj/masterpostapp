// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cadastro_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CadastroStore on _CadastroStore, Store {
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_CadastroStore.isFormValid'))
          .value;

  final _$nomeAtom = Atom(name: '_CadastroStore.nome');

  @override
  String get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  final _$passVisibleAtom = Atom(name: '_CadastroStore.passVisible');

  @override
  bool get passVisible {
    _$passVisibleAtom.reportRead();
    return super.passVisible;
  }

  @override
  set passVisible(bool value) {
    _$passVisibleAtom.reportWrite(value, super.passVisible, () {
      super.passVisible = value;
    });
  }

  final _$cpfAtom = Atom(name: '_CadastroStore.cpf');

  @override
  String get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  final _$passAtom = Atom(name: '_CadastroStore.pass');

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

  final _$confirmPassAtom = Atom(name: '_CadastroStore.confirmPass');

  @override
  String get confirmPass {
    _$confirmPassAtom.reportRead();
    return super.confirmPass;
  }

  @override
  set confirmPass(String value) {
    _$confirmPassAtom.reportWrite(value, super.confirmPass, () {
      super.confirmPass = value;
    });
  }

  final _$telefoneAtom = Atom(name: '_CadastroStore.telefone');

  @override
  String get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  final _$emailAtom = Atom(name: '_CadastroStore.email');

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

  final _$_CadastroStoreActionController =
      ActionController(name: '_CadastroStore');

  @override
  void setNome(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void turnVisible() {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.turnVisible');
    try {
      return super.turnVisible();
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCpf(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setCpf');
    try {
      return super.setCpf(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPass(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setPass');
    try {
      return super.setPass(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPass(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setConfirmPass');
    try {
      return super.setConfirmPass(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_CadastroStoreActionController.startAction(
        name: '_CadastroStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_CadastroStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
passVisible: ${passVisible},
cpf: ${cpf},
pass: ${pass},
confirmPass: ${confirmPass},
telefone: ${telefone},
email: ${email},
isFormValid: ${isFormValid}
    ''';
  }
}
