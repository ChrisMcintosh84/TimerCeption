import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final int index;
  final int count;
  final Function() onIncrease;
  final Function() onDecrease;

  const CounterWidget({super.key, required this.index, required this.count, required this.onIncrease, required this.onDecrease});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: onDecrease,
            icon: const Icon(Icons.remove)
        ),
        Text("$count"),
        IconButton(
            onPressed: onIncrease,
            icon: const Icon(Icons.add)
        )
      ],
    );
  }

}