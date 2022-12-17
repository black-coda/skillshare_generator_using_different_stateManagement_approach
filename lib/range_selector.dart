import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skillshare_generator/randominizer_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Range"),
        ),
        body: RangeForm(
          formKey: formKey,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Validate using globalKey created in form
            if (formKey.currentState?.validate() == true) {
              formKey.currentState?.save();

              // Navigate to generator page

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return RandomizerPage();
                  },
                ),
              );
            }
          },
          child: const Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
