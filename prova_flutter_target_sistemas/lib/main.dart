import 'package:flutter/material.dart';
import 'package:prova_flutter_target_sistemas/pages/home_page.dart';
import 'package:prova_flutter_target_sistemas/pages/login_page.dart';
import 'package:prova_flutter_target_sistemas/services/cache_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.instance.iniciarClasse();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isLogado =
        CacheService.instance.prefs.getBool('logado') ?? false;
    return MaterialApp(
      title: 'Prova Flutter Target Sistemas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: isLogado ? const HomePage() : LoginPage(),
    );
  }
}
