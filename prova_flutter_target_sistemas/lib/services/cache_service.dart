import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  late SharedPreferences prefs;

  CacheService._privateConstructor();

  static final CacheService instance = CacheService._privateConstructor();

  Future<void> iniciarClasse() async {
    prefs = await SharedPreferences.getInstance();
  }
}
