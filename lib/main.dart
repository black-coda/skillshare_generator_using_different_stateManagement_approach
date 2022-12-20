import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:provider/provider.dart';
import 'package:skillshare_generator/randomizerChangeNotifier.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'range_selector.dart';

void main() {
  runApp(const AppWidget());
}

//Riverpod Randomizer provider
final randomizerProvider = ChangeNotifierProvider((ref)=> RandomizerChangeNotifier());

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      // Passing Custom Notifier around app

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: RangeSelectorPage(),
      ),
    );
  }
}
