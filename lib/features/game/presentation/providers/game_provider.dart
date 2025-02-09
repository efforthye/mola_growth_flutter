import 'package:flutter/foundation.dart';
import '../../domain/entities/player.dart';

class GameProvider extends ChangeNotifier {
  Player _player = const Player(health: 100, score: 0);
  bool _isGameOver = false;

  Player get player => _player;
  bool get isGameOver => _isGameOver;

  void updateHealth(int value) {
    _player = Player(
      health: value,
      score: _player.score,
    );
    if (_player.health <= 0) {
      _isGameOver = true;
    }
    notifyListeners();
  }

  void resetGame() {
    _player = const Player(health: 100, score: 0);
    _isGameOver = false;
    notifyListeners();
  }
}
