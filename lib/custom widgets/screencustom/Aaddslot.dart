

// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Aaddslot extends StatelessWidget {
  const Aaddslot({
    super.key,
    required this.slottnumbercontroller,
  });

  final TextEditingController slottnumbercontroller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: slottnumbercontroller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        fillColor: Color(0xABFFFEFE),
        labelText: 'Slot Number',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2.0,
          ),
        ),
      ),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a Slot Number';
        }
        // if (double.tryParse(value) == null) {
        //   return 'Please enter a valid Slot Number';
        // }
        return null;
      },
      onSaved: (value) {
        slottnumbercontroller.text = value!;
      },
    );
  }
}