import 'package:mobx/mobx.dart';
part 'home_mobx.g.dart';

class HomeStore = HomeStoreAbstract with _$HomeStore;

abstract class HomeStoreAbstract with Store {
  @observable
  ObservableList<String> textos = ObservableList<String>();

  @action
  void carregarLista(List<String> lista) {
    textos = lista.asObservable();
  }

  @action
  void adicionarTexto(String texto) {
    textos.add(texto);
  }

  @action
  void editTexto(int index, String novoTexto) {
    textos[index] = novoTexto;
  }

  @action
  void removerTexto(int index) {
    textos.removeAt(index);
  }
}
