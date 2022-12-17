import 'package:flutter/material.dart';

typedef IntValueSetter = void Function(int value);

class RangeForm extends StatelessWidget {
  const RangeForm({
    super.key,
    required this.formKey,
    required this.minValueSetter,
    required this.maxValueSetter,
  });

  final GlobalKey<FormState> formKey;

  final IntValueSetter minValueSetter;
  final IntValueSetter maxValueSetter;

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
              onSavedSetter: minValueSetter,
            ),
            const SizedBox(
              height: 20,
            ),
            RangeSelectorTextFormField(
              label: "Maximum",
              onSavedSetter: maxValueSetter,
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
