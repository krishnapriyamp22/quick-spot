// ignore_for_file: unused_import, prefer_const_constructors

import 'dart:io';

//import 'package:bitebox/admin/admin_ui/admin_home.dart';
import 'package:flutter/material.dart';
import 'package:quickspot/adminpages/home.dart';
import 'package:quickspot/fuctions/loginfunctions.dart';
import 'package:quickspot/models/login.dart';


Userfunction sign = Userfunction();

class UsersListScreen extends StatefulWidget {
  const UsersListScreen({Key? key}) : super(key: key);

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
  @override
  void initState() {
    super.initState();
    sign.getallvalue();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color.fromARGB(255, 6, 49, 83),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Adminhome()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              color: const Color.fromARGB(255, 255, 252, 252),
            )),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Users List',
          //style: TextStyle(color: Colors.black),
        ),
      ),
      body: ValueListenableBuilder(
          valueListenable: userlist,
          builder: (context, List<User> signuplist, Widget? child) {
            //  final userdatas = userBox.values.toList();
            return ListView.builder(
              itemCount: signuplist.length,
              itemBuilder: (BuildContext context, int index) {
                final userdata = signuplist[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Container(
                        height: 110,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.black)),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userdata.username,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 8, top: 8),
                                      child: Text(userdata.email,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                  ],
                                ),
                                Icon(Icons.verified_sharp),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }),
    );
  }
}
