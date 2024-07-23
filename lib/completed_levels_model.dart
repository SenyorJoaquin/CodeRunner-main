import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class CompletedLevelsModel extends ChangeNotifier {
  Map<String, Set<int>> _completedLevels = {
    'Flutter': {},
    'Swift': {},
  };

  Map<String, Set<int>> get completedLevels => _completedLevels;

  void markLevelAsCompleted(String language, int levelIndex) {
    _completedLevels[language]?.add(levelIndex);
    notifyListeners();
  }
}
