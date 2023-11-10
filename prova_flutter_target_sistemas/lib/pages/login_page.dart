import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:prova_flutter_target_sistemas/mobX/login/login_mobx.dart';
import 'package:prova_flutter_target_sistemas/pages/home_page.dart';
import 'package:prova_flutter_target_sistemas/services/cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final usuarioFormKey = GlobalKey<FormState>();
  final senhaFormKey = GlobalKey<FormState>();
  final TextEditingController usuarioTextController = TextEditingController();
  final TextEditingController senhaTextController = TextEditingController();
  final LoginStore _loginStore = LoginStore();
  final SharedPreferences _prefs = CacheService.instance.prefs;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Usuário',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  Form(
                    key: usuarioFormKey,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(Icons.person),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      maxLength: 20,
                      controller: usuarioTextController,
                      validator: (value) {
                        if (value == null || value == '') {
                          return 'Campo obrigatório.';
                        } else if (value.endsWith(' ')) {
                          return 'O campo não pode terminar com espaço.';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (_) => usuarioFormKey.currentState!.validate(),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Senha',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                  ),
                  Form(
                    key: senhaFormKey,
                    child: Observer(builder: (_) {
                      return TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          prefixIcon: const Icon(Icons.lock),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                            onPressed: () {
                              _loginStore.alternarVisibilidade();
                            },
                            icon: Icon(
                              _loginStore.esconderSenha
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                        ),
                        obscureText: _loginStore.esconderSenha,
                        maxLength: 20,
                        controller: senhaTextController,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Campo obrigatório.';
                          } else if (value.endsWith(' ')) {
                            return 'O campo não pode terminar com espaço.';
                          } else if (value.length < 2) {
                            return 'O campo deve conter ao menos 2 caracteres.';
                          } else if (!RegExp(r'^[a-zA-Z0-9]+$')
                              .hasMatch(value)) {
                            return 'O campo não deve ter caracteres especiais';
                          } else {
                            return null;
                          }
                        },
                        onChanged: (_) => senhaFormKey.currentState!.validate(),
                      );
                    }),
                  ),
                  Observer(builder: (_) {
                    return Row(
                      children: [
                        Checkbox(
                          value: _loginStore.manterLogin,
                          onChanged: (value) =>
                              _loginStore.manterLogin = value!,
                          fillColor: MaterialStateProperty.all(Colors.white),
                          checkColor: Colors.green,
                        ),
                        const Text(
                          'Manter Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )
                      ],
                    );
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: SizedBox(
                        width: 125,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color.fromRGBO(68, 189, 110, 1),
                            ),
                          ),
                          onPressed: () {
                            if (usuarioFormKey.currentState!.validate() &&
                                senhaFormKey.currentState!.validate()) {
                              _prefs.setBool('logado', _loginStore.manterLogin);
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(),
                                ),
                              );
                              usuarioTextController.clear();
                              senhaTextController.clear();
                            }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () async {
                      await launchUrl(Uri.parse('https://www.google.com.br'));
                    },
                    child: const Center(
                      child: Text(
                        'Política de Privacidade',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
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
