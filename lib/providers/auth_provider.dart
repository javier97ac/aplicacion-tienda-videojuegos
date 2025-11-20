import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  static const _kUserKey = 'auth_user';
  String? _user;
  bool get isLoggedIn => _user != null;
  String? get user => _user;

  AuthProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    _user = prefs.getString(_kUserKey);
    notifyListeners();
  }

  Future<bool> login({required String username, required String password}) async {
    // Mock login: accept any non-empty username/password
    await Future.delayed(const Duration(milliseconds: 500));
    if (username.isNotEmpty && password.isNotEmpty) {
      _user = username;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kUserKey, username);
      notifyListeners();
      return true;
    }
    return false;
  }

  Future<void> logout() async {
    _user = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_kUserKey);
    notifyListeners();
  }
}
