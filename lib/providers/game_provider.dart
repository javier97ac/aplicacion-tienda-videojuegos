import 'package:flutter/material.dart';
import '../models/game.dart';
import '../services/api_service.dart';

class GameProvider extends ChangeNotifier {
  final ApiService _api = ApiService();
  List<Game> _games = [];
  String? _error;
  bool _loading = false;

  List<Game> get games => _games;
  String? get error => _error;
  bool get loading => _loading;

  Future<void> fetchGames() async {
    _loading = true;
    _error = null;
    notifyListeners();
    try {
      _games = await _api.fetchGames();
    } catch (e) {
      _error = e.toString();
    }
    _loading = false;
    notifyListeners();
  }
}
