import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillshare_generator/randomizerChangeNotifier.dart';

import 'range_selector.dart';

void main() {
  runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // Passing Custom Notifier around app
      create: (context) => RandomizerChangeNotifier(),
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
