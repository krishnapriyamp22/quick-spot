// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class textformfield extends StatelessWidget {
  const textformfield({
    super.key,
    required this.vehiclenumController,
  });

  final TextEditingController vehiclenumController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: vehiclenumController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Vehicle NO';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(66, 75, 93, 141),
        labelText: 'Vehicle NO',
        helperText: 'Enter your Vehicle NO',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class textformfield1 extends StatelessWidget {
  const textformfield1({
    super.key,
    required this.ownernameController,
  });

  final TextEditingController ownernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: ownernameController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Vehicle Owner Name';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(66, 75, 93, 141),
        labelText: 'Vehicle Owner Name',
        helperText: 'Enter Vehicle Owner Name',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class textformfield3 extends StatelessWidget {
  const textformfield3({
    super.key,
    required this.modelController,
  });

  final TextEditingController modelController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: modelController,
     // obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Vehicle Model';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(66, 75, 93, 141),
        labelText: 'Vehicle Model',
        helperText: 'Enter your Vehicle Model',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}

class textformfield4 extends StatelessWidget {
  const textformfield4({
    super.key,
    required this.licenseController,
  });

  final TextEditingController licenseController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: licenseController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) 
      {
        if (value == null || value.isEmpty) {
          return 'Please enter Licence NO';
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(66, 75, 93, 141),
        labelText: 'Licence NO',
        helperText: 'Enter your Licence NO',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}


