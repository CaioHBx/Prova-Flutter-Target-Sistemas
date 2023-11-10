import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter_target_sistemas/mobX/home/home_mobx.dart';
import 'package:prova_flutter_target_sistemas/services/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textFormController = TextEditingController();
  FocusNode focusNode = FocusNode();
  final HomeStore _homeStore = HomeStore();
  final SharedPreferences _prefs = CacheService.instance.prefs;

  carregarLista() async {
    List<String> textosCache = _prefs.getStringList('textos') ?? [];
    _homeStore.carregarLista(textosCache.asObservable());
  }

  focarCampoDeTexto() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  salvarListaCache() {
    _prefs.setStringList('textos', _homeStore.textos);
  }

  @override
  void initState() {
    carregarLista();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background_image.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: Colors.white,
                    child: SizedBox(
                      height: 250,
                      width: double.maxFinite * 0.8,
                      child: Observer(builder: (_) {
                        switch (_homeStore.textos.isNotEmpty) {
                          case true:
                            return ListView.builder(
                              itemBuilder: (context, index) {
                                String texto = _homeStore.textos[index];
                                TextEditingController textController =
                                    TextEditingController(text: texto);
                                return ListTile(
                                  title: TextField(
                                    controller: textController,
                                  ),
                                  trailing: SizedBox(
                                    width: 100,
                                    height: 50,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            _homeStore.textos[index] =
                                                textController.text;
                                            salvarListaCache();
                                            focarCampoDeTexto();
                                          },
                                          icon: const Icon(Icons.edit),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            showDialog(
                                              barrierDismissible: false,
                                              context: context,
                                              builder: (context) => AlertDialog(
                                                title: const Text('Atenção'),
                                                content: const Text(
                                                  'Tem certeza que deseja excluir esse texto?',
                                                ),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      focarCampoDeTexto();
                                                    },
                                                    child: const Text(
                                                      'Cancelar',
                                                      style: TextStyle(
                                                        color: Colors.red,
                                                      ),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      _homeStore
                                                          .removerTexto(index);
                                                      salvarListaCache();
                                                      Navigator.pop(context);
                                                      focarCampoDeTexto();
                                                    },
                                                    child:
                                                        const Text('Confirmar'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          icon: const Icon(
                                            Icons.cancel,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              itemCount: _homeStore.textos.length,
                            );

                          default:
                            return const Center(
                              child: Text(
                                'Nenhum texto adicionado ainda.',
                                style: TextStyle(fontSize: 16),
                              ),
                            );
                        }
                      }),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: 'Digite seu Texto',
                    ),
                    autofocus: true,
                    onFieldSubmitted: (value) {
                      _homeStore.adicionarTexto(value);
                      salvarListaCache();
                      textFormController.clear();
                      focarCampoDeTexto();
                    },
                    controller: textFormController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
