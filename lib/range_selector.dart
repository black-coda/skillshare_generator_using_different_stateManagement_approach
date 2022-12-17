import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:skillshare_generator/randominizer_page.dart';

import 'range_selector_form.dart';

class RangeSelectorPage extends HookWidget {
  final formKey = GlobalKey<FormState>();
  RangeSelectorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final min = useState<int>(0);
    final max = useState<int>(0);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Select Range"),
        ),
        body: RangeForm(
          formKey: formKey,
          minValueSetter: (value) => min.value = value,
          maxValueSetter: (value) => max.value = value,
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
                    return RandomizerPage(
                      max: max.value,
                      min: min.value,
                    );
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
