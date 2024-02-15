import 'dart:async';

class TimerModel {

  Duration _duration = const Duration(seconds: 10);
  Duration get duration => _duration;
  Duration setDuration(Duration duration) => _duration = duration;

  updateDuration() {
    _duration = _duration - const Duration(seconds: 1);
  }

  Timer _timer = Timer(const Duration(hours: 1), () { });
  Timer get timer => _timer;
  Timer setTimer(Timer timer) => _timer = timer;

  TimerModel();

  TimerModel.fromJson(Map<String, dynamic> json)
  : _duration = json['duration'] as Duration;

  Map<String, dynamic> toJson() => {
    'duration': duration
  };
}