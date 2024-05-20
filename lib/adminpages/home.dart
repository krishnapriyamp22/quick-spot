// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, unused_import, unused_local_variable, non_constant_identifier_names, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/adminpages/bookingdetails.dart';
import 'package:quickspot/adminpages/revenue.dart';
import 'package:quickspot/adminpages/slotlist.dart';
import 'package:quickspot/adminpages/userlist.dart';
import 'package:quickspot/custom%20widgets/adminhome.dart';
import 'package:quickspot/userscreen/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addslot.dart';

class Adminhome extends StatefulWidget {
  const Adminhome({super.key});

  @override
  State<Adminhome> createState() => _AdminhomeState();
}

class _AdminhomeState extends State<Adminhome> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    double screenWidth = MediaQuery.of(context).size.width;
    double ScreenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenHeight,
          decoration: BoxDecoration(
           // color: Color.fromARGB(255, 8, 5, 50)
            ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 100),
                child: Center(
                  child: Text(
                    'Admin Screens',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenHeight * 0.04,
              ),
              InkWell(
                child: adminhome(
                    screenWidth: screenWidth,
                    ScreenHeight: ScreenHeight,
                    text: 'USER LIST'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UsersListScreen()));
                },
              ),
              SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                child: adminhome(
                    screenWidth: screenWidth,
                    ScreenHeight: ScreenHeight,
                    text: 'ADD SLOT'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddSlot()));
                },
              ),
              SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                child: adminhome(
                    screenWidth: screenWidth,
                    ScreenHeight: ScreenHeight,
                    text: 'BOOKING DETAILS'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BookingDetail()));
                },
              ),
              SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                child: adminhome(
                    screenWidth: screenWidth,
                    ScreenHeight: ScreenHeight,
                    text: 'SLOT LIST'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AdminSlot()));
                },
              ),SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                child: adminhome(
                    screenWidth: screenWidth,
                    ScreenHeight: ScreenHeight,
                    text: 'REVENUE'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PaymentScreen()));
                },
              ),
              SizedBox(height: ScreenHeight * 0.05),
              InkWell(
                child: adminhome(
                    screenWidth: screenWidth,
                    ScreenHeight: ScreenHeight,
                    text: 'LOGOUT'),
                onTap: () {
                  alert(context);
                },
              ),
              SizedBox(height: ScreenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }

  void alert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Do you want to logout'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () => logout(),
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }
}
