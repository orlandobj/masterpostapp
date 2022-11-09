import 'package:mobx/mobx.dart';

part 'cadastro_store.g.dart';

class CadastroStore = _CadastroStore with _$CadastroStore;

abstract class _CadastroStore with Store {
  @observable
  String nome = "";

  @action
  void setNome(String value) => nome = value;

  @observable
  bool passVisible = false;

  @action
  void turnVisible() => passVisible = !passVisible;

  @observable
  String cpf = "";

  @action
  void setCpf(String value) => cpf = value;

  @observable
  String pass = "";

  @action
  void setPass(String value) => pass = value;

  @observable
  String confirmPass = "";

  @action
  void setConfirmPass(String value) => confirmPass = value;

  @observable
  String telefone = "";

  @action
  void setTelefone(String value) => telefone = value;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get isFormValid =>
      pass.length > 3 &&
      pass == confirmPass &&
      telefone.length == 15 &&
      cpf.length == 14 &&
      nome.length > 6;
}
