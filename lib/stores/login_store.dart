import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {


  @observable
  String email = "";

  @observable
  String token = "";

  @observable
  bool remember = false;

  @action
  toggleRemember(){
    remember = !remember;
  }

  @action
  void setEmail(value) {
    email = value;
  }

  @observable
  bool emailValid = true;

  @action
  void checkEmailValid(bool check) {
    if (check) {
      emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    } else {
      emailValid = true;
    }
  }
  @observable
  String pass = "";

  @action
  void setPass(value) {
    pass = value;
  }

  @observable
  bool passValid = true;

  @action
  void checkPassValid(bool check) {
    if (check) {
      passValid = pass.length > 7;
    } else {
      passValid = true;
    }
  }

  @action
  Future rememberCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (remember) {
      prefs.setString("email", this.email);
      prefs.setString("pass", this.pass);
      prefs.setString("remember", "1");
    } else {
      prefs.setString("email", "");
      prefs.setString("pass", "");
      prefs.setString("remember", "");
    }
  }


  @computed
  bool get isFormValid => pass.length > 7 && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
}
