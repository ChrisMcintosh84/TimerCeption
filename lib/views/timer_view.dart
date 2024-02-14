import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timerception/controllers/timer_controller.dart';
import 'package:timerception/models/timer_model.dart';

class TimerView extends StatelessWidget {
  TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    final timerController = Provider.of<TimerController>(context);
    String strDigits (int n) => n.toString().padLeft(2, '0');
    final hours = strDigits(timerController.duration.inHours.remainder(24));
    final minutes = strDigits(timerController.duration.inMinutes.remainder(60));
    final seconds = strDigits(timerController.duration.inSeconds.remainder(60));

    return timerCard(hours, minutes, seconds, timerController, context);

    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("Timerception"),
    //   ),
    //   body: Column (
    //     children: [
    //       Text("Timer: $hours:$minutes:$seconds"),
    //       ElevatedButton(onPressed: timerController.isActive ? null : timerController.startTimer,
    //        child: const Text("Start")),
    //       ElevatedButton(onPressed: () => {
    //         timerController.stopTimer()
    //       }, child: const Text("Stop")),
    //       ElevatedButton(onPressed: timerController.isActive ? null : timerController.resetTimer,
    //           child: const Text("Reset")),
    //       ElevatedButton(onPressed: () async {
    //         var resultingDuration = await showDurationPicker(
    //             context: context,
    //             initialTime: Duration.zero);
    //
    //         if (resultingDuration != null) {
    //           timerController.setDuration(resultingDuration);
    //         }
    //           }, child: const Text("Choose time"))
    //     ],
    //   ),
    // );
  }

  Widget timerCard(String hours, String minutes, String seconds, TimerController timerController, BuildContext context) {
    return Card(
      child: Stack(
        children: [
          Column(
          children: [
            const SizedBox(height: 20),
            Text("Timer: $hours: $minutes: $seconds"),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: timerController.isActive ? null : timerController.startTimer,
                    child: const Text("Start")),
                ElevatedButton(onPressed: () => {
                  timerController.stopTimer()
                }, child: const Text("Stop")),
                ElevatedButton(onPressed: timerController.isActive ? null : timerController.resetTimer,
                    child: const Text("Reset")),
                ElevatedButton(onPressed: () async {
                  var resultingDuration = await showDurationPicker(
                      context: context,
                      initialTime: Duration.zero);

                  if (resultingDuration != null) {
                    timerController.setDuration(resultingDuration);
                  }
                }, child: const Text("Choose time"))
              ],
            )
          ],
        ),
          Positioned(
            top: 0,
              right: 0,
              child: FloatingActionButton(
                  onPressed: () => {
                  print('Close widget')
                  },
                child: const Icon(Icons.close),
              )
          )
        ]
      ),
    );
  }
}