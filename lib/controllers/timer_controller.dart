import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:timerception/models/timer_model.dart';

class TimerController extends ChangeNotifier {
  TimerModel _timerModel = TimerModel();
  late Timer _timer;
  bool _isActive = false;

  List<TimerModel> timerModels = [];

  Duration get duration => _timerModel.duration;
  bool get isActive => _isActive;

  void startTimer(int index) {
    // if (!_isActive) {
    //   _isActive = true;
    //   _timer = Timer.periodic(const Duration(seconds: 1), _countDownTimer);
    //   print('started');
    // }
    // timerModels[index].setTimer(Timer.periodic(const Duration(seconds: 1), _countDownTimer));

    if (!_isActive) {
      _isActive = true;

      timerModels[index].setTimer(Timer.periodic(const Duration(seconds: 1), (timer) {
        _updateTimer(index);
      }));
    }

    notifyListeners();
  }

  void stopTimer(int index) {
    _isActive = false;
    // _timer.cancel();
    // notifyListeners();
    timerModels[index].timer.cancel();
    notifyListeners();
  }

  void resetTimer(int index) {
    _isActive = false;
    // _timerModel.setDuration(const Duration(seconds: 60));
    // notifyListeners();
    timerModels[index].setDuration(const Duration(seconds: 60));
    notifyListeners();
  }

  void _updateTimer(int index) {
    // _timerModel.setDuration(_timerModel.duration + const Duration(seconds: 1));
    // timerModels[index].updateRemainingTime();
    timerModels[index].updateDuration();
    notifyListeners();
  }

  void _countDownTimer(Timer timer) {
    final seconds = _timerModel.duration.inSeconds - 1;
    if (seconds < 0) {
      // _timer.cancel();
      // timerModels[index].timer.cancel();
      notifyListeners();
      print('boop');
    }
    else {
      // _timerModel.setDuration(Duration(seconds: seconds));
      // timerModels[index].setDuration(Duration(seconds: seconds));
      notifyListeners();
      print('beep');
    }
  }

  void setDuration(Duration duration) {
    _timerModel.setDuration(duration);
    notifyListeners();
  }

  void addTimer() {
    timerModels.add(TimerModel());
    notifyListeners();
  }
  void removeTimer(int index) {
    timerModels.removeAt(index);
    notifyListeners();
  }
}