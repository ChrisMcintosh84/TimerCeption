import 'package:flutter/material.dart';

class TimerWidget extends StatelessWidget {
  final int index;
  final Duration duration;
  final bool isActive;

  final Function() onSetDuration;
  final Function() onStart;
  final Function() onStop;
  final Function() onReset;

  const TimerWidget(
      {super.key,
      required this.index,
      required this.duration,
      required this.onSetDuration,
      required this.onStart,
      required this.onStop,
      required this.onReset, required this.isActive});

  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(duration.inHours.remainder(24));
    final minutes = strDigits(duration.inMinutes.remainder(60));
    final seconds = strDigits(duration.inSeconds.remainder(60));

    return Column(
      children: [
        Text("$hours:$minutes:$seconds"),
        Row(
          children: [
            ElevatedButton(onPressed: isActive ? null : onStart, child: const Text("Start")),
            ElevatedButton(onPressed: onStop, child: const Text("Stop")),
            ElevatedButton(onPressed: isActive ? null : onReset, child: const Text("Reset")),
            ElevatedButton(onPressed: isActive ? null : onSetDuration, child: const Text("Set")),
          ],
        )
      ],
    );
  }
}
