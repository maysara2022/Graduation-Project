import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn,sub ,userId}

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPrefereces;
  static SharedPrefController? _instace;

  factory SharedPrefController() {
    return _instace ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPrefereces = await SharedPreferences.getInstance();
  }

  Future<void> save({required String email, String? sub,String? userId}) async {
    await _sharedPrefereces.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPrefereces.setString(PrefKeys.userId.name, userId!);
    await _sharedPrefereces.setString(PrefKeys.sub.name, sub!);
  }
  bool get loggedIn =>_sharedPrefereces.getBool(PrefKeys.loggedIn.name)??false;

  Future<bool>removeValueFor({required String key})async{
    if(_sharedPrefereces.containsKey(key)){
      await _sharedPrefereces.remove(key);

    }
    return false;
  }

  T? getValue<T>({required String key}) {
    if (_sharedPrefereces.containsKey(key)) {
      return _sharedPrefereces.get(key) as T?;
    }
    return null;
  }

  Future<bool> clear() {
   return _sharedPrefereces.clear();
  }
}
