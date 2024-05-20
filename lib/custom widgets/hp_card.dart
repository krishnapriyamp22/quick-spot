// ignore_for_file: prefer_const_constructors, unused_import, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';


class HomePageContainer extends StatelessWidget {
  HomePageContainer(
      {super.key,
      required this.screenWidth,
      required this.ScreenHeight,
      required this.text,
      required this.x});

  final double screenWidth;
  final double ScreenHeight;
  String text;
  Icon x;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255), borderRadius: BorderRadius.circular(40)),
      //decoration: BoxDecoration( color:Colors.grey, BorderRadius.all(Radius.circular(3))),
      //color: Colors.grey,
      width: screenWidth * 0.80,
      height: ScreenHeight * 0.2,
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 25),
          ),
          x,
          
        ],
        
      ),
    );
  }
}

//welcome page


