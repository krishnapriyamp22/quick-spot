// ignore_for_file: camel_case_types, prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:quickspot/userscreen/signup.dart';


class form extends StatelessWidget {
  const form({
    super.key,
    required this.formkey,
    required this.usernamecontroller,
    required this.passwordcontroller,
  });

  final GlobalKey<FormState> formkey;
  final TextEditingController usernamecontroller;
  final TextEditingController passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: usernamecontroller,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    labelText: "User Name",
                    hintText: "Enter the User Name",
                    helperText: "Enter your valid Use name"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter username';
                  }
                  return null;
                },
              ),
            ),
          ),
          // SizedBox(
          //   height: 2,
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10,left: 15,right: 15),
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: TextFormField(
                controller: passwordcontroller,
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                   prefixIcon: Icon(Icons.lock,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      // borderSide: BorderSide(
                      //   color: Colors.white,
                      //   width: 2,
                      // )
                    ),
                    labelText: "Password",
                    hintText: "Enter password",
                    helperText: "At least 6 characters"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter the password';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class center extends StatelessWidget {
  const center({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
            ),
            child: Text(
              'New User?',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 10),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text(
                'Signup',
                style: TextStyle(
                    color: Color.fromARGB(255, 100, 181, 207),
                    fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//textbutton
class tectbutton extends StatelessWidget {
  const tectbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => Navigator.pop(context),
      child: const Text('OK'),
    );
  }
}

