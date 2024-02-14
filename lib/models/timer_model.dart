class TimerModel {

  Duration duration;

  TimerModel({required this.duration});

  TimerModel.fromJson(Map<String, dynamic> json)
  : duration = json['duration'] as Duration;

  Map<String, dynamic> toJson() => {
    'duration': duration
  };
}