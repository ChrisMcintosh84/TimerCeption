import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timerception/controllers/timer_controller.dart';
import 'package:timerception/widgets/timer_widget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TimerCaption"),
      ),
      body: Consumer<TimerController>(
        builder: (context, controller, _) => ListView.builder(
          itemCount: controller.timerModels.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                TimerWidget(
                    index: index,
                    duration: controller.timerModels[index].duration,
                    onSetDuration: () => controller.setDuration(const Duration(seconds: 10)),
                    onStart: () => controller.startTimer(index),
                    onStop: () => controller.stopTimer(index),
                    onReset: () => controller.resetTimer(index),
                  isActive: controller.isActive,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => controller.removeTimer(index),
                    child: const Text("Remove timer")
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<TimerController>(context, listen: false).addTimer(),
        child: const Icon(Icons.add),
      ),
    );

    // final mainController = Provider.of<MainController>(context);
    //
    // return Scaffold(
    //   appBar: AppBar(
    //     title: const Text("TimerCeption"),
    //   ),
    //   body: Stack(
    //     children: [
    //       ListView.builder(
    //         itemCount: mainController.timerViewList.length,
    //           itemBuilder: (context, index) {
    //           return mainController.timerViewList[index];
    //           }
    //       ),
    //       Positioned(
    //         bottom: 0,
    //           right: 0,
    //           child: FloatingActionButton(
    //               onPressed: () => {
    //                 mainController.addNewTimer()
    //               },
    //             child: const Icon(Icons.add),
    //           ),
    //       )
    //     ]
    //   )
    // );
  }

}