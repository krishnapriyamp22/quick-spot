// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quickspot/fuctions/loginfunctions.dart';
import 'package:quickspot/models/login.dart';
import 'package:quickspot/userscreen/login.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    } else if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 34,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: usernameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    labelText: 'Full Name',
                    helperText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    labelText: 'Email',
                    helperText: 'Enter your email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (!RegExp(
                            r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$')
                        .hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    labelText: 'Phone number',
                    helperText: 'Enter your 10-digit phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    } else if (value.length != 10) {
                      return 'Please enter a valid 10-digit phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    labelText: 'Password',
                    helperText: 'Enter a password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: passwordValidator,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,size: 20,),
                    filled: true,
                    fillColor: Color.fromARGB(66, 75, 93, 141),
                    labelText: 'Confirm Password',
                    helperText: 'Re-enter your password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: confirmPasswordValidator,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      User user = User(
                        username: usernameController.text.trim(),
                        email: emailController.text.trim(),
                        mobile: numberController.text.trim(),
                        password: passwordController.text.trim(),
                        confirmpass: confirmPasswordController.text.trim(),
                        id: -1,
                      );
                      await Userfunction().loginsave(user);

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 6, 49, 83),
                    ),
                  ),
                  child: Text('Signup'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
