import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skillshare_generator/main.dart';

// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:provider/provider.dart';

import 'randomizerChangeNotifier.dart';

class RandomizerPage extends ConsumerWidget {
  const RandomizerPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final randomizer = ref.watch(randomizerProvider);
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
                  randomizer.generatedNumber?.toString() ??
                      "Generated a number",
                  style: Theme.of(context).textTheme.headline4,
                )
                    // Text(
                    //   // Reading value from notifier not watching it
                    //   // Wrong line of code, because it is not rebuilding the widget
                    //   // context
                    //   //         .read<RandomizerChangeNotifier>()
                    //   //         .generatedNumber
                    //   //         ?.toString() ??
                    //   //     "Generated a number",
                    //   style: Theme.of(context).textTheme.headline4,
                    // ),
                    ),
              ],
            )
          ],
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton.extended(
            onPressed: () {
              // calling generateRandomNumber from RandomizerChangeNotifier
              ref.read(randomizerProvider).generateRandomNumber();
            },
            label: const Text("Generate"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
