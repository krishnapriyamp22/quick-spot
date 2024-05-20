// ignore_for_file: override_on_non_overriding_member, prefer_typing_uninitialized_variables, non_constant_identifier_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, unused_import, sort_child_properties_last, unnecessary_import, use_key_in_widget_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickspot/userscreen/login.dart';
import 'package:quickspot/userscreen/signup.dart';


class Welcome extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(

        child: SingleChildScrollView(
          child: Padding(
              
            padding: EdgeInsets.all(30),
            child: Column(children: [
              Container(
                width: screenWidth * 0.85,
                height: ScreenHeight * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        'WELCOME',
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                      Text('QUICK SPOT',
                          style: TextStyle(color: Colors.white, fontSize: 40))
                    ],
                  ),
                ),
                 decoration: BoxDecoration(
            color: const Color.fromARGB(255, 6, 49, 83)
          ),
              ),
              //  row(text: context()=>(build(Home()))),
              SizedBox(width: 300),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage(), ));
                }, child: Text("Login")),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Signup(),));
                }, child: Text("SignUp"))
              ],
            )
            ]),
          ),
        ),
      ),
    );
  }
}
