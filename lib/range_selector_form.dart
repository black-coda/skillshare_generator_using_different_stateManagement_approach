import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skillshare_generator/randomizerChangeNotifier.dart';

typedef IntValueSetter = void Function(int value);

class RangeForm extends StatelessWidget {
  const RangeForm({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RangeSelectorTextFormField(
              label: "Minimum",
              // assigning value in CustomNotifier (min and max) to value passed from callback intValueSetter
              onSavedSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().min = value,
            ),
            const SizedBox(
              height: 20,
            ),
            RangeSelectorTextFormField(
              label: "Maximum",
              onSavedSetter: (value) =>
                  context.read<RandomizerChangeNotifier>().max = value,
            ),
          ],
        ),
      ),
    );
  }
}

class RangeSelectorTextFormField extends StatelessWidget {
  const RangeSelectorTextFormField({
    super.key,
    required this.label,
    required this.onSavedSetter,
  });

  final String label;
  final IntValueSetter onSavedSetter;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || int.tryParse(value) == null) {
          return "Must be an integer";
        } else {
          return null;
        }
      },
      onSaved: (newValue) {
        onSavedSetter(
          int.parse(newValue ?? ''),
        );
      },
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: label,
      ),
      keyboardType: const TextInputType.numberWithOptions(
        decimal: false,
        signed: true,
      ),
    );
  }
}


