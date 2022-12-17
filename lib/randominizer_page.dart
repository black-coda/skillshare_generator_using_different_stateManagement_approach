import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RandomizerPage extends HookWidget {
  final int max, min;
  final randomGenerated = Random();

  RandomizerPage({
    super.key,
    required this.min,
    required this.max,
  });

  @override
  Widget build(BuildContext context) {
    final generatedNumber = useState<int?>(null);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Randomizer"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Center(
                  child: Text(
                    generatedNumber.value?.toString() ?? "Generated a number",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
              ],
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              generatedNumber.value =
                  min + randomGenerated.nextInt(max + 1 - min);
            },
            label: const Text("Generate"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
