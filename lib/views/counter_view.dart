import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timerception/controllers/counter_controller.dart';
import 'package:timerception/views/counter_widget.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Consumer<CounterController>(
        builder: (context, controller, _) => ListView.builder(
          itemCount: controller.counters.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                CounterWidget(
                    index: index,
                    count: controller.counters[index].count,
                    onIncrease: () => controller.increaseCounter(index),
                    onDecrease: () => controller.decreaseCounter(index)
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => controller.removeCounter(index),
                    child: const Text("Remove counter")
                )
              ],
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<CounterController>(context, listen: false).addCounter(),
        child: const Icon(Icons.add),
      ),
    );
  }

}