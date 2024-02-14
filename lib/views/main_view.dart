import 'package:flutter/material.dart';
import 'package:timerception/views/timer_view.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TimerCeption"),
      ),
      body: Stack(
        children: [
          ListView(
          children: [
            TimerView(),
          ],
        ),
          Positioned(
            bottom: 0,
              right: 0,
              child: FloatingActionButton(
                  onPressed: () => {
                    print('New timer')
                  },
                child: const Icon(Icons.add),
              ),
          )
        ]
      )
    );
  }

}