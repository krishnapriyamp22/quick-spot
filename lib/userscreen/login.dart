// Remove this line since it's not needed for Flutter development

// ignore_for_file: prefer_const_constructors, unused_local_variable, use_build_context_synchronously, unused_element, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_import, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quickspot/adminpages/home.dart';
import 'package:quickspot/custom%20widgets/screencustom/Ulogin.dart';
import 'package:quickspot/main.dart';
import 'package:quickspot/models/login.dart';
import 'package:quickspot/userscreen/bottomnavi.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fuctions/loginfunctions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String adminusername = 'admin';
  String adminpassword = '1234';

  final formkey = GlobalKey<FormState>();
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void _submitform() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
    }
    String enteredusername = usernamecontroller.text;
    String enteredpassword = passwordcontroller.text;

    if (enteredpassword == adminpassword && enteredusername == adminusername) {
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(save_key, true);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Adminhome()));
    }

    login(
      usernamecontroller.text,
      passwordcontroller.text,
      context,
    );
  }

  void login(String username, String password, BuildContext context) async {
    final userBox = await Hive.openBox<User>(users);
    User? user;
    for (var i = 0; i < userBox.length; i++) {
      final currentuser = userBox.getAt(i);
      if (currentuser?.username == username &&
          currentuser?.password == password) {
        user = currentuser;
        break;
      }
    }
    if (user != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isloggedin', true);
      await prefs.setString('user', username);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomesScreenPage()),
          result: (route) => false);
    } else if (username == 'admin' && password == '1234') {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Adminhome(),
          ));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Invalid email or password'),
            actions: [tectbutton(),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 90),
                child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(height: ScreenHeight * 0.07,),
              form(formkey: formkey, usernamecontroller: usernamecontroller, passwordcontroller: passwordcontroller),
              Padding(
                padding: const EdgeInsets.only(left: 120, right: 120, top: 10),
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      login(usernamecontroller.text, passwordcontroller.text,
                          context);}
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(255, 6, 49, 83),
                  )),
                 child: Text(
                    'Login',
                    style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              center(),
            ],
          ),
        ),
      ),
    );
  }
}

