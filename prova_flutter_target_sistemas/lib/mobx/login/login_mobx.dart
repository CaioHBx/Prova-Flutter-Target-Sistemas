import 'package:mobx/mobx.dart';
part 'login_mobx.g.dart';

class LoginStore = LoginStoreAbstract with _$LoginStore;

abstract class LoginStoreAbstract with Store {
  @observable
  bool esconderSenha = true;

  @action
  void alternarVisibilidade() {
    esconderSenha = !esconderSenha;
  }

  @observable
  bool manterLogin = false;

  @action
  void alternarManterLogin() {
    manterLogin = !manterLogin;
  }
}
