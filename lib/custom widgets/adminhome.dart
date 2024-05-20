// ignore_for_file: prefer_const_constructors, sort_child_properties_last, camel_case_types, unnecessary_import, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class adminhome extends StatelessWidget {
   adminhome({
    super.key,
    required this.screenWidth,
    required this.ScreenHeight,
    required this.text,
  });

  final double screenWidth;
  final double ScreenHeight;
  String text;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: screenWidth * 0.69,
        height: ScreenHeight * 0.07,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),
            
            
          ],
          
        ),
        decoration: BoxDecoration(color:const Color.fromARGB(255, 6, 49, 83),borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
