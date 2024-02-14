import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:timerception/models/timer_model.dart';

class TimerController extends ChangeNotifier {
  late TimerModel _timerModel;
  late Timer _timer;
  bool _isActive = false;

  TimerController({required TimerModel timerModel}) {
    _timerModel = timerModel;
    _timerModel.duration = const Duration(seconds: 60);
  }

  Duration get duration => _timerModel.duration;
  bool get isActive => _isActive;

  void startTimer() {
    if (!_isActive) {
      _isActive = true;
      _timer = Timer.periodic(const Duration(seconds: 1), _countDownTimer);
    }
  }

  void stopTimer() {
    _isActive = false;
    _timer.cancel();
    notifyListeners();
  }

  void resetTimer() {
    _isActive = false;
    _timerModel.duration = const Duration(seconds: 60);
    notifyListeners();
  }

  void _updateTimer(Timer timer) {
    _timerModel.duration = _timerModel.duration + const Duration(seconds: 1);
    notifyListeners();
  }

  void _countDownTimer(Timer timer) {
    final seconds = _timerModel.duration.inSeconds - 1;
    if (seconds < 0) {
      _timer.cancel();
      notifyListeners();
    }
    else {
      _timerModel.duration = Duration(seconds: seconds);
      notifyListeners();
    }
  }

  void setDuration(Duration duration) {
    _timerModel.duration = duration;
    notifyListeners();
  }
}