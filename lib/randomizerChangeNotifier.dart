import 'dart:math';

import 'package:flutter/foundation.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  final _randomGenerator = Random();

  int? _generatedNumber;

  int? get generatedNumber => _generatedNumber;

  int max = 0;
  int min = 0;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt(max + 1 - min);

    // Rebuild UI observing the change 🚀🚀
    notifyListeners();
  }
}

// Provider package is used to provide objects around widget tree
