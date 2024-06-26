// ignore_for_file: prefer_const_constructors, unused_element, unused_import, depend_on_referenced_packages

import 'dart:io';
// import 'package:bitebox/user/accountpage/profile.dart';
// import 'package:bitebox/models/user_login.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quickspot/fuctions/loginfunctions.dart';
import 'package:quickspot/models/login.dart';
import 'package:quickspot/userscreen/profile_new.dart';


class EditProfileScreen extends StatefulWidget {
  final User? user;

  const EditProfileScreen({Key? key, required this.user})
      : super(key: key);

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  // String? _selectedImage;
  // final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    // Initialize text controllers with current user data
    nameController.text = widget.user!.username;
    emailController.text = widget.user!.email;
   numberController.text = widget.user!.mobile;
    // _selectedImage = widget.user!.mobile;
  }

  // void _selectImage1() async {
  //   final selectedimg1 =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if (selectedimg1 != null) {
  //     setState(() {
  //       // _selectedImage = selectedimg1.path;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 6, 49, 83),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(Icons.restore))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // InkWell(
            //   onTap: _selectImage1,
            //   child: CircleAvatar(
            //     radius: 90,
            //     // ignore: unnecessary_null_comparison
            //     backgroundImage: widget.currentUser!.number != null
            //         ? FileImage(File(_selectedImage!))
            //         : null,
            //     child: _selectedImage == null
            //         ? Image.asset('images/prf.jpeg')
            //         : null,
            //   ),
            // ),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: numberController,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Save the edited profile data
          updateProfile(
            // _selectedImage!,
            emailController.text,
            nameController.text,
            numberController.text,
          );
          // Update the product in Hive

          // Pop the screen to go back to the profile screen
          Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => ProfilePage()));
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void updateProfile(String imagePath, String newName, String newNumber) {
    // Assuming you have a Hive box for users
    final userBox = Hive.box<User>(users);

    // Get the current user from the box
    User user = userBox.values.firstWhere(
      (user) => user.username == widget.user!.username,
    );

    // Update the user's profile information
    // currentUser.image = imagePath;
    user.username = newName;
    user.mobile = newNumber;

    // Save the updated user back to the box
    userBox.put(user.id, user);

    // If needed, you can also update the widget.currentUser with the new information
    // widget.currentUser = currentUser;
  }
}