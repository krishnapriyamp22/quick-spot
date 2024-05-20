// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, avoid_print, avoid_unnecessary_containers, unused_import, depend_on_referenced_packages

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quickspot/fuctions/loginfunctions.dart';
import 'package:quickspot/models/login.dart';
import 'package:quickspot/userscreen/editprofile.dart';
import 'package:quickspot/userscreen/login.dart';

import 'package:shared_preferences/shared_preferences.dart';
Userfunction sighn = Userfunction();
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';
  User? user;

  @override
  void initState() {
    super.initState();
    loginsave();
  }

  

  Future<void> loginsave() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
     username= prefs.getString('user') ?? '';
    
    final userBox = await Hive.openBox<User>(users);
    user = userBox.values.firstWhere(
      (user) => user.username == username,
    );
    print('${user!.username}');
    setState(() {
      sighn.getallvalue();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('profile'),
        centerTitle: true,
          backgroundColor:const Color.fromARGB(255, 6, 49, 83),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>EditProfileScreen(user: user,)));
          }, icon: Icon(Icons.edit))
        ],),
        body: user != null
            ? SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   height: 200,
                    //   width: 600,
                    //   color: Colors.grey,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Container(
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(2.0),
                    //         child: CircleAvatar(
                    //          radius: 150,
                    //           backgroundImage: FileImage(File(currentUser!.mobile))),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.deepPurple,
                          ),
                          title: Text(
                            "${user!.username}",
                          ),
                        ),
                           ListTile(
                      leading: Icon(
                        Icons.email,
                        color: Colors.red[400],
                      ),
                      title: Text(
                        "${user!.email}",
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.phone_iphone_rounded,
                        color: Colors.red[400],
                      ),
                      title: Text(
                        "${user!.mobile}",
                      ),   
                    ),
                      ],
                    ),
                  ],
                ),
              )
            : Center(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 200,
                      ),
                      Text("USER NOT LOGGED IN"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: Text("PROCEED TO LOGIN"))
                    ],
                  ),
                ),
              ));
  }
}